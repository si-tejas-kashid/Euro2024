//
//  SubmitPredictionsRequest.swift
//  UefaScreen
//
//  Created by Kartikay Rane on 29/07/24.
//

import Foundation

// MARK: - SubmitPredictions
struct SubmitPredictions: Codable {
    let optType, tourid: Int
    let soccerMatchid: String
    let tourGamedayid, questionid, optionid, betCoin: Int
    let platformid, boosterid: Int
    let arrTeamid: [String]

    enum CodingKeys: String, CodingKey {
        case optType = "opt_type"
        case tourid
        case soccerMatchid = "soccer_matchid"
        case tourGamedayid = "tour_gamedayid"
        case questionid, optionid
        case betCoin = "bet_coin"
        case platformid, boosterid
        case arrTeamid = "arr_teamid"
    }
}
