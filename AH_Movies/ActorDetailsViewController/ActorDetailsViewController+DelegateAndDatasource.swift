//
//  ActorDetailsViewController+DelegateAndDatasource.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 26/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation
import UIKit

extension ActorDetailsViewController : UITableViewDelegate,UITableViewDataSource{
    
    func setupDelegateAndDatSource() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 500
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(UINib(nibName: TableViewCellIds.movieInfoTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIds.movieInfoTableViewCell)
        if let actorName = self.actor?.name{
            self.title = actorName
        }
        
        if let movieName = self.movie?.title{
            self.title = movieName
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return showMovieInfoTableViewCell(indexPath: indexPath)
    }
}
