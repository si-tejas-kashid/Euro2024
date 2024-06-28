////
////  MatchCardViewEnhanced.swift
////  UefaScreen
////
////  Created by Tejas Kashid on 25/06/24.
////
//
//import SwiftUI
//
//struct MatchCardViewEnhanced: View {
//    var match: Match
//    @StateObject var viewModel = MatchPredictorVM()
//    @EnvironmentObject var sharedData: SharedData
//    
//    var body: some View {
//        VStack {
//            VStack {
//                ZStack {
//                    ZStack {
//                        Text(match.matchDate ?? "")
//                            .font(.system(size: 15))
//                            .bold()
//                        
//                        if viewModel.matchCardDetail.showToast {
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 20.0)
//                                    .fill(Color.yellow)
//                                Text("Action Saved")
//                                //                                Text("Switched from Germany v Italy")
//                                    .font(.system(size: 14, weight: .semibold))
//                                    .fixedSize()
//                                    .padding(.vertical,5)
//                                    .padding(.horizontal,10)
//                                    .foregroundColor(.black)
//                                    .transition(.scaleAndFade)
//                                    .animation(.default, value: viewModel.matchCardDetail.showToast)
//                            }
//                        }
//                    }
//                    .padding(.top, 10)
//                    .frame(width: 150, height: 20)
//                    HStack{
//                        Spacer()
//                        Button(action: {
//                            //                            showLastFiveView(true, match?.team1Name ?? String(), match?.team2Name ?? String())
//                        }) {
//                            Image(systemName: "chart.bar.xaxis")
//                                .resizable()
//                                .accentColor(.white)
//                                .opacity(0.5)
//                                .frame(width: 17, height: 15)
//                        }
//                    }
//                    .padding(.trailing,10)
//                }
//                .padding(.top,10)
//                
//                
//                HStack() {
//                    
//                    //MARK: Team 1 Data
//                    HStack(spacing:0){
//                        Spacer()
//                        VStack{
//                            Image(match.team1Name?.lowercased() ?? "")
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                                .clipShape(Circle())
//                                .overlay(
//                                    Circle()
//                                        .stroke(lineWidth: 2)
//                                        .background(Color.clear)
//                                        .foregroundColor(Color.greyB2C0C3)
//                                )
//                            Text(match.team1Name ?? "")
//                                .lineLimit(2)
//                                .font(.system(size: 15, weight: .medium))
//                                .multilineTextAlignment(.center)
//                                .padding(.top,5)
//                        }
//                        Spacer()
//                    }
//                    .padding(.top,20)
//                    
//                    //MARK: Team 1 Score Field TextField
//                    HStack(spacing:20) {
//                        FocusTextField(text: viewModel.matchCardDetail.isFocused1 ? self.$viewModel.matchCardDetail.blank1.max(1) : self.$viewModel.matchCardDetail.textFieldText1.max(1), isFocused: $viewModel.matchCardDetail.isFocused1, submitAction: {
//                            viewModel.matchCardDetail.onSubmitActions(fromButtons: false)
//                            viewModel.matchCardDetail.isFocused1 = false
//                        },
//                                       font: UIFont.boldSystemFont(ofSize: 30), // Custom font
//                                       textColor: viewModel.matchCardDetail.isFocused1 ? .white : (viewModel.matchCardDetail.textFieldText1.isEmpty || viewModel.matchCardDetail.textFieldText1 == "+") ? .yellow : .white
//                        )
//                        .accentColor(!($viewModel.matchCardDetail.textFieldText1.wrappedValue.isEmpty || $viewModel.matchCardDetail.blank1.wrappedValue.isEmpty) ? Color.clear : Color.white)
//                        .keyboardType(.numberPad)
//                        .font(.system(size: 30).weight(.bold))
//                        .frame(width: 50, height:50)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 5.0)
//                                .stroke(lineWidth: 2)
//                                .animation(.default, value: viewModel.matchCardDetail.isFocused1)
//                                .background(viewModel.matchCardDetail.isFocused1 ? Color.white.opacity(0.1) : .clear)
//                                .foregroundColor(viewModel.matchCardDetail.isFocused1 ? .white : .yellow)
//                                .frame(width: 50, height:50)
//                        )
//                        .onTapGesture {
//                            withAnimation(.easeInOut(duration: 0.5)) {
//                                self.viewModel.matchCardDetail.isFocused1 = true
//                                self.viewModel.matchCardDetail.isFocused2 = false
//                                viewModel.matchCardDetail.showKeyboard = true
//                            }
//                        }
//                        
//                        //MARK: Team 2 Score Field TextField
//                        
//                        FocusTextField(text: viewModel.matchCardDetail.isFocused2 ? self.$viewModel.matchCardDetail.blank2.max(1) : self.$viewModel.matchCardDetail.textFieldText2.max(1),
//                                       isFocused: $viewModel.matchCardDetail.isFocused2, submitAction: {
//                            viewModel.matchCardDetail.onSubmitActions(fromButtons: false)
//                            viewModel.matchCardDetail.isFocused2 = false
//                        },
//                                       font: UIFont.boldSystemFont(ofSize: 30), // Custom font
//                                       textColor: viewModel.matchCardDetail.isFocused2 ? .white : (viewModel.matchCardDetail.textFieldText2.isEmpty || viewModel.matchCardDetail.textFieldText2 == "+") ? .yellow : .white // Custom color
//                        )
//                        .accentColor(!($viewModel.matchCardDetail.textFieldText2.wrappedValue.isEmpty || $viewModel.matchCardDetail.blank2.wrappedValue.isEmpty) ? Color.clear : Color.white)
//                        .keyboardType(.numberPad)
//                        .font(.system(size: 30).weight(.bold))
//                        .frame(width: 50, height:50)
//                        .cornerRadius(3.0)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 5.0)
//                                .stroke(lineWidth: 2)
//                                .animation(.default, value: viewModel.matchCardDetail.isFocused2)
//                                .background(viewModel.matchCardDetail.isFocused2 ? Color.white.opacity(0.1) : .clear)
//                                .foregroundColor(viewModel.matchCardDetail.isFocused2 ? .white : .yellow)
//                                .frame(width: 50, height:50)
//                        )
//                        
//                        .onTapGesture {
//                            withAnimation(.easeInOut(duration: 0.5)){
//                                self.viewModel.matchCardDetail.isFocused1 = false
//                                self.viewModel.matchCardDetail.isFocused2 = true
//                                viewModel.matchCardDetail.showKeyboard = true
//                            }
//                        }
//                    }
//                    .padding()
//                    
//                    //MARK: Team 2 Data
//                    HStack(spacing:0){
//                        Spacer()
//                        VStack{
//                            Image(match.team2Name?.lowercased() ?? "")
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                                .clipShape(Circle())
//                                .overlay(
//                                    Circle()
//                                        .stroke(lineWidth: 2)
//                                        .background(Color.clear)
//                                        .foregroundColor(Color.greyB2C0C3)
//                                )
//                            Text(match.team2Name ?? "")
//                                .lineLimit(2)
//                                .font(.system(size: 15, weight: .medium))
//                                .multilineTextAlignment(.center)
//                                .padding(.top,5)
//                        }
//                        Spacer()
//                    }
//                    .padding(.top,20)
//                    
//                }
//                
//                VStack {
//                    
//                    //MARK: Popular Predictions Buttons
//                    Text("Popular predictions")
//                        .font(.system(size: 15))
//                        .opacity(0.8)
//                    HStack(alignment: .center, spacing: 25) {
//                        ForEach(match.popularPredictions ?? []) {data in
//                            VStack {
//                                Button (action: {
//                                    viewModel.matchCardDetail.textFieldText1 = data.team1Prediction ?? ""
//                                    viewModel.matchCardDetail.blank1 = data.team1Prediction ?? ""
//                                    
//                                    viewModel.matchCardDetail.textFieldText2 = data.team2Prediction ?? ""
//                                    viewModel.matchCardDetail.blank2 = data.team2Prediction ?? ""
//                                    
//                                    viewModel.matchCardDetail.selectedButton = data.id
//                                    
//                                    viewModel.matchCardDetail.onSubmitActions(fromButtons: true)
//                                }) {
//                                    RoundedRectangle(cornerRadius: 20.0)
//                                        .stroke(Color.yellow, lineWidth: 1.5)
//                                        .background(viewModel.matchCardDetail.selectedButton == data.id ? Color.yellow : Color.clear)
//                                        .cornerRadius(12.0)
//                                    
//                                        .overlay(
//                                            Text("\(data.team1Prediction ?? "")-\(data.team2Prediction ?? "")")
//                                                .padding(.horizontal,8)
//                                                .padding(.vertical,3)
//                                        )
//                                        .foregroundColor(viewModel.matchCardDetail.selectedButton == data.id ? Color.blue0D1E62 : Color.yellow)
//                                }
//                                .frame(width: 42, height: 22)
//                                .font(.system(size: 15, weight: .medium))
//                                
//                                Text("\(data.predictionPercentage ?? "" )%")
//                                    .font(.caption)
//                                    .opacity(0.7)
//                            }
//                            .padding(.top,1)
//                            .padding(.bottom, (viewModel.matchCardDetail.isFocused1 || viewModel.matchCardDetail.isFocused2 && viewModel.matchCardDetail.showKeyboard) ? (viewModel.matchCardDetail.isSubmitted ? 10 : 140) : 10)
//                        }
//                    }
//                    
//                    if viewModel.matchCardDetail.isSubmitted {
//                        //                    if true{
//                        VStack(spacing:0) {
//                            Divider()
//                                .background(Color.white)
//                            
//                            //MARK: First Team To Score Button
//                            Button(action: {
//                                //                                print(viewModel.matchDay.matchIDFstTmVw)
//                                
//                                //                                showFirstTeamView(true, match?.team1Name ?? String(), match?.team2Name ?? String(), match?.matchid ?? String())
//                                
//                                //                                    print(viewModel.matchDay.matchIDFstTmVw)
//                                //                                    print(firstTeamToScore)
//                            }) {
//                                HStack {
//                                    Text(viewModel.matchCardDetail.hasChangesFirstTeamValue ? "You Predicted:" : "First team to score")
//                                        .foregroundColor(.white)
//                                        .font(.system(size: 15))
//                                    Text(viewModel.matchCardDetail.hasChangesFirstTeamValue ? viewModel.matchCardDetail.firstTeamToScore : "")
//                                        .font(.system(size: 15, weight:.bold))
//                                    Spacer()
//                                    
//                                    if viewModel.matchCardDetail.hasChangesFirstTeamValue {
//                                        Image(viewModel.matchCardDetail.hasChangesFirstTeamValue ? viewModel.matchCardDetail.firstTeamToScore.lowercased() : "")
//                                            .resizable()
//                                            .frame(width: 25, height: 25)
//                                            .clipShape(Circle())
//                                    } else {
//                                        Image(systemName: viewModel.matchCardDetail.hasChangesFirstTeamValue ? viewModel.matchCardDetail.firstTeamToScore.lowercased() : "plus.circle")
//                                            .resizable()
//                                            .foregroundColor(.yellow)
//                                            .frame(width: 20, height: 20)
//                                    }
//                                }
//                                .onChange(of: viewModel.matchCardDetail.firstTeamToScore) {newValue in
//                                    print(viewModel.matchCardDetail.matchIDFstTmVw)
//                                    //                                    print(match?.matchid ?? "")
//                                    //                                    print(hasChangesFirstTeamValue)     //this variable was true even before assigned true after it comes to the rest views other than the one which is selected
//                                    
//                                    if Int(viewModel.matchCardDetail.matchIDFstTmVw) == Int(match.matchid ?? "") {
//                                        print(viewModel.matchCardDetail.matchIDFstTmVw)
//                                        print(match.matchid ?? "")
//                                        viewModel.matchCardDetail.hasChangesFirstTeamValue = true
//                                        
//                                    } else {
//                                        //                                        hasChangesFirstTeamValue = false //if uncommented only last selected match gets the first team to score option rest get back to normal
//                                    }
//                                }
//                            }
//                            .padding(.horizontal, 15)
//                            .padding(.vertical,viewModel.matchCardDetail.hasChangesFirstTeamValue ? 7 : 10)
//                            .background(Color.blue0D1E62)
//                            
//                            Divider()
//                                .background(Color.white)
//                                .padding(.bottom,0)
//                            
//                            //MARK: Booster Button
//                            Button(action: {
//                                viewModel.matchCardDetail.isBoosterApplied.toggle()
//                                
//                                if sharedData.isBoosterApplied == match.matchid {
//                                    sharedData.isBoosterApplied = String()
//                                } else {
//                                    sharedData.isBoosterApplied = match.matchid ?? String()
//                                    withAnimation() {
//                                        viewModel.matchCardDetail.showToast = true
//                                        
//                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                                            withAnimation {
//                                                viewModel.matchCardDetail.showToast = false
//                                            }
//                                        }
//                                    }
//                                }
//                                
//                            }) {
//                                HStack {
//                                    Text(checkBooster() ? "2x booster applied" : "Play 2x booster")
//                                        .foregroundColor(checkBooster() ? Color("blue0D1E62") : Color.white)
//                                        .bold()
//                                    
//                                    Spacer()
//                                    Image(systemName: checkBooster() ? "bolt.circle.fill" : "plus.circle")
//                                        .resizable()
//                                        .foregroundColor(.yellow)
//                                        .frame(width: checkBooster() ? 22 : 20, height: checkBooster() ? 22 : 20)
//                                        .overlay(
//                                            Circle()
//                                                .stroke(lineWidth: checkBooster() ? 3 : 4)
//                                                .foregroundColor(checkBooster() ? Color.blue0D1E62 : Color.yellow)
//                                        )
//                                        .background(Color.blue0D1E62)
//                                        .clipShape(Circle())
//                                    
//                                }
//                                .padding(.vertical,checkBooster() ? 9 : 10)
//                            }
//                            .padding(.horizontal, 15)
//                            .padding(.bottom, (viewModel.matchCardDetail.isFocused1 || viewModel.matchCardDetail.isFocused2 && viewModel.matchCardDetail.showKeyboard) ? (viewModel.matchCardDetail.isSubmitted ? 40 : 0) : 0)
//                            .background(checkBooster() ? Color.yellow : Color.blue0D1E62)
//                        }
//                        .animation(.default, value: viewModel.matchCardDetail.isSubmitted)
//                        .padding(.bottom,0)
//                    }
//                }
//                .overlay(
//                    VStack {
//                        //MARK: Custom Keyboard Implementation
//                        if ((viewModel.matchCardDetail.isFocused1 || viewModel.matchCardDetail.isFocused2) && viewModel.matchCardDetail.showKeyboard) {
//                            CustomKeyboard(currentEnteredValue: { number in
//                                enterTextInTextFields(withNumber: number)
//                            })
//                            .transition(.move(edge: .bottom))
//                            .animation(.default, value: viewModel.matchCardDetail.showKeyboard)
//                        }
//                    }
//                )
//            }
//        }
//        .background(Color.blue0D1E62)
//        .foregroundColor(.white)
//        .onTapGesture {
//            withAnimation(.easeIn(duration: 0.5)) {
//                viewModel.matchCardDetail.isFocused1 = false
//                viewModel.matchCardDetail.isFocused2 = false
//            }
//            
//            if !viewModel.matchCardDetail.isSubmitted {
//                viewModel.matchCardDetail.textFieldText1 = "+"
//                viewModel.matchCardDetail.blank1 = ""
//                
//                viewModel.matchCardDetail.textFieldText2 = "+"
//                viewModel.matchCardDetail.blank2 = ""
//            } else {
//                viewModel.matchCardDetail.textFieldText1 = viewModel.matchCardDetail.savedTeam1Pred
//                viewModel.matchCardDetail.textFieldText2 = viewModel.matchCardDetail.savedTeam2Pred
//                viewModel.matchCardDetail.blank1 = viewModel.matchCardDetail.savedTeam1Pred
//                viewModel.matchCardDetail.blank2 = viewModel.matchCardDetail.savedTeam2Pred
//            }
//        }
//        .onAppear {
//            viewModel.matchCardDetail.matchIDFstTmVw = match.matchid ?? ""
//        }
//        
//    }
//    
//    
//    //MARK: Functions
//    
//    func checkBooster() -> Bool {
//        return sharedData.isBoosterApplied == match.matchid
//    }
//    
//    func enterTextInTextFields(withNumber number: String) {
//        if viewModel.matchCardDetail.isFocused2 {
//            viewModel.matchCardDetail.blank2 = number
//            
//            if !(number == "") {
//                viewModel.matchCardDetail.textFieldText2 = number
//            }
//            
//            if (!(number == "") && ((viewModel.matchCardDetail.textFieldText1 == "+") || (viewModel.matchCardDetail.textFieldText1 == ""))) {
//                viewModel.matchCardDetail.isFocused1 = true
//                return
//            } else {
//                onSubmitActions(fromButtons: false)
//            }
//        }
//        
//        if viewModel.matchCardDetail.isFocused1 {
//            viewModel.matchCardDetail.blank1 = number
//            
//            if !(number == "") {
//                viewModel.matchCardDetail.textFieldText1 = number
//            }
//            
//            if (!(number == "") && ((viewModel.matchCardDetail.textFieldText2 == "+") || (viewModel.matchCardDetail.textFieldText2 == ""))) {
//                viewModel.matchCardDetail.isFocused2 = true
//                return
//            } else {
//                onSubmitActions(fromButtons: false)
//            }
//        }
//    }
//    
//    func onSubmitActions(fromButtons: Bool){
//        if !fromButtons {
//            
//            if viewModel.matchCardDetail.blank1.isEmpty {
//                viewModel.matchCardDetail.textFieldText1 = "+"
//            } else {
//                viewModel.matchCardDetail.textFieldText1 = viewModel.matchCardDetail.blank1
//            }
//            
//            if viewModel.matchCardDetail.blank2.isEmpty {
//                viewModel.matchCardDetail.textFieldText2 = "+"
//            } else {
//                viewModel.matchCardDetail.textFieldText2 = viewModel.matchCardDetail.blank2
//            }
//        }
//        
//        if !((viewModel.matchCardDetail.textFieldText1 == "+") || (viewModel.matchCardDetail.textFieldText1 == "")) && !((viewModel.matchCardDetail.textFieldText2 == "+") || (viewModel.matchCardDetail.textFieldText2 == "")) {
//            withAnimation(.easeInOut(duration: 1)) {
//                viewModel.matchCardDetail.showToast = true
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                    withAnimation(.easeIn(duration: 0.5)) {
//                        viewModel.matchCardDetail.isSubmitted = true
//                        viewModel.matchCardDetail.savedTeam1Pred = viewModel.matchCardDetail.textFieldText1
//                        viewModel.matchCardDetail.savedTeam2Pred = viewModel.matchCardDetail.textFieldText2
//                        viewModel.matchCardDetail.blank1 = viewModel.matchCardDetail.savedTeam1Pred
//                        viewModel.matchCardDetail.blank2 = viewModel.matchCardDetail.savedTeam2Pred
//                    }
//                }
//                viewModel.matchCardDetail.showKeyboard = false
//                viewModel.matchCardDetail.isFocused1 = false
//                viewModel.matchCardDetail.isFocused2 = false
//            }
//            
//            viewModel.matchCardDetail.selectedButton = match.popularPredictions?.first{PopularPrediction in
//                PopularPrediction.team1Prediction == viewModel.matchCardDetail.textFieldText1 && PopularPrediction.team2Prediction == viewModel.matchCardDetail.textFieldText2
//            }?.id
//            
//            
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            withAnimation {
//                viewModel.matchCardDetail.showToast = false
//            }
//        }
//    }
//    
//    //    func onSubmitActions(fromButtons: Bool){
//    //        if !fromButtons {
//    //
//    //            if viewModel.matchCardDetail.blank1.isEmpty {
//    //                viewModel.matchCardDetail.textFieldText1 = "+"
//    //            } else {
//    //                viewModel.matchCardDetail.textFieldText1 = viewModel.matchCardDetail.blank1
//    //            }
//    //
//    //            if viewModel.matchCardDetail.blank2.isEmpty {
//    //                viewModel.matchCardDetail.textFieldText2 = "+"
//    //            } else {
//    //                viewModel.matchCardDetail.textFieldText2 = viewModel.matchCardDetail.blank2
//    //            }
//    //        }
//    //    }
//}
//
//////MARK: Custom transition modifier
////extension AnyTransition {
////    static var scaleAndFade: AnyTransition {
////        AnyTransition.scale(scale: 0.1, anchor: .center)
////            .combined(with: .opacity)
////    }
////}
//
////#Preview {
//////    MatchCardViewEnhanced(match: allMatches[0].matches?[0] ?? Match())
////}
