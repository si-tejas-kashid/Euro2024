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
    @Published var selectedMatchCardDetail: Match? = nil
    @Published var orientation: UIDeviceOrientation = UIDeviceOrientation.portrait
    @Published var fromIpad: Bool = UIDevice.current.userInterfaceIdiom == .pad
    
    //MARK: Arrays
    @Published var matchCardDetail: MatchCard = MatchCard()
    @Published var allMatchDaysArr: [MatchDays] = allMatches
    @Published var matchCardStorage: [MatchCardStorageModel] = []
    @Published var employeesData: [EmployeeData] = []
    
    let apiService = ServiceManager()
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
                let newStorageArr = MatchCardStorageModel(matchID: matchid, pred1: team1Prediction, pred2: team2Prediction, firstTeamToScore: String(), isSubmitted: true)
                matchCardStorage.append(newStorageArr)
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
            matchCardStorageModel.matchID == matchID
        })).count > 0) ? true : false
    }
    
    func selectedMatchIndexInStoredArr(matchID: String) -> Int? {
        return matchCardStorage.firstIndex(where: { matchCardStorageModel in
            matchCardStorageModel.matchID == matchID
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
    
    //MARK: API Calls for Employee data
    
    func getEmployeeData() {
        Task{
            do {
                let data = try await apiService.execute(with: EmployeesURN())
                
                data.data?.forEach({ employee in
                    let newEmployee = EmployeeData(
                        id: employee.id,
                        employeeName: employee.employeeName,
                        employeeSalary: employee.employeeSalary,
                        employeeAge: employee.employeeAge,
                        profileImage: employee.profileImage)
                    
                    employeesData.append(newEmployee)
                })
                
            } catch {
                print(error)
            }
        }
    }
    
    func setEmployeeData(with employeeRequestDetails: EmployeeRequestModel)  {
        let request: EmployeeRequestModel = employeeRequestDetails
        Task{
            do{
                let requestData = try request.encodeJSON()
                let createEmployeeURN = CreateEmployeeURN(body: requestData)
                let data = try await apiService.execute(with: createEmployeeURN)
                if data.status.lowercased() == "success" {
                    let newEmployee = EmployeeData(id: data.data.id,
                                                   employeeName: data.data.name,
                                                   employeeSalary: data.data.salary,
                                                   employeeAge: data.data.age,
                                                   profileImage: String())
                    
                    employeesData.append(newEmployee)
                    showAddEmployeeView = false
                }
            } catch {
                print(error)
            }
        }
    }
    
}
