//
//  LastFiveMatchesView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 11/06/24.
//

import SwiftUI

struct LastFiveMatchesView: View {
    var team1: String
    var team2: String
    var onDismiss: () -> Void
    @State var teamSelected: (String, String) -> ()
    @State private var isSelected: String? = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Last 5 Matches")
                    .bold()
                    .padding(.top,5)
                Spacer()
                Button(action: {
                    onDismiss()
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
                        Image(team1.lowercased())
                            .resizable()
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 1)
                                    .background(Color.clear)
                                    .foregroundColor(Color.greyB2C0C3)
                            )
                        Text(team1)
                    }
                    .onTapGesture {
                        isSelected = team1
                    }
                    
                    Rectangle()
                        .foregroundColor(isSelected == team1 ? .yellow : .white.opacity(0.2))
                        .frame(width: UIScreen.main.bounds.width/2.2, height: 1)
                }
                .padding(.trailing,-4.5)
                
                VStack {
                    HStack{
                        Text(team2)
                        Image(team2.lowercased())
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
                        isSelected = team2
                    }
                    Rectangle()
                        .foregroundColor(isSelected == team2 ? .yellow : .white.opacity(0.2))
                        .frame(width: UIScreen.main.bounds.width/2.2, height: 1)
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
//                                    .overlay {
                                        Text("L")
                                            .font(.system(size: 12))
                                            .padding(8)
                                            .foregroundColor(.white)
//                                    }
                                
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
            }
            .padding(.leading,15)
        }
        .onAppear {
            isSelected = team1
        }
//        .frame(width: UIScreen.main.bounds.width, height: 360)
        .background(Color.blue0D1E62)
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        
        
    }
}

#Preview {
    LastFiveMatchesView(team1: "", team2: "", onDismiss: {
        
    }, teamSelected: { _,_ in 
        
    })
}
