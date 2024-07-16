//
//  SharedData.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 22/06/24.
//

import Foundation
import UIKit

class CommonData: ObservableObject {
    @Published var isBoosterApplied = ""
    @Published var orientation: UIDeviceOrientation = UIDevice.current.orientation
}
