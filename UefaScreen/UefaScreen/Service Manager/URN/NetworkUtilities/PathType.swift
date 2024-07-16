//
//  PathType.swift
//  POCNetworkManager
//
//  Created by Vidyasagar Kodunuri on 24/06/24.
//

import Foundation

enum PathType {
    case config
    case translation
    case employees
    case createEmployee
    case fixtures
    case userPredictions(guid: String)
    
    private var endPoint: String {
        switch self {
        case .config:
            return  String()
        case .translation:
            return String()
        case .employees:
            return "employees"
        case .createEmployee:
            return "create"
        case .fixtures:
            return "predictor/feeds/fixtures/fixtures_1_1_en.json"
        case .userPredictions:
            let url = PredictorUtils.shared.userPredictionURL
                .replacingOccurrences(of: PredictorParamKeys.guid, with: PredictorUserDetails.shared.getGUID())
                .replacingOccurrences(of: PredictorParamKeys.buster, with: PredictorUserDetails.shared.getTempBusterValue())
            return url
        }
    }
    
    
    var rawValue: String {
        var url: String = endPoint
        switch self {
        case .config:
            url = url.replacingOccurrences(of: URLParamKeys.buster, with: BusterHelper.shared.getBusterFor(type: getBusterType ?? .particularCase))
            return url
        case .translation, .employees, .createEmployee, .fixtures, .userPredictions:
            return url
        }
    }
    
    var getBusterType: BusterHelper.BusterType? {
        if endPoint.contains("/team") || endPoint.contains("/gamedays") || endPoint.contains("/game-card")  {
            return .normal
        } else if endPoint.contains("/private") || endPoint.contains("/public") ||
                    endPoint.contains("create") || endPoint.contains("disjoin") || endPoint.contains("join")   {
            return .particularCase
        } else {
            return .normal
        }
    }
}

