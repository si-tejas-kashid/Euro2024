//
//  MatchPredictorVM.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 17/06/24.
//

import Foundation
import UIKit

@MainActor
final class MatchPredictorVM: ObservableObject {
    
    //MARK: Variables
    @Published var selectedMatchDay: Int?
    @Published var boosterAppliedMatchID: String?
    @Published var showFirstTeamView: Bool = false
    @Published var showLastFiveMatchView: Bool = false
    @Published var selectedMatchCardDetail: Match? = nil
    @Published var orientation: UIDeviceOrientation = UIDeviceOrientation.portrait
    
    //MARK: Arrays
    @Published var matchCardDetail: MatchCard = MatchCard()
    @Published var allMatchDaysArr: [MatchDays] = allMatches
    @Published var matchCardStorage: [MatchCardStorageModel] = []
    
    //MARK: Functions
    
    func storeData(matchid: String, team1Prediction: String = String(), team2Prediction: String = String(), firstTeamSelected: String = String()) {
        if checkIfMatchIDExists(matchID: matchid) {
            if let index = selectedMatchIndexInStoredArr(matchID: matchid) {
                
                if team1Prediction != String() {
                matchCardStorage[index].pred1 = team1Prediction
                matchCardStorage[index].pred2 = team2Prediction
                
                    if matchCardStorage[index].isSubmitted != true {
                        matchCardStorage[index].isSubmitted = true
                    }
                }
            else if firstTeamSelected != String() {
                    matchCardStorage[index].firstTeamToScore = firstTeamSelected
                }
            }
            print(matchCardStorage)
        } else {
            if team1Prediction != String() {
                let newStorageArr = MatchCardStorageModel(matchID: matchid, pred1: team1Prediction, pred2: team2Prediction, firstTeamToScore: String(), isSubmitted: true)
                matchCardStorage.append(newStorageArr)
            }
            print(matchCardStorage)
        }
    }
    
    func checkBooster(matchid: String) -> Bool {
        return boosterAppliedMatchID == matchid
    }
    
    func checkIfSubmitted(matchid: String) -> Bool {
        if checkIfMatchIDExists(matchID: matchid) {
            if let index = selectedMatchIndexInStoredArr(matchID: matchid) {
                return matchCardStorage[index].isSubmitted
            }else {
                return false
            }
        } else {
            return false
        }
    }
    
    func checkIfMatchIDExists(matchID: String) -> Bool {
        return ((matchCardStorage.filter({ matchCardStorageModel in
            matchCardStorageModel.matchID == matchID
        })).count > 0) ? true : false
    }
    
    func selectedMatchIndexInStoredArr(matchID: String) -> Int? {
        return matchCardStorage.firstIndex(where: { matchCardStorageModel in
            matchCardStorageModel.matchID == matchID
        })
    }
    
}
