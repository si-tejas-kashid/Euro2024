//
//  MatchCard.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 04/06/24.
//

import SwiftUI

struct MatchCardView: View {
    
    var matchCardDetail: Match?
    @EnvironmentObject var viewModel: MatchPredictorVM
    @StateObject var matchCardViewModel = MatchCardVM()
    var tapped: () -> ()
    
    var body: some View {
        VStack {
            VStack {
                matchCardHeaderView                                                 //MatchCard Header View
                
                HStack {
                    
                    //MARK: Team 1 Data
                    teamLogoAndNameView(teamName: matchCardDetail?.team1Name ?? String())
                    
                    
                    //MARK: Team 1 and 2 Score Field TextField
                    customTextFieldsView
                    
                    
                    //MARK: Team 2 Data
                    teamLogoAndNameView(teamName: matchCardDetail?.team2Name ?? String())
                    
                }
                
                VStack {
                    popularPredictionsButton                                                       //Popular prediction button
                    
                    if viewModel.checkIfSubmitted(matchid: matchCardDetail?.matchid ?? String()) {
                        VStack(spacing:0) {
                            Divider()
                                .background(Color.white)
                            
                            firstTeamToScoreButton                                                  //First Team To Score Button
                            
                            Divider()
                                .background(Color.white)
                                .padding(.bottom,0)
                            
                            boosterButton                                                           //Booster Button
                        }
                        .animation(.default, value: viewModel.checkIfSubmitted(matchid: matchCardDetail?.matchid ?? String()))
                        .padding(.bottom,0)
                    }
                }
                
            }
            .overlay(
                customKeyboardImplementation
            )
        }
        .background(Color.blue0D1E62)
        .foregroundColor(.white)
        .onTapGesture {
            tapped()
            onUnnecessaryTap()
        }
        .onAppear {
            assignTextfieldText()
        }
        
    }
    
    //MARK: Header View
    
