//
//  PredictorUserDetails.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 15/07/24.
//

import Foundation

public class PredictorUserDetails: ObservableObject {
    static let shared = PredictorUserDetails()
    
    func getGUID() -> String {
        return "503a1416-48da-11ef-aeb4-0e3f2a47a899"
    }
    
    func submitPredictionGUID() -> String{
        return "a7adcdeac24444588bf63f6004003f3e"
    }
    
    func getTempBusterValue() -> String {
        return "1720364906925"
    }
}
