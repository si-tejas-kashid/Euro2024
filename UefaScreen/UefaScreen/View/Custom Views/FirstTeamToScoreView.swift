//
//  FirstTeamToScoreView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 10/06/24.
//

import SwiftUI

struct FirstTeamToScoreView: View {
    @State private var isSelected: String? = ""
    @State var teamSelected: (String) -> ()
    @EnvironmentObject var matchCardDetailVM: MatchPredictorVM
    
    var body: some View {
        VStack {
            firstTeamToScoreHeaderView                          //firstTeamToScoreHeaderView
            
            HStack {
                
                teamOptionInFirstTeamView(teamName: matchCardDetailVM.selectedMatchCardDetail?.team1Name ?? String())
                Spacer()
                teamOptionInFirstTeamView(teamName: "None")
                Spacer()
                teamOptionInFirstTeamView(teamName: matchCardDetailVM.selectedMatchCardDetail?.team2Name ?? String())
                
            }
            .padding(.horizontal, 45)
            .padding(.bottom, 20)
            .padding(.top, 20)
        }
        .onAppear{
            isSelected = matchCardDetailVM.getSelectedTeamByDefault(matchID: matchCardDetailVM.selectedMatchCardDetail?.matchid ?? String())
        }
        .cornerRadius(20)
        .background(Color.blue0D1E62)
        .foregroundColor(.white)
    }
    
    //MARK: Header View
    
    var firstTeamToScoreHeaderView: some View {
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
                        matchCardDetailVM.onDismiss()
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
    }
    
    //MARK: Team Option View
    
    func teamOptionInFirstTeamView(teamName: String) -> some View {
        VStack {
            Button (action: {
                isSelected = teamName
                if isSelected != matchCardDetailVM.getSelectedTeamByDefault(matchID: matchCardDetailVM.selectedMatchCardDetail?.matchid ?? String()) {
                teamSelected(isSelected ?? String())
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        matchCardDetailVM.onDismiss()
                    }
                }
            }) {
                VStack {
                    ZStack(alignment: .bottomTrailing){
                        VStack {
                            if teamName.lowercased() == "none" {
                                Text("0 - 0")
                                    .bold()
                                    .font(.system(size: 20))
                                    .frame(width: 60, height: 60)
                            } else {
                                Image(teamName.lowercased() )
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            }
                        }
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 2)
                                    .background(Color.clear)
                                    .foregroundColor(Color.greyB2C0C3)
                            )
                        
                        Image(systemName: isSelected == teamName ? "checkmark.circle.fill" : "circle")
                            .background(Color.blue0D1E62)
                            .foregroundColor(isSelected == teamName ? .yellow : .white.opacity(0.8))
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                    }
                }
            }
            Text(teamName)
                .font(.headline)
        }
    }
}

//#Preview {
//    FirstTeamToScoreView(match.matchid: "", matchCardDetailVM.selectedMatchCardDetail?.team1Name: "Germany", matchCardDetailVM.selectedMatchCardDetail?.team2Name: "Italy") {
//
//    } teamSelected: {_,_  in
//
//    }
//}
