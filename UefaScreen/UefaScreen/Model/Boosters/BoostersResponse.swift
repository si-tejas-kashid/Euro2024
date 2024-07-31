//
//  BoostersResponse.swift
//  UefaScreen
//
//  Created by Kartikay Rane on 28/07/24.
//

import Foundation

// MARK: - BoostersResponse
struct BoostersResponse: Codable {
    let data: DataClass
    let meta: Meta

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case meta = "Meta"
    }
}

// MARK: - DataClass
struct BoostersResponseDataClass: Codable {
    //let value: JSONNull?
    let feedTime: FeedTime

    enum CodingKeys: String, CodingKey {
        //case value = "Value"
        case feedTime = "FeedTime"
    }
}


// MARK: - Meta
struct BoostersResponseMeta: Codable {
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

