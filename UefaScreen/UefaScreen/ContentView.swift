//
//  ContentView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        MatchPredictorView(matchdays: allMatches)
            .onRotate { UIDeviceOrientation in
                sharedData.orientation = UIDeviceOrientation
            }
//        StickyViewTrial(matchdays: allMatches)
        
//        MatchCardView(matchCardDetail: allMatches.first?.matches?.first, boosterApplied: {booster in })
        
//        MatchPredictorViewEnhanced()
    }
}

#Preview {
    ContentView()
}
