//
//  FirstTeamToScoreView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 10/06/24.
//

import SwiftUI

struct FirstTeamToScoreView: View {
    @EnvironmentObject var matchCardDetailVM: MatchPredictorVM
    let match: Match
    @State private var isSelected: String? = ""
    @State var teamSelected: (String) -> ()
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Spacer()
                
                ZStack {
                    HStack {
                        VStack() {
                            Text("First team to score")
                                .font(.system(size: 20, weight: .bold))
                            HStack {
                                Text("Guess right to score")
                                Text("+2 points")
                                    .padding(.leading,-5)
                                    .font(.system(size: 18, weight: .bold))
                            }
                            .font(.subheadline)
                        }
                        .padding(.top,20)
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            onDismiss()
                        }) {
                            Image(systemName: "xmark")
                                .accentColor(.white)
                                .opacity(0.6)
                        }
                        .padding(.trailing,15)
                        .padding(.top,-15)
                    }
                }
                
                
            }
            
            
            HStack {
                VStack {
                    Button (action: {
                        isSelected = match.team1Name
                        if isSelected != getSelectedTeamByDefault() {
                        teamSelected(isSelected ?? String())
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                onDismiss()
                            }
                        }
                    }) {
                        VStack {
                            ZStack(alignment: .bottomTrailing){
                                Image(match.team1Name?.lowercased() ?? String())
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(lineWidth: 2)
                                            .background(Color.clear)
                                            .foregroundColor(Color.greyB2C0C3)
                                    )
                                
                                Image(systemName: isSelected == match.team1Name ? "checkmark.circle.fill" : "circle")
                                    .background(Color.blue0D1E62)
                                    .foregroundColor(isSelected == match.team1Name ? .yellow : .white.opacity(0.8))
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    Text(match.team1Name ?? String())
                        .font(.headline)
                }
                
                Spacer()
                
                VStack {
                    Button (action: {
                        isSelected = "None"
                        if isSelected != getSelectedTeamByDefault() {
                        teamSelected(isSelected ?? String())
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                onDismiss()
                            }
                        }
                    }) {
                        VStack {
                            ZStack(alignment: .bottomTrailing){
                                Text("0 - 0")
                                    .bold()
                                    .font(.system(size: 20))
                                    .frame(width: 60, height: 60)
                                    .overlay (
                                        Circle()
                                            .stroke(lineWidth: 2)
                                            .foregroundColor(
                                                .white
                                                    .opacity(0.7)
                                            )
                                    )
                                
                                Image(systemName: isSelected == "None" ? "checkmark.circle.fill" : "circle")
                                    .background(Color.blue0D1E62)
                                    .foregroundColor(isSelected == "None" ? .yellow : .white.opacity(0.8))
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    Text("None")
                        .font(.headline)
                }
                
                Spacer()
                
                VStack {
                    Button (action: {
                        isSelected = match.team2Name
                        if isSelected != getSelectedTeamByDefault() {
                        teamSelected(isSelected ?? String())
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                onDismiss()
                            }
                        }
                            
//                        }
                    }) {
                        VStack {
                            ZStack(alignment: .bottomTrailing){
                                Image(match.team2Name?.lowercased() ?? String())
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(lineWidth: 2)
                                                .background(Color.clear)
                                                .foregroundColor(Color.greyB2C0C3)
                                        )
                                
                                Image(systemName: isSelected == match.team2Name ? "checkmark.circle.fill" : "circle")
                                    .background(Color.blue0D1E62)
                                    .foregroundColor(isSelected == match.team2Name ? .yellow : .white.opacity(0.8))
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    Text(match.team2Name ?? String())
                        .font(.headline)
                }
            }
            .padding(.horizontal, 45)
            .padding(.bottom, 60)
            .padding(.top, 20)
        }
        .onAppear{
            isSelected = getSelectedTeamByDefault()
        }
        .cornerRadius(20)
        .background(Color.blue0D1E62)
        .foregroundColor(.white)
    }
    
    func onDismiss() -> () {
        withAnimation(.easeInOut(duration: 0.5)) {
            matchCardDetailVM.showFirstTeamView = false
            matchCardDetailVM.selectedMatchCardDetail = nil
        }
    }
    
    func getSelectedTeamByDefault() -> String? {
        if matchCardDetailVM.checkIfMatchIDExists(matchID: matchCardDetailVM.selectedMatchCardDetail?.matchid ?? String()) {
            if let index = matchCardDetailVM.selectedMatchIndexInStoredArr(
                matchID: matchCardDetailVM.selectedMatchCardDetail?.matchid ?? String()) {
                return matchCardDetailVM.matchCardStorage[index].firstTeamToScore
            } else {
                return String()
            }
        } else {
            return String()
        }
    }
    
}

//#Preview {
//    FirstTeamToScoreView(match.matchid: "", match.team1Name: "Germany", match.team2Name: "Italy") {
//
//    } teamSelected: {_,_  in
//
//    }
//}
