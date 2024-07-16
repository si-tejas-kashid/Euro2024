//
//  PredictorUtils.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 15/07/24.
//

import Foundation

final class PredictorUtils: ObservableObject {
    static let shared = PredictorUtils()
    
    @Published var userPredictionURL: String = "/predictor/services/api/gameplay/{{GUID}}/getpredictions?Game_Id=1&buster={{BUSTER}}"
}
