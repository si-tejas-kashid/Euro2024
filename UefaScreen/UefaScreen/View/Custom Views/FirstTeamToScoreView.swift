//
//  FirstTeamToScoreView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 10/06/24.
//

import SwiftUI

struct FirstTeamToScoreView: View {
    var matchID: String
    var team1: String
    var team2: String
    var none = "None"
    var onDismiss: () -> Void
    @State private var isSelected: String? = ""
    @State var teamSelected: (String, String) -> ()
    
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
            
            Spacer()
            
            HStack {
                VStack {
                    Button (action: {
//                        if isSelected != team1 {
                            isSelected = team1
                            teamSelected(team1,matchID)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                onDismiss()
                            }
//                        }
                    }) {
                        VStack {
                            ZStack(alignment: .bottomTrailing){
                                Image(team1.lowercased())
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(lineWidth: 2)
                                            .background(Color.clear)
                                            .foregroundColor(Color.greyB2C0C3)
                                    )
                                
                                Image(systemName: isSelected == team1 ? "checkmark.circle.fill" : "circle")
                                    .background(Color.blue0D1E62)
                                    .foregroundColor(isSelected == team1 ? .yellow : .white.opacity(0.8))
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    Text(team1)
                        .font(.headline)
                }
                
                Spacer()
                
                VStack {
                    Button (action: {
                        isSelected = none
                        teamSelected(String(),matchID)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            onDismiss()
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
                                
                                Image(systemName: isSelected == nil ? "checkmark.circle.fill" : "circle")
                                    .background(Color.blue0D1E62)
                                    .foregroundColor(isSelected == nil ? .yellow : .white.opacity(0.8))
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
//                        if isSelected != team2 {
                            isSelected = team2
                            teamSelected(team2, matchID)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                onDismiss()
                            }
//                        }
                    }) {
                        VStack {
                            ZStack(alignment: .bottomTrailing){
                                Image(team2.lowercased())
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(lineWidth: 2)
                                                .background(Color.clear)
                                                .foregroundColor(Color.greyB2C0C3)
                                        )
                                
                                Image(systemName: isSelected == team2 ? "checkmark.circle.fill" : "circle")
                                    .background(Color.blue0D1E62)
                                    .foregroundColor(isSelected == team2 ? .yellow : .white.opacity(0.8))
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    Text(team2)
                        .font(.headline)
                }
            }
            .padding(.horizontal, 45)
            
            Spacer()
        }
//        .frame(width: UIScreen.main.bounds.width, height: 200)
        .frame(maxWidth: .infinity)
        .cornerRadius(20)
        .background(Color.blue0D1E62)
        .foregroundColor(.white)
    }
}

#Preview {
    FirstTeamToScoreView(matchID: "", team1: "Germany", team2: "Italy") {
        
    } teamSelected: {_,_  in
        
    }
}
