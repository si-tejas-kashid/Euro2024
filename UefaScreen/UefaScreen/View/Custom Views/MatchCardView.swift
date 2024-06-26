//
//  MatchCard.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 04/06/24.
//

import SwiftUI

struct MatchCardView: View {
    
    var matchCardDetail: Match?
    @StateObject var matchCardDetailVM = MatchPredictorVM()
    @EnvironmentObject var sharedData: SharedData
    var showFirstTeamView: (Bool, String, String, String) -> ()
    var showLastFiveView: (Bool, String, String) -> ()
    @Binding var firstTeamToScore: String
    @Binding var matchIDFstTmVw: String
    @State var hasChangesFirstTeamValue: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    ZStack {
                        Text(matchCardDetail?.matchDate ?? "")
                            .font(.system(size: 15))
                            .bold()
                        if matchCardDetailVM.matchCardDetail.showToast {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20.0)
                                    .fill(Color.yellow)
                                Text("Action Saved")
                                //                                Text("Switched from Germany v Italy")
                                    .font(.system(size: 14, weight: .semibold))
                                    .fixedSize()
                                    .padding(.vertical,5)
                                    .padding(.horizontal,10)
                                    .foregroundColor(.black)
                                    .transition(.scaleAndFade)
                                    .animation(.default, value: matchCardDetailVM.matchCardDetail.showToast)
                            }
                        }
                    }
                    .padding(.top, 10)
                    .frame(width: 150, height: 20)
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            showLastFiveView(true, matchCardDetail?.team1Name ?? String(), matchCardDetail?.team2Name ?? String())
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
                
                HStack() {
                    
                    //MARK: Team 1 Data
                    HStack(spacing:0){
                        Spacer()
                        VStack{
                            Image(matchCardDetail?.team1Name?.lowercased() ?? "")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .background(Color.clear)
                                        .foregroundColor(Color.greyB2C0C3)
                                )
                            Text(matchCardDetail?.team1Name ?? "")
                                .lineLimit(2)
                                .font(.system(size: 15, weight: .medium))
                                .multilineTextAlignment(.center)
                                .padding(.top,5)
                        }
                        Spacer()
                    }
                    .padding(.top,20)
                    
                    //MARK: Team 1 Score Field TextField
                    HStack(spacing:20) {
                        FocusTextField(text: matchCardDetailVM.matchCardDetail.isFocused1 ? self.$matchCardDetailVM.matchCardDetail.blank1.max(1) : self.$matchCardDetailVM.matchCardDetail.textFieldText1.max(1), isFocused: $matchCardDetailVM.matchCardDetail.isFocused1, submitAction: {
                            onSubmitActions(fromButtons: false)
                            matchCardDetailVM.matchCardDetail.isFocused1 = false
                        },
                                       font: UIFont.boldSystemFont(ofSize: 30), // Custom font
                                       textColor: matchCardDetailVM.matchCardDetail.isFocused1 ? .white : (matchCardDetailVM.matchCardDetail.textFieldText1.isEmpty || matchCardDetailVM.matchCardDetail.textFieldText1 == "+") ? .yellow : .white
                        )
                        .accentColor(!($matchCardDetailVM.matchCardDetail.textFieldText1.wrappedValue.isEmpty || $matchCardDetailVM.matchCardDetail.blank1.wrappedValue.isEmpty) ? Color.clear : Color.white)
                        .keyboardType(.numberPad)
                        .font(.system(size: 30).weight(.bold))
                        .frame(width: 50, height:50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5.0)
                                .stroke(lineWidth: 2)
                                .animation(.default, value: matchCardDetailVM.matchCardDetail.isFocused1)
                                .background(matchCardDetailVM.matchCardDetail.isFocused1 ? Color.white.opacity(0.1) : .clear)
                                .foregroundColor(matchCardDetailVM.matchCardDetail.isFocused1 ? .white : .yellow)
                                .frame(width: 50, height:50)
                        )
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                self.matchCardDetailVM.matchCardDetail.isFocused1 = true
                                self.matchCardDetailVM.matchCardDetail.isFocused2 = false
                                matchCardDetailVM.matchCardDetail.showKeyboard = true
                            }
                        }
                        
                        //MARK: Team 2 Score Field TextField
                        
                        FocusTextField(text: matchCardDetailVM.matchCardDetail.isFocused2 ? self.$matchCardDetailVM.matchCardDetail.blank2.max(1) : self.$matchCardDetailVM.matchCardDetail.textFieldText2.max(1), isFocused: $matchCardDetailVM.matchCardDetail.isFocused2, submitAction: {
                            onSubmitActions(fromButtons: false)
                            matchCardDetailVM.matchCardDetail.isFocused2 = false
                        },
                                       font: UIFont.boldSystemFont(ofSize: 30), // Custom font
                                       textColor: matchCardDetailVM.matchCardDetail.isFocused2 ? .white : (matchCardDetailVM.matchCardDetail.textFieldText2.isEmpty || matchCardDetailVM.matchCardDetail.textFieldText2 == "+") ? .yellow : .white // Custom color
                        )
                        .accentColor(!($matchCardDetailVM.matchCardDetail.textFieldText2.wrappedValue.isEmpty || $matchCardDetailVM.matchCardDetail.blank2.wrappedValue.isEmpty) ? Color.clear : Color.white)
                        .keyboardType(.numberPad)
                        .font(.system(size: 30).weight(.bold))
                        .frame(width: 50, height:50)
                        .cornerRadius(3.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5.0)
                                .stroke(lineWidth: 2)
                                .animation(.default, value: matchCardDetailVM.matchCardDetail.isFocused2)
                                .background(matchCardDetailVM.matchCardDetail.isFocused2 ? Color.white.opacity(0.1) : .clear)
                                .foregroundColor(matchCardDetailVM.matchCardDetail.isFocused2 ? .white : .yellow)
                                .frame(width: 50, height:50)
                        )
                        
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)){
                                self.matchCardDetailVM.matchCardDetail.isFocused1 = false
                                self.matchCardDetailVM.matchCardDetail.isFocused2 = true
                                matchCardDetailVM.matchCardDetail.showKeyboard = true
                            }
                        }
                    }
                    .padding()
                    
                    //MARK: Team 2 Data
                    HStack(spacing:0){
                        Spacer()
                        VStack{
                            Image(matchCardDetail?.team2Name?.lowercased() ?? "")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .background(Color.clear)
                                        .foregroundColor(Color.greyB2C0C3)
                                )
                            Text(matchCardDetail?.team2Name ?? "")
                                .lineLimit(2)
                                .font(.system(size: 15, weight: .medium))
                                .multilineTextAlignment(.center)
                                .padding(.top,5)
                        }
                        Spacer()
                    }
                    .padding(.top,20)
                    
                }
                
                //                ZStack {
                VStack {
                    
                    //MARK: Popular Predictions Buttons
                    Text("Popular predictions")
                        .font(.system(size: 15))
                        .opacity(0.8)
                    HStack(alignment: .center, spacing: 25) {
                        ForEach(matchCardDetail?.popularPredictions ?? []) {data in
                            VStack {
                                Button (action: {
                                    matchCardDetailVM.matchCardDetail.textFieldText1 = data.team1Prediction ?? ""
                                    matchCardDetailVM.matchCardDetail.blank1 = data.team1Prediction ?? ""
                                    
                                    matchCardDetailVM.matchCardDetail.textFieldText2 = data.team2Prediction ?? ""
                                    matchCardDetailVM.matchCardDetail.blank2 = data.team2Prediction ?? ""
                                    
                                    matchCardDetailVM.matchCardDetail.selectedButton = data.id
                                    
                                    onSubmitActions(fromButtons: true)
                                }) {
                                    RoundedRectangle(cornerRadius: 20.0)
                                        .stroke(Color.yellow, lineWidth: 1.5)
                                        .background(matchCardDetailVM.matchCardDetail.selectedButton == data.id ? Color.yellow : Color.clear)
                                        .cornerRadius(12.0)
                                    
                                        .overlay(
                                            Text("\(data.team1Prediction ?? "")-\(data.team2Prediction ?? "")")
                                                .padding(.horizontal,8)
                                                .padding(.vertical,3)
                                        )
                                        .foregroundColor(matchCardDetailVM.matchCardDetail.selectedButton == data.id ? Color.blue0D1E62 : Color.yellow)
                                }
                                .frame(width: 42, height: 22)
                                .font(.system(size: 15, weight: .medium))
                                
                                Text("\(data.predictionPercentage ?? "" )%")
                                    .font(.caption)
                                    .opacity(0.7)
                            }
                            .padding(.top,1)
                            .padding(.bottom, (matchCardDetailVM.matchCardDetail.isFocused1 || matchCardDetailVM.matchCardDetail.isFocused2 && matchCardDetailVM.matchCardDetail.showKeyboard) ? (matchCardDetailVM.matchCardDetail.isSubmitted ? 10 : 140) : 10)
                        }
                    }
                    
                    if matchCardDetailVM.matchCardDetail.isSubmitted {
                        //                    if true{
                        VStack(spacing:0) {
                            Divider()
                                .background(Color.white)
                            
                            //MARK: First Team To Score Button
                            Button(action: {
                                                                print(matchCardDetailVM.matchDay.matchIDFstTmVw)
                                showFirstTeamView(true, matchCardDetail?.team1Name ?? String(), matchCardDetail?.team2Name ?? String(), matchCardDetail?.matchid ?? String())
                                                                    print(matchCardDetailVM.matchDay.matchIDFstTmVw)
                                                                    print(firstTeamToScore)
                            }) {
                                HStack {
                                    Text(hasChangesFirstTeamValue ? "You Predicted:" : "First team to score")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15))
                                    Text(hasChangesFirstTeamValue ? firstTeamToScore : "")
                                        .font(.system(size: 15, weight:.bold))
                                    Spacer()
                                    
                                    if hasChangesFirstTeamValue {
                                        Image(hasChangesFirstTeamValue ? firstTeamToScore.lowercased() : "")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .clipShape(Circle())
                                    } else {
                                        Image(systemName: hasChangesFirstTeamValue ? firstTeamToScore.lowercased() : "plus.circle")
                                            .resizable()
                                            .foregroundColor(.yellow)
                                            .frame(width: 20, height: 20)
                                    }
                                }
//                                HStack {
//                                    Text("First team to score")
//                                        .foregroundColor(.white)
//                                        .font(.system(size: 15))
//                                    Text("")
//                                        .font(.system(size: 15, weight:.bold))
//                                    Spacer()
//                                    
////                                    if hasChangesFirstTeamValue {
////                                        Image(hasChangesFirstTeamValue ? firstTeamToScore.lowercased() : "")
////                                            .resizable()
////                                            .frame(width: 25, height: 25)
////                                            .clipShape(Circle())
////                                    } else {
//                                        Image(systemName:/* hasChangesFirstTeamValue ? firstTeamToScore.lowercased() :*/ "plus.circle")
//                                            .resizable()
//                                            .foregroundColor(.yellow)
//                                            .frame(width: 20, height: 20)
////                                    }
//                                }
                                .onChange(of: firstTeamToScore) {newValue in
                                    print(matchIDFstTmVw)
                                    //                                    print(matchCardDetail?.matchid ?? "")
                                    //                                    print(hasChangesFirstTeamValue)     //this variable was true even before assigned true after it comes to the rest views other than the one which is selected
                                    
                                    if Int(matchIDFstTmVw) == Int(matchCardDetail?.matchid ?? "") {
                                        print(matchIDFstTmVw)
                                        print(matchCardDetail?.matchid ?? "")
                                        hasChangesFirstTeamValue = true
                                        
                                    } else {
                                                                                hasChangesFirstTeamValue = false //if uncommented only last selected match gets the first team to score option rest get back to normal
                                    }
                                }
                            }
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .background(Color.blue0D1E62)
                            
                            Divider()
                                .background(Color.white)
                                .padding(.bottom,0)
                            
                            //MARK: Booster Button
                            Button(action: {
                                matchCardDetailVM.matchCardDetail.isBoosterApplied.toggle()
                                
                                if sharedData.isBoosterApplied == matchCardDetail?.matchid {
                                    sharedData.isBoosterApplied = String()
                                } else {
                                    sharedData.isBoosterApplied = matchCardDetail?.matchid ?? String()
                                    withAnimation() {
                                        matchCardDetailVM.matchCardDetail.showToast = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                            withAnimation {
                                                matchCardDetailVM.matchCardDetail.showToast = false
                                            }
                                        }
                                    }
                                }
                                
                            }) {
                                HStack {
                                    Text(checkBooster() ? "2x booster applied" : "Play 2x booster")
                                        .foregroundColor(checkBooster() ? Color("blue0D1E62") : Color.white)
                                        .bold()
                                    
                                    Spacer()
                                    Image(systemName: checkBooster() ? "bolt.circle.fill" : "plus.circle")
                                        .resizable()
                                        .foregroundColor(.yellow)
                                        .frame(width: checkBooster() ? 22 : 20, height: checkBooster() ? 22 : 20)
                                        .overlay(
                                            Circle()
                                                .stroke(lineWidth: checkBooster() ? 3 : 4)
                                                .foregroundColor(checkBooster() ? Color.blue0D1E62 : Color.yellow)
                                        )
                                        .background(Color.blue0D1E62)
                                        .clipShape(Circle())
                                    
                                }
                                .padding(.vertical,checkBooster() ? 9 : 10)
                            }
                            .padding(.horizontal, 15)
                            .padding(.bottom, (matchCardDetailVM.matchCardDetail.isFocused1 || matchCardDetailVM.matchCardDetail.isFocused2 && matchCardDetailVM.matchCardDetail.showKeyboard) ? (matchCardDetailVM.matchCardDetail.isSubmitted ? 40 : 0) : 0)
                            .background(checkBooster() ? Color.yellow : Color.blue0D1E62)
                        }
                        .animation(.default, value: matchCardDetailVM.matchCardDetail.isSubmitted)
                        .padding(.bottom,0)
                    }
                }
                .overlay(
                    VStack {
                        //MARK: Custom Keyboard Implementation
                        if ((matchCardDetailVM.matchCardDetail.isFocused1 || matchCardDetailVM.matchCardDetail.isFocused2) && matchCardDetailVM.matchCardDetail.showKeyboard) {
                            CustomKeyboard(currentEnteredValue: { number in
                                enterTextInTextFields(withNumber: number)
                            })
                            .transition(.move(edge: .bottom))
                            .animation(.default, value: matchCardDetailVM.matchCardDetail.showKeyboard)
                        }
                    }
                )
            }
        }
        .background(Color.blue0D1E62)
        .foregroundColor(.white)
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.5)) {
                matchCardDetailVM.matchCardDetail.isFocused1 = false
                matchCardDetailVM.matchCardDetail.isFocused2 = false
            }
            
            if !matchCardDetailVM.matchCardDetail.isSubmitted {
                matchCardDetailVM.matchCardDetail.textFieldText1 = "+"
                matchCardDetailVM.matchCardDetail.blank1 = ""
                
                matchCardDetailVM.matchCardDetail.textFieldText2 = "+"
                matchCardDetailVM.matchCardDetail.blank2 = ""
            } else {
                matchCardDetailVM.matchCardDetail.textFieldText1 = matchCardDetailVM.matchCardDetail.savedTeam1Pred
                matchCardDetailVM.matchCardDetail.textFieldText2 = matchCardDetailVM.matchCardDetail.savedTeam2Pred
                matchCardDetailVM.matchCardDetail.blank1 = matchCardDetailVM.matchCardDetail.savedTeam1Pred
                matchCardDetailVM.matchCardDetail.blank2 = matchCardDetailVM.matchCardDetail.savedTeam2Pred
            }
        }
        .onAppear {
//            matchIDFstTmVw = matchCardDetail?.matchid ?? ""
        }
        
    }
    
    //MARK: Functions
    
    func checkBooster() -> Bool {
        return sharedData.isBoosterApplied == matchCardDetail?.matchid
    }
    
    func onSubmitActions(fromButtons: Bool){
        if !fromButtons {
            
            if matchCardDetailVM.matchCardDetail.blank1.isEmpty {
                matchCardDetailVM.matchCardDetail.textFieldText1 = "+"
            } else {
                matchCardDetailVM.matchCardDetail.textFieldText1 = matchCardDetailVM.matchCardDetail.blank1
            }
            
            if matchCardDetailVM.matchCardDetail.blank2.isEmpty {
                matchCardDetailVM.matchCardDetail.textFieldText2 = "+"
            } else {
                matchCardDetailVM.matchCardDetail.textFieldText2 = matchCardDetailVM.matchCardDetail.blank2
            }
        }
        
        if !((matchCardDetailVM.matchCardDetail.textFieldText1 == "+") || (matchCardDetailVM.matchCardDetail.textFieldText1 == "")) && !((matchCardDetailVM.matchCardDetail.textFieldText2 == "+") || (matchCardDetailVM.matchCardDetail.textFieldText2 == "")) {
            withAnimation(.easeInOut(duration: 1)) {
                matchCardDetailVM.matchCardDetail.showToast = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.easeIn(duration: 0.5)) {
                        matchCardDetailVM.matchCardDetail.isSubmitted = true
                        matchCardDetailVM.matchCardDetail.savedTeam1Pred = matchCardDetailVM.matchCardDetail.textFieldText1
                        matchCardDetailVM.matchCardDetail.savedTeam2Pred = matchCardDetailVM.matchCardDetail.textFieldText2
                        matchCardDetailVM.matchCardDetail.blank1 = matchCardDetailVM.matchCardDetail.savedTeam1Pred
                        matchCardDetailVM.matchCardDetail.blank2 = matchCardDetailVM.matchCardDetail.savedTeam2Pred
                    }
                }
                matchCardDetailVM.matchCardDetail.showKeyboard = false
                matchCardDetailVM.matchCardDetail.isFocused1 = false
                matchCardDetailVM.matchCardDetail.isFocused2 = false
            }
            
            matchCardDetailVM.matchCardDetail.selectedButton = matchCardDetail?.popularPredictions?.first{PopularPrediction in
                PopularPrediction.team1Prediction == matchCardDetailVM.matchCardDetail.textFieldText1 && PopularPrediction.team2Prediction == matchCardDetailVM.matchCardDetail.textFieldText2
            }?.id
            
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation {
                matchCardDetailVM.matchCardDetail.showToast = false
            }
        }
    }
    
    func enterTextInTextFields(withNumber number: String) {
        if matchCardDetailVM.matchCardDetail.isFocused2 {
            matchCardDetailVM.matchCardDetail.blank2 = number
            
            if !(number == "") {
                matchCardDetailVM.matchCardDetail.textFieldText2 = number
            }
            
            if (!(number == "") && ((matchCardDetailVM.matchCardDetail.textFieldText1 == "+") || (matchCardDetailVM.matchCardDetail.textFieldText1 == ""))) {
                matchCardDetailVM.matchCardDetail.isFocused1 = true
                return
            } else {
                onSubmitActions(fromButtons: false)
            }
        }
        
        if matchCardDetailVM.matchCardDetail.isFocused1 {
            matchCardDetailVM.matchCardDetail.blank1 = number
            
            if !(number == "") {
                matchCardDetailVM.matchCardDetail.textFieldText1 = number
            }
            
            if (!(number == "") && ((matchCardDetailVM.matchCardDetail.textFieldText2 == "+") || (matchCardDetailVM.matchCardDetail.textFieldText2 == ""))) {
                matchCardDetailVM.matchCardDetail.isFocused2 = true
                return
            } else {
                onSubmitActions(fromButtons: false)
            }
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

#Preview {
    MatchCardView(matchCardDetail: allMatches.first?.matches?.first
                  , showFirstTeamView: {_,_,_,_  in
        
    }, showLastFiveView: {_,_,_ in
        
    }, firstTeamToScore: Binding.constant("Germany"), matchIDFstTmVw: Binding.constant("123")
    )
    .environmentObject(SharedData())
}
