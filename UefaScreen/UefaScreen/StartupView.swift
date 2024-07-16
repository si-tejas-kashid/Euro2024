//
//  StartupView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 11/07/24.
//

import SwiftUI

struct StartupView: View {
    @EnvironmentObject var sharedData: CommonData
    @StateObject var viewModel = MatchPredictorVM()
    
    var body: some View {
        
        VStack {
                
                MatchPredictorView()
                    .onAppear{
                        sharedData.orientation = UIDevice.current.orientation
                    }
                    .onRotate { UIDeviceOrientation in
                        sharedData.orientation = UIDeviceOrientation
                    }
                    .environmentObject(viewModel)
            
        }
        .onAppear {
            viewModel.getFixturesData()            
        }
        
    }
}

#Preview {
    StartupView()
}
