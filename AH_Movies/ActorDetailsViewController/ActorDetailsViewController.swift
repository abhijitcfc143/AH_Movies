//
//  ActorDetailsViewController.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 26/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import UIKit

class ActorDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
        
    var actor : ActorModel?
    var movie : Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ActorDetailsViewController{
    
    func setupUI() {
        self.setupDelegateAndDatSource()
    }
}
