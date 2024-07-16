//
//  CommonEnums.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 12/07/24.
//

import Foundation

enum DateFormats: String {
    case siListing = "yyyy-MM-dd HH:mm:ss"
    // 2023-02-17T17:39:00
    case siListing2 = "yyyy-MM-dd'T'HH:mm:Z"
    case siListing3 = "d MMM, yyyy"
    case siListing4 = "yyyy-MM-dd'T'HH:mm:ss"
    case ddMMMyyyy = "dd MMM, yyyy"
    case ddMMMMyyyy = "dd MMMM yyyy"
    case fixtures = "yyyy-MM-dd'T'HH:mmZ"
    case monthDay = "MMM d"
    case dayMonth = "d MMM"
    case dayMonthYear = "d MMM yyyy"
    case time = "HH:mm a"
    case monthDayTime = "MMM d, hh:mm a"
    case dayMonthTime = "d MMM, h:mm a"
    case dateRange = "ddMMyyyy"
    case scorecardDateFormat = "M/d/yyyy"
    case scorecardTimeFormat = "HH:mm"
    case scorecardTimeWithOffset = "HH:mmZ"
    case monthFullYear = "MMM yyyy"
    case monthDateYear = "MMM d, yyyy"
    case fullMonthFullYear = "MMMM yyyy"
    case dobSignup = "dd/MM/yyyy"
    case yyyyddHHmmssSSS = "yyyy-MM-dd HH:mm:ss.SSS"
    case dobProfile = "yyyy-MM-dd"
    case fanLoyalty = "dd MMM yyyy | HH:mm"
    case flpTransaction = "MMM dd yyyy | HH:mm"
    case newFixtures = "dd MMMM, yyyy"
    case fixturesTime = "yyyy-MM-dd HH:mm Z"
    case squadOldFormat = "MMMM dd, yyyy"
    case dateNowFormat = "yyyy-MM-dd HH:mm:ss Z"
    case HHmmss = "HH:mm:ss"
    case uefaPredictorDate = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    case uefaMatchCardDate = "dd MMMM 'at' HH:mm"
}
