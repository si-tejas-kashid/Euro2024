//
//  PredictorUtils.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 15/07/24.
//

import Foundation

final class PredictorUtils: ObservableObject {
    static let shared = PredictorUtils()
    
    @Published var userPredictionURL: String = "/afc-asian-cup/predictor/services/api/gameplay/{GUID}/getpredictions?TourId=1&TourGame_Id=1&guid=503a1416-48da-11ef-aeb4-0e3f2a47a899&buster=1722328919217"
    
    @Published var boostersURL: String = "/afc-asian-cup/predictor/services/api/gameplay/user/undefined/user-predict-booster"
    
    @Published var submitPredictionURL: String = "/afc-asian-cup/predictor/services/api/gameplay/user/{{GUID}}/user-predict"
    
}
