//
//  MatchPredictor.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 04/06/24.
//

import SwiftUI

struct MatchPredictorView: View {
    @EnvironmentObject var viewModel: MatchPredictorVM
    @EnvironmentObject var commonData: CommonData
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    VStack {
                            ScrollViewReader { proxy in
                                ScrollView {
                                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                                        HStack {
                                            Spacer()
                                            Text("Place For Ads")
                                                .font(.system(size: 12))
                                            Spacer()
                                        }
                                        .id("top")
                                        .frame(height: 50)
                                        .background(Color.grey000D40)
                                        
                                        Section(header: matchPredictorHeaderView) {     //Header View
                                            
                                            dataAndShareButtonView                      //Data And Share Button View
                                            matchPredictorMatchCardView(proxy: proxy)   //Match Predictor MatchCard View
                                            
                                        }
                                    }
                                    .onChange(of: viewModel.selectedMatchDay) { _ in
                                        withAnimation() {
                                            proxy.scrollTo("top", anchor: .zero)
                                        }
                                    }
                                    .gesture(
                                        DragGesture()
                                            .onEnded { value in
                                                if value.translation.width > 10 {
                                                    changeView(for: "right")
                                                } else if value.translation.width < -10 {
                                                    changeView(for: "left")
                                                }
                                            }
                                    )
                                }
                            }
                        .navigationBarStyle(backgroundImage: "QSDKNavigationBG", titleColor: .white, points: 0)
                    }
                }
                .foregroundColor(.white)
                .background(Color.darkBlue000D40)
                .ignoresSafeArea(edges: .bottom)
                .ignoresSafeArea(edges: .horizontal)
                .navigationTitle("Match Predictor")
            }
            
            .popup(isPresented: Binding.constant(viewModel.showFirstTeamView || viewModel.showLastFiveMatchView), dragToDismiss: true) {
                matchPredictorCommonSheetView
            }
            .ignoresSafeArea(.all)
        }
        .background(Color.darkBlue000D40)
        .navigationViewStyle(.stack)
        .environmentObject(viewModel)
    }
    
    //MARK: Header View
    
    var matchPredictorHeaderView: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Array(viewModel.matchDayArray.enumerated()), id: \.offset) { index, value in
                        Button(action: {
                            viewModel.selectedMatchDay = value
                        })
                        {
                            VStack {
                                    Text("Matchday \(value)")
                                    .foregroundColor(.white)
                                    .padding(.horizontal,10)
                                    .font(.footnote)
                                    .font(.system(size: 50))
                                    .padding(.top, 10)
                                Rectangle()
                                    .padding(.bottom, -1)
                                    .frame(height: 2)
                                    .foregroundColor(viewModel.selectedMatchDay == value ? .yellow : .clear)
                            }
                        }
                    }
                    .onAppear{
                        viewModel.selectedMatchDay = Int(viewModel.allMatchDaysArr?.first?.matchday ?? String())
                    }
                    Spacer()
                }
                .padding(.leading,20)
            }
            
            Divider()
                .background(Color.white)
                .padding(.top, 1)
        }
        .background(Color.darkBlue000D40)
    }
    
    //MARK: Data And Share Button View
    var dataAndShareButtonView: some View {
        HStack(spacing:0) {
            Text("15 - 19 July")
                .font(.system(size: 15, weight: .bold))
            Spacer()
            Button (action: {
                //share button implementation
            }) {
                ZStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke()
                            .frame(width: 85, height: 25)
                    }
                    
                    HStack() {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 10, height: 13)
                        Text("Share")
                            .font(.footnote)
                    }
                }
                
            }
        }
        .padding(.bottom,-8)
        .padding(.top,2)
        .padding(.horizontal,10)
    }
    
    //MARK: MatchCard View
    func matchPredictorMatchCardView(proxy: ScrollViewProxy) -> some View {
        VStack(spacing: 0) {
            ForEach(viewModel.allMatchDaysArr?.filter({ value in
                Int(value.matchday ?? String()) == viewModel.selectedMatchDay
            }) ?? [], id: \.id) { match in
                MatchCardView(matchCardDetail: match,tapped: {
                    withAnimation(.linear(duration: 1)) {
                        proxy.scrollTo(match.matchID, anchor: .center)
                    }
                })
                .id(match.matchID)
                
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay (
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 2)
                        .foregroundColor(match.matchID == viewModel.boosterAppliedMatchID ? .yellow : Color.clear)
                )
                .padding(.vertical, 10)
                .padding(.horizontal, UIDevice.current.userInterfaceIdiom == .pad ? 150 : 0)
                .padding(.horizontal, (commonData.orientation.isLandscape && UIDevice.current.userInterfaceIdiom == .pad) ? 150 : 10)
            }
        }
    }
    
    //MARK: Screen Sheet View
    
    var matchPredictorCommonSheetView: some View {
        ZStack {
            Color.black.opacity(0.1)
            VStack {
                if !viewModel.fromIpad {
                    Spacer()
                }
                VStack{
                    if viewModel.showFirstTeamView {
                        FirstTeamToScoreView(teamSelected: { teamName in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                viewModel.storeData(matchid: viewModel.selectedMatchCardDetail?.matchID ?? String(), firstTeamSelected: teamName)
                            }
                        })
                        
                    } else if viewModel.showLastFiveMatchView {
                        LastFiveMatchesView()
                    } 
                }
                .cornerRadius(30)
                .padding(viewModel.fromIpad ? 150 : 0)
                .padding(.horizontal, (commonData.orientation.isLandscape && UIDevice.current.userInterfaceIdiom == .pad) ? 200 : 0)
            }
        }
        .shadow(color: Color.black.opacity(1),
                radius: 25)
        .gesture(
            DragGesture()
                .onEnded({ value in
                    if value.location.x > 200 {
                        viewModel.onDismiss()
                    }
                })
        )
    }
    
    // MARK: Function for swipe
    
    func changeView(for direction: String) {
          if direction == "right" {
              if let selectedMatchDay = viewModel.selectedMatchDay, selectedMatchDay > 1 {
                  viewModel.selectedMatchDay = selectedMatchDay - 1
              }
          } else if direction == "left" {
              if let selectedMatchDay = viewModel.selectedMatchDay, selectedMatchDay <= viewModel.matchDayArray.count - 1 {
                  viewModel.selectedMatchDay = selectedMatchDay + 1
              }
          }
      }
}

//#Preview {
//    MatchPredictorView(viewModel.allMatchDaysArr: allMatches)
//        .environmentObject(SharedData())
//}
