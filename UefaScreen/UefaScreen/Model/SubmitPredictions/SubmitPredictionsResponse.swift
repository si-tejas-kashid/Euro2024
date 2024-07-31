//
//  SubmitPredictions.swift
//  UefaScreen
//
//  Created by Kartikay Rane on 28/07/24.
//

import Foundation

// MARK: - SubmitPredictions
struct SubmitPredictionsResponse: Codable {
    let data: SubmitPredictionsDataClass
    let meta: SubmitPredictionsMeta

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case meta = "Meta"
    }
}

// MARK: - DataClass
struct SubmitPredictionsDataClass: Codable {
    let value: SubmitPredictionsValue
    let feedTime: FeedTime

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case feedTime = "FeedTime"
    }
}

// MARK: - Value
struct SubmitPredictionsValue: Codable {
    let retval: Int
   // let matchid: JSONNull?
}

// MARK: - Meta
struct SubmitPredictionsMeta: Codable {
    let message: String
    let retVal: Int
    let success: Bool
    let timestamp: FeedTime

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case retVal = "RetVal"
        case success = "Success"
        case timestamp = "Timestamp"
    }
}

