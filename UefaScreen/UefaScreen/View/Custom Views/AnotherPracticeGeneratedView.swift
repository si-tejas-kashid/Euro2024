//
//  AnotherPracticeGeneratedView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 14/06/24.
//

import SwiftUI

struct AnotherPracticeGeneratedView: View {
    var body: some View {
        VStack {
            // Top Bar
            HStack {
                Button(action: {
                    // Back action
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .padding()
                }
                Spacer()
                Text("Title")
                    .font(.headline)
                    .padding()
                Spacer()
                Button(action: {
                    // Action for button on the right if any
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            .background(Color(.systemGray6))
            
            // Main Content Area
            ScrollView {
                VStack(alignment: .leading) {
                    // Replace these with your actual UI elements
                    Image("sampleImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()

                    Text("Sample Text")
                        .font(.body)
                        .padding()
                    
                    Button(action: {
                        // Button action
                    }) {
                        Text("Sample Button")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
            .background(Color(.systemBackground))
            
            // Bottom Bar
            HStack {
                Button(action: {
                    // First button action
                }) {
                    VStack {
                        Image(systemName: "house.fill")
                            .font(.title)
                        Text("Home")
                            .font(.caption)
                    }
                    .padding()
                }
                Spacer()
                Button(action: {
                    // Second button action
                }) {
                    VStack {
                        Image(systemName: "heart.fill")
                            .font(.title)
                        Text("Favorites")
                            .font(.caption)
                    }
                    .padding()
                }
                Spacer()
                Button(action: {
                    // Third button action
                }) {
                    VStack {
                        Image(systemName: "person.fill")
                            .font(.title)
                        Text("Profile")
                            .font(.caption)
                    }
                    .padding()
                }
            }
            .background(Color(.systemGray6))
            .padding(.bottom, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnotherPracticeGeneratedView()
    }
}
