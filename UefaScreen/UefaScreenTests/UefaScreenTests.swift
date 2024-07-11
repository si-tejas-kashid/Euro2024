//
//  UefaScreenTests.swift
//  UefaScreenTests
//
//  Created by Tejas Kashid on 08/07/24.
//

import XCTest
import SwiftUI
@testable import UefaScreen

final class UefaScreenTests: XCTestCase {
    
    @MainActor func testSelectedMatchDay() {
        
//        let exp = expectation(description: "Wait for onAppear to complete")
        let uefaScreenMatchPredictorView = MatchPredictorView()
        let hostingController = UIHostingController(rootView: uefaScreenMatchPredictorView)
        _ = hostingController.view
        
        let viewModel = uefaScreenMatchPredictorView.viewModel
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            let viewModel = uefaScreenMatchPredictorView.viewModel
            XCTAssertEqual(viewModel.selectedMatchDay, 121)
            print(viewModel.selectedMatchDay ?? .zero)
        }
//        wait(for: [exp], timeout: 2.0)
        print(viewModel.selectedMatchDay ?? .zero)
    }
}
