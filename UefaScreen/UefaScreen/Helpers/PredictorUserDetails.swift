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
        return "d7669c84-ab2d-11ee-9008-0e3f2a47a899"
    }
    
    func getTempBusterValue() -> String {
        return "1720364906925"
    }
}
