//
//  LastFiveMatchesView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 11/06/24.
//

import SwiftUI

struct LastFiveMatchesView: View {
    @State private var isSelected: String? = ""
    
    var match: Match
    @EnvironmentObject var matchDetailVM: MatchPredictorVM
    
    var body: some View {
        VStack {
            HStack {
                Text("Last 5 Matches")
                    .bold()
                    .padding(.top,5)
                Spacer()
                Button(action: {
//                    onDismiss()
                    withAnimation(.easeInOut(duration: 0.5)) {
                        matchDetailVM.showLastFiveMatchView = false
                        matchDetailVM.selectedMatchCardDetail = nil
                    }
                }) {
                    Image(systemName: "xmark")
                        .opacity(0.6)
                }
                //                .padding(.top,5)
            }
            .padding(.horizontal,15)
            .padding(.vertical,15)
            
            
            //MARK: Team Options
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
                        .foregroundColor(isSelected == matchDetailVM.selectedMatchCardDetail?.team1Name ? .yellow : .white.opacity(0.2))
                        .frame(height: 2)
//                        .frame(width: UIScreen.main.bounds.width/2.2, height: 1)
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
                        .foregroundColor(isSelected == matchDetailVM.selectedMatchCardDetail?.team2Name ? .yellow : .white.opacity(0.2))
                        .frame(height: 2)
//                        .frame(width: UIScreen.main.bounds.width/2.2, height: 1)
                }
                .padding(.leading,-4.5)
            }
            
            //MARK: Match Details List
            
            VStack {
                    ForEach(1..<6) {_ in
                        HStack {
                            VStack {
                                ZStack {
                                    Circle()
                                        .fill()
                                        .foregroundColor(.red)
                                        .frame(width: 22)
                                    Text("L")
                                        .font(.system(size: 12))
                                        .padding(8)
                                        .foregroundColor(.white)
                                    
                                }
                                Spacer()
                                    .frame(height: 7)
                                    .padding(.trailing,0)
                            }
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(isSelected ?? "") \(Int.random(in: 0..<5)) - \(Int.random(in: 0..<5)) Scotland")
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
                                .foregroundColor(.white.opacity(0.8))
                            }
                            Spacer()
                        }
                        .padding(.vertical,5)
                    }
                .padding(.leading,15)
            }
            .padding(.bottom, 15)
        }
        .onAppear {
            isSelected = matchDetailVM.selectedMatchCardDetail?.team1Name
        }
        .background(Color.blue0D1E62)
        .foregroundColor(.white)
        
        
    }
}

//#Preview {
//    LastFiveMatchesView(matchDetailVM.selectedMatchCardDetail?.team1Name: "", matchDetailVM.selectedMatchCardDetail?.team2Name: "", teamSelected: { _,_ in
//
//    }, match: match())
//}
