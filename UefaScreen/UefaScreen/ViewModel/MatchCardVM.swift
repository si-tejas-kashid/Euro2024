//
//  MatchCardVM.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 17/06/24.
//

import Foundation

class MatchCardVM: ObservableObject {
    @Published var matchCardVariable = MatchCardVariables()
}

struct MatchCardVariables {
    var isBoosterApplied: Bool = false
    var textFieldText1: String = "+"
    var textFieldText2: String = "+"
    var blank1: String = ""
    var blank2: String = ""
    var isFocused1: Bool = false
    var isFocused2: Bool = false
    var showToast: Bool = false
    var showKeyboard: Bool = false
    var savedTeam1Pred: String = ""
    var savedTeam2Pred: String = ""
    var isSubmitted: Bool = false //Temp variable
    var selectedButton: UUID? = nil
}
