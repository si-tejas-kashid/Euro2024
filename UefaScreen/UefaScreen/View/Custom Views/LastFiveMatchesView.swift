//
//  LastFiveMatchesView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 11/06/24.
//

import SwiftUI

struct LastFiveMatchesView: View {
    
    @State private var isSelected: String? = ""
    @EnvironmentObject var matchDetailVM: MatchPredictorVM
    
    var body: some View {
        VStack {
            lastFiveMatchesViewHeaderView                   //Header View
            lastFiveMatchesViewTeamOptions                  //Team Options
            lastFiveMatchesViewMatchDetailsList             //Match Details List
        }
        .onAppear {
            isSelected = matchDetailVM.selectedMatchCardDetail?.team1Name
        }
        .background(matchDetailVM.fromIpad ? Color.whiteF4F3F5 : Color.blue0D1E62)
        .foregroundColor(matchDetailVM.fromIpad ? Color.grey000D40 : Color.white)
    }
    
    
    //MARK: Header View
    var lastFiveMatchesViewHeaderView: some View {
        HStack {
            Text("Last 5 Matches")
                .bold()
                .padding(.top,5)
            Spacer()
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    matchDetailVM.showLastFiveMatchView = false
                    matchDetailVM.selectedMatchCardDetail = nil
                }
            }) {
                ZStack {
                    if matchDetailVM.fromIpad{
                        Circle()
                            .fill()
                            .foregroundColor(Color.white)
                            .frame(width: 22)
                    }
                    Image(systemName: "xmark")
                        .opacity(0.6)
                        .font(.system(size: matchDetailVM.fromIpad ? 10 : 15, weight: matchDetailVM.fromIpad ? .bold : .medium))
                        .padding(matchDetailVM.fromIpad ? 5 : 0)                    
                }
                
            }
        }
        .padding(.horizontal,15)
        .padding(.vertical,15)
    }
    
    //MARK: Team Options
    var lastFiveMatchesViewTeamOptions: some View {
        HStack {
            VStack {
                HStack{
                    Image(matchDetailVM.selectedMatchCardDetail?.team1Name?.lowercased() ?? String())
                        .resizable()
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 1)
                                .background(Color.clear)
                                .foregroundColor(Color.greyB2C0C3)
                        )
                    Text(matchDetailVM.selectedMatchCardDetail?.team1Name ?? String())
                }
                .onTapGesture {
                    isSelected = matchDetailVM.selectedMatchCardDetail?.team1Name
                }
                
                Rectangle()
                    .foregroundColor(isSelected == matchDetailVM.selectedMatchCardDetail?.team1Name
                                     ? matchDetailVM.fromIpad ? Color.black : Color.yellow
                                     : matchDetailVM.fromIpad ? Color.greyB2C0C3 : .white.opacity(0.2))
                    .frame(height: 2)
            }
            .padding(.trailing,-4.5)
            
            VStack {
                HStack{
                    Text(matchDetailVM.selectedMatchCardDetail?.team2Name ?? String())
                    Image(matchDetailVM.selectedMatchCardDetail?.team2Name?.lowercased() ?? String())
                        .resizable()
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 1)
                                .background(Color.clear)
                                .foregroundColor(Color.greyB2C0C3)
                        )
                }
                .onTapGesture {
                    isSelected = matchDetailVM.selectedMatchCardDetail?.team2Name
                }
                Rectangle()
                    .foregroundColor(isSelected == matchDetailVM.selectedMatchCardDetail?.team2Name
                                     ? matchDetailVM.fromIpad ? Color.black : Color.yellow
                                     : matchDetailVM.fromIpad ? Color.greyB2C0C3 : Color.white.opacity(0.2))
                    .frame(height: 2)
            }
            .padding(.leading,-4.5)
        }
    }
    
    //MARK: Match Details List
    var lastFiveMatchesViewMatchDetailsList: some View {
        VStack {
            ForEach(1..<6) {_ in
                HStack {
                    VStack {
                        ZStack {
                            Circle()
                                .fill()
                                .foregroundColor(Color.green)
                                .frame(width: 22)
                            Text("W")
                                .font(.system(size: 12))
                                .padding(8)
                                .foregroundColor(matchDetailVM.fromIpad ? Color.black : Color.white)
                            
                        }
                        Spacer()
                            .frame(height: 7)
                            .padding(.trailing,0)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("\(isSelected ?? "") \(Int.random(in: 0..<5)) - \(Int.random(in: 0..<5)) Czechia")
                                .font(.system(size: 16))
                        }
                        .padding(.bottom,-3)
                        
                        HStack {
                            Text("27 March")
                            VStack {
                                Circle()
                                    .fill()
                                    .frame(width: 2)
                                    .padding(.horizontal,1)
                            }
                            Text("Friendly Matches")
                        }
                        .font(.system(size: 12))
                        .foregroundColor(matchDetailVM.fromIpad ? Color.black : Color.white.opacity(0.8))
                    }
                    Spacer()
                }
                .padding(.vertical,5)
            }
            .padding(.leading,15)
        }
        .padding(.bottom, 15)
    }
}

//#Preview {
//    LastFiveMatchesView(matchDetailVM.selectedMatchCardDetail?.team1Name: "", matchDetailVM.selectedMatchCardDetail?.team2Name: "", teamSelected: { _,_ in
//
//    }, match: match())
//}
