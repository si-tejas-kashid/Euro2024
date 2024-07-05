//
//  ContentView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sharedData: CommonData
    
    var body: some View {
        MatchPredictorView(matchdays: allMatches)
            .onAppear{
                sharedData.orientation = UIDevice.current.orientation
            }
            .onRotate { UIDeviceOrientation in
                sharedData.orientation = UIDeviceOrientation
            }
        
//        CreateEmployeeView()
    }
}

//
//#Preview {
//    ContentView()
//}
