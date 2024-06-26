//
//  StickyViewTrial.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 24/06/24.
//

//import SwiftUI
//
//struct StickyViewTrial: View {
//    @State private var offset: CGFloat = 0
//    var matchdays: [MatchDays]?
//    @StateObject var matchPredictorVM = MatchPredictorVM()
//    
//    var body: some View {
//        NavigationView() {
//            ScrollView {
//                VStack {
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        ForEach(matchdays ?? [], id: \.matchDayID){ data in
//                            Button(action: {
//                                matchPredictorVM.selectedMatchDay = data.matchDayID
//                            })
//                            {
//                                VStack {
//                                    Text(data.title ?? "Matchday")
//                                        .foregroundColor(.white)
//                                        .padding(.horizontal,10)
//                                        .font(.subheadline)
//                                        .padding(.top, data.points ?? 0 > 50 ? 20 : 45)
//                                        .font(.system(size: 10, weight: .bold))
//                                    if data.points ?? 0 > 50 {
//                                        Text("\(data.points ?? 0) pts")
//                                            .bold()
//                                    }
//                                    Rectangle()
//                                        .padding(.bottom,-8)
//                                        .foregroundColor(matchPredictorVM.selectedMatchDay == data.matchDayID ? .yellow : .clear)
//                                }
//                                
//                            }
//                        }
//                        Spacer()
//                    }
//                    .onAppear{
//                        matchPredictorVM.selectedMatchDay = matchdays?.first?.matchDayID
//                    }
//                    .padding(.leading,20)
//                }
//                .padding(.top,-10)
//                
//                Divider()
//                    .background(Color.white)
//                    .opacity(0.8)
//                    .frame(height: 2)
//                    .padding(.top,-8)
//            }
//                VStack(spacing: 0) {
//                    // Sticky Header
//                    Text("Sticky Header")
//                        .font(.title)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .frame(height: 200)
//                        .background(Color.blue)
//                        .offset(y: -offset > 0 ? -offset : 0)
//                        .zIndex(1) // Ensure header stays above content
//                    
//                    // Spacer to fill space under the sticky header
//                    Color.clear
//                        .frame(height: 50) // Adjust as per your header height
//                    
//                    // Content
//                    ScrollView {
//                        VStack(spacing: 20) {
//                            ForEach(1..<50) { index in
//                                Text("Row \(index)")
//                                    .frame(maxWidth: .infinity, minHeight: 100)
//                                    .background(Color.yellow)
//                                    .cornerRadius(8)
//                                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
//                            }
//                        }
//                        .padding()
//                        .background(Color.white)
//                    }
//                }
//                .background(Color.white)
//                .overlay(
//                    GeometryReader { geometry in
//                        Rectangle()
//                            .fill(Color.blue)
//                            .opacity(min(1, Double(geometry.frame(in: .global).minY / 100)))
//                            .frame(height: 50)
//                            .edgesIgnoringSafeArea(.top)
//                    }
//                )
//                .coordinateSpace(name: "scroll")
//                .onPreferenceChange(OffsetPreferenceKey.self) { value in
//                    self.offset = value
//            }
//                .ignoresSafeArea(edges: .bottom)
//                .navigationTitle("Match Predictor")
//            .navigationBarStyle(backgroundImage: "QSDKNavigationBG", titleColor: .white, points: 0)
//            }
//        }
//    }
//}
//
//struct OffsetPreferenceKey: PreferenceKey {
//    static var defaultValue: CGFloat = 0
//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//        value = nextValue()
//    }
//}

import SwiftUI

struct StickyViewTrial: View {
    @State private var offset: CGFloat = 0
        var matchdays: [MatchDays]?
        @StateObject var matchPredictorVM = MatchPredictorVM()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Horizontal ScrollView
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1..<10) { index in
                            Button(action: {
                                // Handle button action
                            }) {
                                VStack {
                                    Text("Matchday \(index)")
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 10)
                                        .font(.subheadline)
                                        .padding(.top, 45)
                                        .font(.system(size: 10, weight: .bold))
                                    if index > 5 {
                                        Text("\(index * 10) pts")
                                            .bold()
                                    }
                                    Rectangle()
                                        .padding(.bottom, -8)
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.leading, 20)
                }
                .padding(.top, -10)

                Divider()
                    .background(Color.white)
                    .opacity(0.8)
                    .frame(height: 2)
                    .padding(.top, -8)

                VStack(spacing: 0) {
                    // Sticky Header
                    Text("Sticky Header")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color.blue)
                        .offset(y: -offset > 0 ? -offset : 0)
                        .zIndex(1) // Ensure header stays above content

                    // Spacer to fill space under the sticky header
                    Color.clear
                        .frame(height: 50) // Adjust as per your header height

                    // Content
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(1..<50) { index in
                                Text("Row \(index)")
                                    .frame(maxWidth: .infinity, minHeight: 100)
                                    .background(Color.yellow)
                                    .cornerRadius(8)
                                    .shadow(color: .gray, radius: 3, x: 0, y: 2)
                            }
                        }
                        .padding()
                        .background(Color.white)
                    }
                }
                .background(Color.white)
                .overlay(
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(Color.blue)
                            .opacity(min(1, Double(geometry.frame(in: .global).minY / 100)))
                            .frame(height: 50)
                            .edgesIgnoringSafeArea(.top)
                    }
                )
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(OffsetPreferenceKey.self) { value in
                    self.offset = value
                }
                .ignoresSafeArea(edges: .bottom)
                .navigationTitle("Match Predictor")
                .navigationBarStyle(backgroundImage: "QSDKNavigationBG", titleColor: .white, points: 0)
            }
        }
    }
}

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}




#Preview {
    StickyViewTrial()
}
