//
//  MatchPredictor.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 04/06/24.
//

import SwiftUI

struct MatchPredictorView: View {
    var matchdays: [MatchDays]?
    @StateObject var viewModel = MatchPredictorVM()
    @EnvironmentObject var commonData: CommonData
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    VStack {
//                        HStack {
//                            Spacer(minLength: commonData.orientation.isLandscape ? 50 : 0)
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
                                            employeeDetailsView                         //Employee Details View
                                            
                                        }
                                    }
                                    .onChange(of: viewModel.selectedMatchDay) { _ in
                                        withAnimation() {
                                            proxy.scrollTo("top", anchor: .zero)
                                        }
                                    }
                                }
                            }
//                            Spacer(minLength: commonData.orientation.isLandscape ? 50 : 0)
//                        }
                        .navigationBarStyle(backgroundImage: "QSDKNavigationBG", titleColor: .white, points: matchdays?.reduce(0){$0 + ($1.points ?? 0)})
                    }
                }
                .foregroundColor(.white)
                .background(Color.darkBlue000D40)
                .ignoresSafeArea(edges: .bottom)
                .ignoresSafeArea(edges: .horizontal)
                .navigationTitle("Match Predictor")
            }
            
            .popup(isPresented: Binding.constant(viewModel.showFirstTeamView || viewModel.showLastFiveMatchView || viewModel.showAddEmployeeView), dragToDismiss: true) {
                matchPredictorCommonSheetView
            }
            .ignoresSafeArea(.all)
            
            .onAppear {
//                viewModel.getEmployeeData()
            }
            
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
                    ForEach(matchdays ?? [], id: \.matchDayID){ data in
                        Button(action: {
                            viewModel.selectedMatchDay = data.matchDayID
                        })
                        {
                            VStack {
                                Text(data.title ?? "Matchday")
                                    .foregroundColor(.white)
                                    .padding(.horizontal,10)
                                    .font(.footnote)
                                    .font(.system(size: 50))
                                    .padding(.top, 10)
                                Text("\(data.points ?? 0) pts")
                                    .bold()
                                Rectangle()
                                    .padding(.bottom, -1)
                                    .frame(height: 2)
                                    .foregroundColor(viewModel.selectedMatchDay == data.matchDayID ? .yellow : .clear)
                            }
                        }
                    }
                    Spacer()
                }
                .onAppear{
                    viewModel.selectedMatchDay = matchdays?.first?.matchDayID
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
            Text(matchdays?[matchdays?.firstIndex(where: { Element in Element.matchDayID == viewModel.selectedMatchDay}) ?? 0].dateRange ?? "")
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
        VStack(spacing:0) {
            ForEach(matchdays?[matchdays?.firstIndex(where: { element in element.matchDayID == viewModel.selectedMatchDay}) ?? 0].matches ?? [], id: \.matchid)
            { match in
                MatchCardView(matchCardDetail: match,tapped: {
                    withAnimation(.linear(duration: 1)) {
                        proxy.scrollTo(match.matchid, anchor: .center)
                    }
                })
                .id(match.matchid)
                
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay (
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2)
                            .foregroundColor(match.matchid == viewModel.boosterAppliedMatchID ? .yellow : Color.clear)
                    )
                    .padding(.vertical, 10)
                    .padding(.horizontal, UIDevice.current.userInterfaceIdiom == .pad ? 150 : 0)
                    .padding(.horizontal, (commonData.orientation.isLandscape && UIDevice.current.userInterfaceIdiom == .pad) ? 150 : 10)
            }
        }
    }
    
    //MARK: Employee Details View
    var employeeDetailsView: some View {
        LazyVStack {
            if viewModel.selectedMatchDay == matchdays?.first?.matchDayID {
                ForEach(viewModel.employeesData, id: \.id) {employee in
                    EmployeeDetailView(employeeDetail: employee)
                        .cornerRadius(15)
                        .padding(10)
                }
                
                Button(action: {
                    viewModel.showAddEmployeeView = true
                }) {
                    Text("Add Employee")
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5.0)
                                .stroke()
                        )
                }
                .padding(.bottom, 20)
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
                                viewModel.storeData(matchid: viewModel.selectedMatchCardDetail?.matchid ?? String(), firstTeamSelected: teamName)
                            }
                        })
                        
                    } else if viewModel.showLastFiveMatchView {
                        LastFiveMatchesView()
                    } else if viewModel.showAddEmployeeView {
                        CreateEmployeeView(submitDetail: ({details in
                            Task {
                                await viewModel.setEmployeeData(with: details)
                            }
                        })
                    )}
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
}

//#Preview {
//    MatchPredictorView(matchdays: allMatches)
//        .environmentObject(SharedData())
//}
