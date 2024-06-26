//
//  ContentView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MatchPredictorView(matchdays: allMatches)
//        StickyViewTrial(matchdays: allMatches)
        
//        MatchCardView(matchCardDetail: allMatches.first?.matches?.first, boosterApplied: {booster in })
        
//        MatchPredictorViewEnhanced()
    }
}

#Preview {
    ContentView()
}
