//
//  ShareLeagueView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 04/06/24.
//


import SwiftUI

struct ShareLeagueView: View {
    
    
    var body: some View {
        VStack {
            ScrollView {
                
                    HStack {
                        Spacer()
                        Text("Presented by")
                            .font(.system(size: 12))
                        Image("visitQatar")
                        Spacer(minLength: 150)
                    }
                    .frame(height: 50)
                    .background(Color.grey000D40)

                    
                
                    Text("Invite your friends")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                        .padding(.trailing,170)
                
                Divider().background(Color.white.opacity(0.5)).padding(.horizontal,10)
                
                    Image("euroLeagueCodeImage")
                    .padding()
                
                
                    
                HStack(spacing:30) {
                    
                    ButtonsWithBelowText(imageName: "shareImage", buttonText: "Share to \napps")
                    ButtonsWithBelowText(imageName: "downloadImage", buttonText: "Download \nimage")
                    ButtonsWithBelowText(imageName: "instaImage", buttonText: "Add to \nstory")
                        
                    }
                    .padding()
                
                    Section {
                        ButtonHorizontalAndColored(imageName: "copyContentImage", buttonText: "Copy code")
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        ButtonHorizontalAndColored(imageName: "copyContentImage", buttonText: "Copy auto-join link")
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical,5)
                }
            .foregroundColor(.white)
            .background(Color.darkBlue000D40)
            .navigationBarStyle(backgroundImage: "QSDKNavigationBG", titleColor: .white, points: 0)
            .navigationTitle("Leagues")
        }
        .navigationBarStyle(backgroundImage: "QSDKNavigationBG", titleColor: .white, points: 0)
    }
}

#Preview {
    ShareLeagueView()
}
