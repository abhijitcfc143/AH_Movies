//
//  MovieDetailViewController+DelegatAndDatasource.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation
import UIKit

extension MovieDetailViewController : UITableViewDelegate,UITableViewDataSource{
    
    func setupDelegateAndDatSource() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 500
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(UINib(nibName: TableViewCellIds.movieImageTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIds.movieImageTableViewCell)
        self.tableView.register(UINib(nibName: TableViewCellIds.movieInfoTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIds.movieInfoTableViewCell)
        self.tableView.register(UINib(nibName: TableViewCellIds.movieReviewTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIds.movieReviewTableViewCell)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: TableViewCellIds.tableViewHeaderCell)
        self.tableView.register(UINib(nibName: TableViewCellIds.movieCastTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIds.movieCastTableViewCell)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if !self.fArray.isEmpty{
            return fArray.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !self.fArray.isEmpty{
            if let arrayCount = self.fArray[section].arrays{
                
                if let castArrray = self.fArray[safe : section]?.arrays as? [CastModel],!castArrray.isEmpty{
                    return 1
                }
                return arrayCount.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            if indexPath.row == 0{
                return showMovieImageTableViewCell(indexPath: indexPath)
            }else if indexPath.row == 1{
                return showMovieInfoTableViewCell(indexPath: indexPath)
            }
        }
        if let castArrray = self.fArray[safe : indexPath.section]?.arrays as? [CastModel],!castArrray.isEmpty{
            return showMovieCastTableViewCell(indexPath: indexPath)
        }
        if let reviewsArrray = self.fArray[safe : indexPath.section]?.arrays as? [ReviewModel],!reviewsArrray.isEmpty{
            return showMovieReviewTableViewCell(indexPath: indexPath)
        }
        
        return UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            if indexPath.row == 0{
                return self.tableView.frame.width / 1.8
            }else{
                return UITableView.automaticDimension
            }
        }
        
        if let castArrray = self.fArray[safe : indexPath.section]?.arrays as? [CastModel],!castArrray.isEmpty{
            return self.tableView.frame.width / 1.5
        }
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            if !self.fArray.isEmpty{
                if let reviewsArrray = self.fArray[safe : section]?.arrays as? [ReviewModel],!reviewsArrray.isEmpty{
                    return 50
                }
                if let castArrray = self.fArray[safe : section]?.arrays as? [CastModel],!castArrray.isEmpty{
                    return 50
                }
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if !self.fArray.isEmpty{
            if section != 0{
                let headerCell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIds.tableViewHeaderCell)
                headerCell?.textLabel!.text = self.fArray[section].sectionTitle
                headerCell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
                headerCell?.textLabel?.textColor = UIColor.white
                headerCell?.contentView.backgroundColor = UIColor.black
                return headerCell
            }
        }
        
        return UIView()
    }
}
