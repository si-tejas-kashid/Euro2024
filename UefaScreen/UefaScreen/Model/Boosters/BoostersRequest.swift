//
//  BoostersRequest.swift
//  UefaScreen
//
//  Created by Kartikay Rane on 29/07/24.
//

import Foundation


// MARK: - Boosters
struct Boosters: Codable {
    let optType, tourid: Int
    let soccerMatchid: String
    let tourGamedayid, platformid, boosterid: Int

    enum CodingKeys: String, CodingKey {
        case optType = "opt_type"
        case tourid
        case soccerMatchid = "soccer_matchid"
        case tourGamedayid = "tour_gamedayid"
        case platformid, boosterid
    }
}
