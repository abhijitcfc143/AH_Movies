//
//  DateFormatUtils.swift
//  AH_Movies
//
//  Created by Abhijit Hadkar on 25/02/20.
//  Copyright © 2020 Abhijit Hadkar. All rights reserved.
//

import Foundation


class DateFormatUtils : NSObject{
    
    class func dateFormatToDate(dateString : String) -> String {
        
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy-MM-dd"
        
        let dateToShow = DateFormatter()
        dateToShow.dateFormat = "MMM dd,yyyy"
        
        if let date = dateFomatter.date(from: dateString){
            return dateToShow.string(from: date)
        }
        
        return ""
    }
}
