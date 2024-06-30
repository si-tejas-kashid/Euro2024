//
//  UefaScreenApp.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 31/05/24.
//

import SwiftUI

@main
struct UefaScreenApp: App {
    @StateObject private var sharedData = CommonData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sharedData)
        }
    }
}
