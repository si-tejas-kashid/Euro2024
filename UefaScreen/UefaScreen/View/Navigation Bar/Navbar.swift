//
//  Navbar.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 31/05/24.
//

import SwiftUI

struct Navbar: View {
    var navTitleText: String?
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    
                }
            }
            .background(Color.red)
            .navigationTitle(navTitleText ?? "")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        // handle tap
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .tint(.white)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // handle tap
                    }) {
                        Image("three-dots")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .colorInvert()
                    }
                }
            }
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/4, alignment: .top)
    }
        
}

#Preview {
    Navbar(navTitleText: "Back")
}
