//
//  MatchCard.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 17/06/24.
//

import Foundation



struct MatchDay: Identifiable {
    var id = UUID()
    var MatchDayNumber: String?
    var points: Int?
    
    var isSheetPresented = false
    var isFirstTeamSheetPresented = false
    var isLastFiveSheetPresented = false
    var team1SheetVw = String()
    var team2SheetVw = String()
    var matchIDFstTmVw = String()
    
    func generateRandomMatchDay() -> [MatchDay] {
        var matchDays: [MatchDay] = []
        for i in 1..<4 {
            let newMatchDay = MatchDay(
                MatchDayNumber: "Matchday\(i)",
                points: Int.random(in: 0..<100)
            )
            
            matchDays.append(newMatchDay)
        }
        
        return matchDays
    }
}

struct AllMatches: Codable {
//    var id = UUID()
    let allMatches: [MatchDays]?
}

// MARK: - MatchDay
struct MatchDays: Codable, Identifiable {
    var id: UUID{ UUID()}
    let title: String?
    let matchDayID: Int?
    let dateRange: String?
    let points: Int?
    let matches: [Match]?
    var isBoosterApplied: String?
    
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
    
    var textFieldText1: String = "+"
    var textFieldText2: String = "+"
    var blank1: String = ""
    var blank2: String = ""
    var isFocused1: Bool = false
    var isFocused2: Bool = false
    var showToast: Bool = false
    var isSubmitted: Bool = false
    var pred1: Int = 0
    var pred2: Int = 0
    var buttonsData: [buttonData] = []
    var selectedButton: UUID? = nil
    var selectedNumber: String?
    var showKeyboard: Bool = false
    var isBoosterApplied: Bool = false
    var savedTeam1Pred: String = ""
    var savedTeam2Pred: String = ""  
    var firstTeamSelected: Bool = false
    var firstTeamToScore: String = ""
    var matchIDFstTmVw = String()
    var hasChangesFirstTeamValue : Bool = false
    
    
    //MARK: Functions
    
    mutating func onSubmitActions(fromButtons: Bool){
        if !fromButtons {
            
            if blank1.isEmpty {
                textFieldText1 = "+"
            } else {
                textFieldText1 = blank1
            }
            
            if blank2.isEmpty {
                textFieldText2 = "+"
            } else {
                textFieldText2 = blank2
            }
        }
    }
    
}

struct buttonData: Identifiable {
    var id = UUID()
    var pred1: Int
    var pred2: Int
    var percentage: Int
}
