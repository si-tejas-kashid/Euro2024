//
//  getUserPredictions.swift
//  UefaScreen
//
//  Created by Kartikay Rane on 30/07/24.
//

import Foundation

// MARK: - GetUserPredictions
struct GetUserPredictions: Codable {
    let data: GetUserPredictionsDataClass
    let meta: GetUserPredictionsMeta

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case meta = "Meta"
    }
}

// MARK: - DataClass
struct GetUserPredictionsDataClass: Codable {
    let answers: [GetUserPredictionsAnswer]
   // let points, rank, matchid: JSONNull?
    let gamedayid, retType: Int

    enum CodingKeys: String, CodingKey {
        case answers = "ANSWERS"
//        case points = "POINTS"
//        case rank = "RANK"
//        case matchid = "MATCHID"
        case gamedayid = "GAMEDAYID"
        case retType
    }
}

// MARK: - Answer
struct GetUserPredictionsAnswer: Codable {
    let matchid: String
    //let mhpoints: JSONNull?
    let optionid, isbooster: Int
    //let qtnanswer: JSONNull?
    let questionid: Int

    enum CodingKeys: String, CodingKey {
        case matchid = "MATCHID"
       // case mhpoints = "MHPOINTS"
        case optionid = "OPTIONID"
        case isbooster = "ISBOOSTER"
       // case qtnanswer = "QTNANSWER"
        case questionid = "QUESTIONID"
    }
}

// MARK: - Meta
struct GetUserPredictionsMeta: Codable {
    let message: String
    let retVal: Int
    let success: Bool
    let timestamp: Timestamp

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case retVal = "RetVal"
        case success = "Success"
        case timestamp = "Timestamp"
    }
}

// MARK: - Timestamp
struct Timestamp: Codable {
    let utcTime, istTime, cestTime: String

    enum CodingKeys: String, CodingKey {
        case utcTime = "UTCTime"
        case istTime = "ISTTime"
        case cestTime = "CESTTime"
    }
}

