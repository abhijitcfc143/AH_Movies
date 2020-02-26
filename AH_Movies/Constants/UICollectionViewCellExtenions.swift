//
//  UICollectionViewCellExtenions.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell{
    
    func cellAnimationFromTopToBottom(view : UIView) {
        let viewOriginX = view.frame.origin.x - 30.0
        view.transform = CGAffineTransform(translationX: 0, y: viewOriginX)
        view.alpha = 0
        
        UIView.transition(with: view, duration: 1, options: .curveEaseInOut, animations: {
            view.transform = CGAffineTransform.identity
            view.alpha = 1
        }, completion: nil)
    }
}
