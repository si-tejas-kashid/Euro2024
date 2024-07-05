//
//  BasrURLType.swift
//  POCNetworkManager
//
//  Created by Vidyasagar Kodunuri on 24/06/24.
//

import Foundation

enum BaseURLType {
    case base
    case none
    
    var baseUrlString: String {
        switch self {
        case .base:
            return Environments.staging.rawValue
        case .none:
            return String()
        }
    }
}
