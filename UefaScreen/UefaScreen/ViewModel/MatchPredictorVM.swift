//
//  MatchPredictorVM.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 17/06/24.
//

import Foundation
import UIKit
import SwiftUI

@MainActor
final class MatchPredictorVM: ObservableObject {
    
    //MARK: Variables
    @Published var selectedMatchDay: Int?
    @Published var boosterAppliedMatchID: String?
    @Published var showFirstTeamView: Bool = false
    @Published var showLastFiveMatchView: Bool = false
    @Published var showAddEmployeeView: Bool = false
    @Published var selectedMatchCardDetail: Value? = nil
    @Published var orientation: UIDeviceOrientation = UIDeviceOrientation.portrait
    @Published var fromIpad: Bool = UIDevice.current.userInterfaceIdiom == .pad
    let apiService = ServiceManager()
    
    //MARK: Arrays
    @Published var matchCardDetail: MatchCard = MatchCard()
//    @Published var allMatchDaysArr: [MatchDays]? = allMatches
    @Published var allMatchDaysArr: [Value]?
    @Published var matchCardStorage: [MatchCardStorageModel] = []
    @Published var matchDayArray: [Int] = []
    @Published var boostersArray: [String] = []
    @Published var tempPopularPrediction: [TempPopularPred] = []
    
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
        } else {
            if team1Prediction != String() {
//                let newStorageArr = MatchCardStorageModel(matchID: matchid, pred1: team1Prediction, pred2: team2Prediction, firstTeamToScore: String(), isSubmitted: true)
//                matchCardStorage.append(newStorageArr)
            }
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
//            matchCardStorageModel.matchID == matchID
            true
        })).count > 0) ? true : false
    }
    
    func selectedMatchIndexInStoredArr(matchID: String) -> Int? {
        return matchCardStorage.firstIndex(where: { matchCardStorageModel in
//            matchCardStorageModel.matchID == matchID
            true
        })
    }
    
    //MARK: Sheets View Functions and Closures
    
    func onDismiss() -> () {
        withAnimation(.easeInOut(duration: 1)) {
            showLastFiveMatchView = false
            showFirstTeamView = false
            showAddEmployeeView = false
            selectedMatchCardDetail = nil
        }
    }
    
    func getSelectedTeamByDefault(matchID: String) -> String? {
        if checkIfMatchIDExists(matchID: matchID ) {
            if let index = selectedMatchIndexInStoredArr(
                matchID: matchID ) {
                return matchCardStorage[index].firstTeamToScore
            } else {
                return String()
            }
        } else {
            return String()
        }
    }
    
    func generateMatchdayArray() {
        for match in (allMatchDaysArr ?? []) {
            matchDayArray.append(Int(match.matchday ?? String()) ?? 0)
            matchDayArray = Array(Set(matchDayArray)).sorted(by: { num1, num2 in
                num1 < num2
            })
        }
    }
    
    func generatePopularPredictions() {
        for _ in (0 ..< Int.random(in: 2..<5)) {
            let newPrediction = TempPopularPred(team1Prediction: Int.random(in: 0..<10), team2Prediction: Int.random(in: 0..<10), predictionPercentage: Int.random(in: 0..<101))
            tempPopularPrediction.append(newPrediction)
        }
        
    }
    
    //MARK: API Calls for Employee data
    
    func getFixturesData() {
        Task{
            do {
                let data = try await apiService.execute(with: FixturesURN())
                allMatchDaysArr = data.data?.value
                generateMatchdayArray()
                generatePopularPredictions()
            } catch {
                print(error)
            }
        }
    }
    
    func userPrediction(){
        Task{
            do{
                let data = try await apiService.execute(with: UserPredictionsURN())
            }catch{
                print(error)
            }
        }
    }
    
    func submitPrediction(){
        let requestModel = SubmitPredictions(optType: 1, tourid: 1, soccerMatchid: "3jaxaba41eo1xj0esrt73nnkk", tourGamedayid: 1, questionid: 1, optionid: 1, betCoin: 1, platformid: 1, boosterid: 0, arrTeamid:  [
            "c9swyor08g9pedxpe3n321svu",
            "7wiwxjo7a9yudfe72ls12i4q5"
        ])
        Task{
            do{
                let requestData = try requestModel.encodeJSON()
                let submitPredictionsURN = SubmitPredictionsURN(body: requestData)
                let submitPredictionsData = try await apiService.execute(with: submitPredictionsURN)
            }catch{
                print(error)
            }
        }
    }
    
    func boosterApplied(){
        Task{
            let requestModel = Boosters(optType: 1, tourid: 1, soccerMatchid: "3jpenyzsv80vq8cjvur2836z8", tourGamedayid: 1, platformid: 1, boosterid: 1)
            do{
                let requestData = try requestModel.encodeJSON()
                let boosterURN = BoostersURN(body: requestData)
                let boostersData = try await apiService.execute(with: boosterURN)
                print("Success")
            }catch{
                print(error)
            }
        }
    }
}
