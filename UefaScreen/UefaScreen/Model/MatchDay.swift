//
//  MatchCard.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 17/06/24.
//

import Foundation

// MARK: - MatchDay
struct MatchDays: Codable, Identifiable {
    var id: UUID{ UUID()}
    let title: String?
    let matchDayID: Int?
    let dateRange: String?
    let points: Int?
    let matches: [Match]?
    
    enum CodingKeys: String, CodingKey {
        case matchDayID = "matchday_id"
        case dateRange = "date_range"
        case title, points, matches
    }
}

// MARK: - Match
struct Match: Codable, Identifiable {
    var id = UUID()
    let matchid: String?
    let matchDate: String?
    let team1Name: String?
    let team1Shortname: String?
    let team2Name: String?
    let team2Shortname: String?
    let popularPredictions: [PopularPrediction]?

    enum CodingKeys: String, CodingKey {
        case matchid
        case matchDate = "match_date"
        case team1Name = "team1_name"
        case team1Shortname = "team1_shortname"
        case team2Name = "team2_name"
        case team2Shortname = "team2_shortname"
        case popularPredictions = "popular_predictions"
    }
}

// MARK: - PopularPrediction
struct PopularPrediction: Codable, Identifiable {
    var id = UUID()
    let team1Prediction, team2Prediction, predictionPercentage: String?

    enum CodingKeys: String, CodingKey {
        case team1Prediction = "team1_prediction"
        case team2Prediction = "team2_prediction"
        case predictionPercentage = "prediction_percentage"
        
    }
}

struct MatchCard: Identifiable {
    var id: Int?
}

struct MatchCardStorageModel {
    var matchID: String
    var pred1: String
    var pred2: String
    var firstTeamToScore: String
    var isSubmitted: Bool
}

//MARK: Temporary PopularPredictions

struct TempPopularPred: Identifiable {
    var id = UUID()
    var team1Prediction: Int
    var team2Prediction: Int
    var predictionPercentage: Int
}
