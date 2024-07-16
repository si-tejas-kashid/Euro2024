//
//  String+Ext.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 12/07/24.
//

import Foundation

extension String {
    func convertToDate(dateFormat: DateFormats = .fixtures) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
    //        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }

    func convertDateFormat(sourceDateFormat : String, destinationFormat : String) -> String{

        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = sourceDateFormat;

        if let date = dateFormatter.date(from: self){
            dateFormatter.dateFormat = destinationFormat;
            return dateFormatter.string(from: date)
        }else{
            return ""
        }
    }

}