    var matchCardHeaderView: some View {
        ZStack {
            ZStack {
                Text(matchCardDetail?.matchDate ?? "")
                    .font(.system(size: 15))
                    .bold()
                if matchCardViewModel.matchCardVariable.showToast {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(Color.yellow)
                        Text("Action Saved")
                            .font(.system(size: 14, weight: .semibold))
                            .fixedSize()
                            .padding(.vertical,5)
                            .padding(.horizontal,10)
                            .foregroundColor(.black)
                            .transition(.scaleAndFade)
                            .animation(.default, value: matchCardViewModel.matchCardVariable.showToast)
                    }
                }
            }
            .padding(.top, 10)
            .frame(width: 150, height: 20)
            
            HStack{
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        viewModel.showLastFiveMatchView = true
                        viewModel.selectedMatchCardDetail = matchCardDetail
                    }
                }) {
                    Image(systemName: "chart.bar.xaxis")
                        .resizable()
                        .accentColor(.white)
                        .opacity(0.5)
                        .frame(width: 17, height: 15)
                }
            }
            .padding(.trailing,10)
        }
        .padding(.top,10)
    }
    
    
    //MARK: Team Logo And Name View
    func teamLogoAndNameView(teamName: String) -> some View {
        HStack(spacing:0){
            Spacer()
            VStack{
                Image(teamName.lowercased())
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 2)
                            .background(Color.clear)
                            .foregroundColor(Color.greyB2C0C3)
                    )
                Text(teamName)
                    .lineLimit(2)
                    .font(.system(size: 15, weight: .medium))
                    .multilineTextAlignment(.center)
                    .padding(.top,5)
            }
            Spacer()
        }
        .padding(.top,20)
    }
    
    //MARK: Custom TextFields View
    var customTextFieldsView: some View {
        HStack(spacing:20) {
            FocusTextField(text: matchCardViewModel.matchCardVariable.isFocused1 ? self.$matchCardViewModel.matchCardVariable.blank1.max(1) : self.$matchCardViewModel.matchCardVariable.textFieldText1.max(1), isFocused: $matchCardViewModel.matchCardVariable.isFocused1, submitAction: {
                onSubmitActions(fromButtons: false)
                matchCardViewModel.matchCardVariable.isFocused1 = false
            },
                           font: UIFont.boldSystemFont(ofSize: 30), // Custom font
                           textColor: matchCardViewModel.matchCardVariable.isFocused1 ? .white : (matchCardViewModel.matchCardVariable.textFieldText1.isEmpty || matchCardViewModel.matchCardVariable.textFieldText1 == "+") ? .yellow : .white
            )
            .accentColor(!($matchCardViewModel.matchCardVariable.textFieldText1.wrappedValue.isEmpty || $matchCardViewModel.matchCardVariable.blank1.wrappedValue.isEmpty) ? Color.clear : Color.white)
            .keyboardType(.numberPad)
            .font(.system(size: 30).weight(.bold))
            .frame(width: 50, height:50)
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(lineWidth: 2)
                    .animation(.default, value: matchCardViewModel.matchCardVariable.isFocused1)
                    .background(matchCardViewModel.matchCardVariable.isFocused1 ? Color.white.opacity(0.1) : .clear)
                    .foregroundColor(matchCardViewModel.matchCardVariable.isFocused1 ? .white : .yellow)
                    .frame(width: 50, height:50)
            )
            .onTapGesture {
                tapped()
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.matchCardViewModel.matchCardVariable.isFocused1 = true
                    self.matchCardViewModel.matchCardVariable.isFocused2 = false
                    matchCardViewModel.matchCardVariable.showKeyboard = true
                }
            }
            
            //MARK: Team 2 Score Field TextField
            
            FocusTextField(text: matchCardViewModel.matchCardVariable.isFocused2 ? self.$matchCardViewModel.matchCardVariable.blank2.max(1) : self.$matchCardViewModel.matchCardVariable.textFieldText2.max(1), isFocused: $matchCardViewModel.matchCardVariable.isFocused2, submitAction: {
                onSubmitActions(fromButtons: false)
                matchCardViewModel.matchCardVariable.isFocused2 = false
            },
                           font: UIFont.boldSystemFont(ofSize: 30), // Custom font
                           textColor: matchCardViewModel.matchCardVariable.isFocused2 ? .white : (matchCardViewModel.matchCardVariable.textFieldText2.isEmpty || matchCardViewModel.matchCardVariable.textFieldText2 == "+") ? .yellow : .white // Custom color
            )
            .accentColor(!($matchCardViewModel.matchCardVariable.textFieldText2.wrappedValue.isEmpty || $matchCardViewModel.matchCardVariable.blank2.wrappedValue.isEmpty) ? Color.clear : Color.white)
            .keyboardType(.numberPad)
            .font(.system(size: 30).weight(.bold))
            .frame(width: 50, height:50)
            .cornerRadius(3.0)
            .overlay(
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(lineWidth: 2)
                    .animation(.default, value: matchCardViewModel.matchCardVariable.isFocused2)
                    .background(matchCardViewModel.matchCardVariable.isFocused2 ? Color.white.opacity(0.1) : .clear)
                    .foregroundColor(matchCardViewModel.matchCardVariable.isFocused2 ? .white : .yellow)
                    .frame(width: 50, height:50)
            )
            
            .onTapGesture {
                tapped()
                withAnimation(.easeInOut(duration: 0.5)){
                    self.matchCardViewModel.matchCardVariable.isFocused1 = false
                    self.matchCardViewModel.matchCardVariable.isFocused2 = true
                    matchCardViewModel.matchCardVariable.showKeyboard = true
                }
            }
        }
        .padding()
    }
    
    
    //MARK: Popular Predictions Buttons
    var popularPredictionsButton: some View {
        VStack{
            Text("Popular predictions")
                .font(.system(size: 15))
                .opacity(0.8)
            HStack(alignment: .center, spacing: 25) {
                ForEach(matchCardDetail?.popularPredictions ?? []) {data in
                    VStack {
                        Button (action: {
                            matchCardViewModel.matchCardVariable.textFieldText1 = data.team1Prediction ?? ""
                            matchCardViewModel.matchCardVariable.blank1 = data.team1Prediction ?? ""
                            
                            matchCardViewModel.matchCardVariable.textFieldText2 = data.team2Prediction ?? ""
                            matchCardViewModel.matchCardVariable.blank2 = data.team2Prediction ?? ""
                            
                            onSubmitActions(fromButtons: true)
                        }) {
                            RoundedRectangle(cornerRadius: 20.0)
                                .stroke(Color.yellow, lineWidth: 1.5)
                                .background(checkPredictedButtonUUID() == data.id ? Color.yellow : Color.clear)
                                .cornerRadius(12.0)
                            
                                .overlay(
                                    Text("\(data.team1Prediction ?? "")-\(data.team2Prediction ?? "")")
                                        .fixedSize()
                                )
                                .foregroundColor(checkPredictedButtonUUID() == data.id ? Color.blue0D1E62 : Color.yellow)
                        }
                        .frame(width: 42, height: 22)
                        .font(.system(size: 15, weight: .medium))
                        
                        Text("\(data.predictionPercentage ?? "" )%")
                            .font(.caption)
                            .opacity(0.7)
                    }
                    .padding(.top,1)
                    .padding(.bottom, (matchCardViewModel.matchCardVariable.isFocused1 || matchCardViewModel.matchCardVariable.isFocused2 && matchCardViewModel.matchCardVariable.showKeyboard) ? (viewModel.checkIfSubmitted(matchid: matchCardDetail?.matchid ?? String()) ? 10 : 140) : 10)
                }
            }
        }
    }
    
    //MARK: First Team To Score Button
    var firstTeamToScoreButton: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.5)) {
                viewModel.showFirstTeamView = true
                viewModel.selectedMatchCardDetail = matchCardDetail
            }
        }) {
            HStack {
                Text(checkFirstTeamPrediction() ? "You Predicted:" : "First team to score")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                Text(checkFirstTeamPrediction() ? firstTeamToScorePredictedTeam() : "")
                    .font(.system(size: 15, weight:.bold))
                Spacer()
                
                if checkFirstTeamPrediction() {
                    if firstTeamToScorePredictedTeam().lowercased() == "none" {
                        Text("0 - 0")
                            .font(.system(size: 9))
                            .padding(7)
                            .overlay (
                                Circle()
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(
                                        .white
                                            .opacity(0.7)
                                    )
                            )
                    } else {
                        Image(checkFirstTeamPrediction() ? firstTeamToScorePredictedTeam().lowercased() : "")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .clipShape(Circle())
                    }
                } else {
                    Image(systemName: checkFirstTeamPrediction() ? firstTeamToScorePredictedTeam().lowercased() : "plus.circle")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 20, height: 20)
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.trailing, firstTeamToScorePredictedTeam().lowercased() == "none" ? -8 : 0)
        .padding(.vertical, checkFirstTeamPrediction() ? 8 : 10)
        .background(Color.blue0D1E62)
    }
    
    //MARK: Booster Button
    var boosterButton: some View {
        Button(action: {
            matchCardViewModel.matchCardVariable.isBoosterApplied.toggle()
            
            if viewModel.boosterAppliedMatchID == matchCardDetail?.matchid {
                viewModel.boosterAppliedMatchID = String()
            } else {
                viewModel.boosterAppliedMatchID = matchCardDetail?.matchid ?? String()
                withAnimation() {
                    matchCardViewModel.matchCardVariable.showToast = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            matchCardViewModel.matchCardVariable.showToast = false
                        }
                    }
                }
            }
        }) {
            HStack {
                Text(viewModel.checkBooster(matchid: matchCardDetail?.matchid ?? String()) ? "2x booster applied" : "Play 2x booster")
                    .foregroundColor(viewModel.checkBooster(matchid: matchCardDetail?.matchid ?? String()) ? Color("blue0D1E62") : Color.white)
                    .bold()
                
                Spacer()
                Image(systemName: viewModel.checkBooster(matchid: matchCardDetail?.matchid ?? String()) ? "bolt.circle.fill" : "plus.circle")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: viewModel.checkBooster(matchid: matchCardDetail?.matchid ?? String()) ? 22 : 20, height: viewModel.checkBooster(matchid: matchCardDetail?.matchid ?? String()) ? 22 : 20)
                    .overlay(
                        Circle()
                            .stroke(lineWidth: viewModel.checkBooster(matchid: matchCardDetail?.matchid ?? String()) ? 3 : 4)
                            .foregroundColor(viewModel.checkBooster(matchid: matchCardDetail?.matchid ?? String()) ? Color.blue0D1E62 : Color.yellow)
                    )
                    .background(Color.blue0D1E62)
                    .clipShape(Circle())
                
            }
            .padding(.vertical,
                     viewModel.checkBooster(matchid: matchCardDetail?.matchid ?? String())
                     ? 9 : 10)
        }
        .padding(.horizontal, 15)
        .padding(.bottom, (matchCardViewModel.matchCardVariable.isFocused1 || matchCardViewModel.matchCardVariable.isFocused2 && matchCardViewModel.matchCardVariable.showKeyboard) ? (viewModel.checkIfSubmitted(matchid: matchCardDetail?.matchid ?? String()) ? 40 : 0) : 0)
        .background(viewModel.checkBooster(matchid: matchCardDetail?.matchid ?? String()) ? Color.yellow : Color.blue0D1E62)
    }
    //MARK: Custom Keyboard Implementation
    var customKeyboardImplementation: some View{
        VStack {
            if ((matchCardViewModel.matchCardVariable.isFocused1 || matchCardViewModel.matchCardVariable.isFocused2) && matchCardViewModel.matchCardVariable.showKeyboard) {
                Spacer()
                CustomKeyboard(currentEnteredValue: { number in
                    enterTextInTextFields(withNumber: number)
                })
                .cornerRadius(15)
                .transition(.move(edge: .bottom))
                .animation(.default, value: matchCardViewModel.matchCardVariable.showKeyboard)
            }
        }
    }
    
    //MARK: Functions
    
    func onSubmitActions(fromButtons: Bool){
        if !fromButtons {
            if matchCardViewModel.matchCardVariable.blank1.isEmpty {
                matchCardViewModel.matchCardVariable.textFieldText1 = "+"
            } else {
                matchCardViewModel.matchCardVariable.textFieldText1 = matchCardViewModel.matchCardVariable.blank1
            }
            
            if matchCardViewModel.matchCardVariable.blank2.isEmpty {
                matchCardViewModel.matchCardVariable.textFieldText2 = "+"
            } else {
                matchCardViewModel.matchCardVariable.textFieldText2 = matchCardViewModel.matchCardVariable.blank2
            }
        }
        
        if !((matchCardViewModel.matchCardVariable.textFieldText1 == "+") || (matchCardViewModel.matchCardVariable.textFieldText1 == "")) && !((matchCardViewModel.matchCardVariable.textFieldText2 == "+") || (matchCardViewModel.matchCardVariable.textFieldText2 == "")) {
            withAnimation(.easeInOut(duration: 1)) {
                matchCardViewModel.matchCardVariable.showToast = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.easeIn(duration: 0.5)) {
                        matchCardViewModel.matchCardVariable.savedTeam1Pred = matchCardViewModel.matchCardVariable.textFieldText1
                        matchCardViewModel.matchCardVariable.savedTeam2Pred = matchCardViewModel.matchCardVariable.textFieldText2
                        matchCardViewModel.matchCardVariable.blank1 = matchCardViewModel.matchCardVariable.savedTeam1Pred
                        matchCardViewModel.matchCardVariable.blank2 = matchCardViewModel.matchCardVariable.savedTeam2Pred
                        
                        viewModel.storeData(matchid: matchCardDetail?.matchid ?? String(), team1Prediction: matchCardViewModel.matchCardVariable.savedTeam1Pred, team2Prediction: matchCardViewModel.matchCardVariable.savedTeam2Pred)
                    }
                }
                matchCardViewModel.matchCardVariable.showKeyboard = false
                matchCardViewModel.matchCardVariable.isFocused1 = false
                matchCardViewModel.matchCardVariable.isFocused2 = false
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation {
                matchCardViewModel.matchCardVariable.showToast = false
            }
        }
    }
    
    func enterTextInTextFields(withNumber number: String) {
        if matchCardViewModel.matchCardVariable.isFocused2 {
            matchCardViewModel.matchCardVariable.blank2 = number
            
            if !(number == "") {
                matchCardViewModel.matchCardVariable.textFieldText2 = number
            }
            
            if (!(number == "") && ((matchCardViewModel.matchCardVariable.textFieldText1 == "+") || (matchCardViewModel.matchCardVariable.textFieldText1 == ""))) {
                matchCardViewModel.matchCardVariable.isFocused1 = true
                return
            } else {
                onSubmitActions(fromButtons: false)
            }
        }
        
        if matchCardViewModel.matchCardVariable.isFocused1 {
            matchCardViewModel.matchCardVariable.blank1 = number
            
            if !(number == "") {
                matchCardViewModel.matchCardVariable.textFieldText1 = number
            }
            
            if (!(number == "") && ((matchCardViewModel.matchCardVariable.textFieldText2 == "+") || (matchCardViewModel.matchCardVariable.textFieldText2 == ""))) {
                matchCardViewModel.matchCardVariable.isFocused2 = true
                return
            } else {
                onSubmitActions(fromButtons: false)
            }
        }
    }
    
    func checkPredictedButtonUUID() -> UUID? {
        if viewModel.checkIfMatchIDExists(matchID: matchCardDetail?.matchid ?? String())
        {
            if let index = viewModel.matchCardStorage.firstIndex(where: { matchCardStorageModel in
                matchCardStorageModel.matchID == matchCardDetail?.matchid}) {
                return matchCardDetail?.popularPredictions?.first(where: { popularPrediction in
                    popularPrediction.team1Prediction == viewModel.matchCardStorage[index].pred1 &&
                    popularPrediction.team2Prediction == viewModel.matchCardStorage[index].pred2
                })?.id
            } else {
                return UUID()
            }
        } else {
            return UUID()
        }
    }
    
    func checkFirstTeamPrediction() -> Bool {
        if viewModel.checkIfMatchIDExists(matchID: matchCardDetail?.matchid ?? String()) {
            if let index = viewModel.selectedMatchIndexInStoredArr(matchID: matchCardDetail?.matchid ?? String()) {
                return viewModel.matchCardStorage[index].firstTeamToScore != String() ? true : false
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func firstTeamToScorePredictedTeam() -> String {
        if viewModel.checkIfMatchIDExists(matchID: matchCardDetail?.matchid ?? String()) {
            if let index = viewModel.matchCardStorage.firstIndex(where: { matchCardStorageModel in
                matchCardStorageModel.matchID == matchCardDetail?.matchid}) {
                return viewModel.matchCardStorage[index].firstTeamToScore
            } else {
                return String()
            }
        } else {
            return String()
        }
    }
    
    func assignTextfieldText() {
        if viewModel.checkIfMatchIDExists(matchID: matchCardDetail?.matchid ?? String()) {
            if let index = viewModel.matchCardStorage.firstIndex(where: { matchCardStorageModel in
                matchCardStorageModel.matchID == matchCardDetail?.matchid}) {
                matchCardViewModel.matchCardVariable.textFieldText1 = viewModel.matchCardStorage[index].pred1
                matchCardViewModel.matchCardVariable.blank1 = matchCardViewModel.matchCardVariable.textFieldText1
                matchCardViewModel.matchCardVariable.savedTeam1Pred = matchCardViewModel.matchCardVariable.blank1
                matchCardViewModel.matchCardVariable.textFieldText2 = viewModel.matchCardStorage[index].pred2
                matchCardViewModel.matchCardVariable.blank2 = matchCardViewModel.matchCardVariable.textFieldText2
                matchCardViewModel.matchCardVariable.savedTeam2Pred = matchCardViewModel.matchCardVariable.blank2
            }
        }
    }
    
    func onUnnecessaryTap() {
        withAnimation(.easeIn(duration: 0.5)) {
            matchCardViewModel.matchCardVariable.isFocused1 = false
            matchCardViewModel.matchCardVariable.isFocused2 = false
        }
        
        if !(viewModel.checkIfSubmitted(matchid: matchCardDetail?.matchid ?? String())) {
            matchCardViewModel.matchCardVariable.textFieldText1 = "+"
            matchCardViewModel.matchCardVariable.blank1 = ""
            
            matchCardViewModel.matchCardVariable.textFieldText2 = "+"
            matchCardViewModel.matchCardVariable.blank2 = ""
        } else {
            matchCardViewModel.matchCardVariable.textFieldText1 = matchCardViewModel.matchCardVariable.savedTeam1Pred
            matchCardViewModel.matchCardVariable.textFieldText2 = matchCardViewModel.matchCardVariable.savedTeam2Pred
            matchCardViewModel.matchCardVariable.blank1 = matchCardViewModel.matchCardVariable.savedTeam1Pred
            matchCardViewModel.matchCardVariable.blank2 = matchCardViewModel.matchCardVariable.savedTeam2Pred
        }
    }
}

//MARK: Custom transition modifier
extension AnyTransition {
    static var scaleAndFade: AnyTransition {
        AnyTransition.scale(scale: 0.1, anchor: .center)
            .combined(with: .opacity)
    }
}

//#Preview {
//    MatchCardView(matchCardDetail: allMatches.first?.matches?.first
////                  , showFirstTeamView: {_,_,_,_  in
//
////    }, showLastFiveView: {_,_,_ in
//
////    }, firstTeamToScore: Binding.constant("Germany"), matchIDFstTmVw: Binding.constant("123")
//    )
//    .environmentObject(SharedData())
//}
