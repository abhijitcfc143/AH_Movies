//
//  UIViewControllerExtensions.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func hideShowActivityIndicatorView(show : Bool,activityIndicatorView : UIActivityIndicatorView) {
        if show{
            DispatchQueue.main.async {
                activityIndicatorView.startAnimating()
                self.view.isUserInteractionEnabled = false
            }
            
        }else{
            DispatchQueue.main.async {
                activityIndicatorView.stopAnimating()
                self.view.isUserInteractionEnabled = true
            }
        }
    }
}
