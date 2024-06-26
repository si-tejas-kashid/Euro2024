//
//  MatchPredictorVM.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 17/06/24.
//

import Foundation

@MainActor
final class MatchPredictorVM: ObservableObject {
    @Published var matchDay = MatchDay()
    @Published var matchCardDetail = MatchCard()
    
    @Published var selectedMatchDay: Int?
    @Published var matchDays: [MatchDay] = []
    @Published var isBoosterApplied: String?
    @Published var allMatchDaysArr: [MatchDays] = allMatches
}
