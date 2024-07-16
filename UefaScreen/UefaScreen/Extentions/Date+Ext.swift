//
//  Date+Ext.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 12/07/24.
//

import Foundation

extension Date {
    func toString(format: DateFormats) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = .current
        return dateFormatter.string(from: self)
    }
    
    static var currentTimeStamp: Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
    
    func remainingDays(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
    func getCurrentTimeZone() -> String? {
        let seconds = TimeZone.current.secondsFromGMT()
        let hours = seconds/3600
        let minutes = abs(seconds/60) % 60
        let timeZone = String(format: "%+.2d:%.2d", hours,minutes)
        return timeZone
    }
    
    func getTimeDifference(firstDate: String?, secondDate: String?, dateformat: DateFormats) -> TimeInterval {
        let formatter = DateFormatter()
        formatter.dateFormat = dateformat.rawValue
        guard let first = formatter.date(from: firstDate ?? "") else { return 0 }
        guard let second = formatter.date(from: secondDate ?? "") else { return 0 }
        return (first - second )
    }

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    
    func dateFormatWithSuffix(date: String, dateFormat: DateFormats) -> String {
        let dt = date.convertToDate(dateFormat: dateFormat)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dt?.daySuffix()
        return dateFormatter.string(from: dt ?? .distantFuture)
    }

    func daySuffix() -> String {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.day, from: self)
        let dayOfMonth = components.day
        var suffix: String
        switch dayOfMonth {
        case 1, 21, 31:
            suffix = "st"
        case 2, 22:
            suffix = "nd"
        case 3, 23:
            suffix = "rd"
        default:
            suffix = "th"
        }
        return "dd'\(suffix)' MMMM yyyy"
    }
    
    func convertTimezoneOf(time: String?,from currentTimeZone: String, to requiredTimeZone: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: currentTimeZone)
        let temp = dateFormatter.date(from: time ?? String()) ?? Date()
        dateFormatter.timeZone = TimeZone(abbreviation: requiredTimeZone)
        return dateFormatter.string(from: temp)
    }
    func isSameDay(as date: Date) -> Bool {
            let calendar = Calendar.current
            return calendar.isDate(self, inSameDayAs: date)
        }
    
    
}

extension TimeInterval {
    //Get timeInterval in Minutes
    func asMinutes() -> Double { return self / (60.0) }
    
    //Get timeInterval in Hours
    func asHours() -> Double { return self / (60.0 * 60.0) }
    
    //Get timeInterval in Days
    func asDays()    -> Double { return self / (60.0 * 60.0 * 24.0) }
    
    //Get timeInterval in Weeks
    func asWeeks()   -> Double { return self / (60.0 * 60.0 * 24.0 * 7.0) }
    
    //Get timeInterval in Months
    func asMonths()  -> Double { return self / (60.0 * 60.0 * 24.0 * 30.4369) }
    
    //Get timeInterval in Years
    func asYears()   -> Double { return self / (60.0 * 60.0 * 24.0 * 365.2422) }
}

