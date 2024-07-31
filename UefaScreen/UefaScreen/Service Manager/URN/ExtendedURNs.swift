//
//  ExtendedURNs.swift
//  POCNetworkManager
//
//  Created by Vidyasagar Kodunuri on 24/06/24.
//

import Foundation

struct ConfigURN: CommonGetURN {
    typealias Derived = String
    
    var baseURLType: BaseURLType {
        .base
    }
    
    var pathType: PathType {
        .config
    }
}

struct TranslationURN: CommonGetURN {
    typealias Derived = [String:String]
    
    var baseURLType: BaseURLType {
        .base
    }
    
    var pathType: PathType {
        .translation
    }
}

struct FixturesURN: CommonGetURN {
    var headers: ServiceHeaderType? {
        return .NONE
    }
    
    typealias Derived = Fixtures
    
    var baseURLType: BaseURLType {
        .base
    }
    
    var pathType: PathType {
        .fixtures
    }
    
}

struct UserPredictionsURN : CommonGetURN{
   
    
    typealias Derived = GetUserPredictions
    
    var baseURLType: BaseURLType {
        .base
    }
    
    var pathType: PathType{
        .userPredictions
    }
    
    var headers: ServiceHeaderType?{
        .DEFAULT
    }
}

// MARK: POST URN

struct SubmitPredictionsURN : CommonPostURN{
    typealias Derived = SubmitPredictionsResponse
    
    var baseURLType: BaseURLType {
        .base
    }
    
    var pathType: PathType{
        .submitPrediction
    }
    
    var body: Data?
    
    var headers: ServiceHeaderType?{
        .DEFAULT
    }
    
}

struct BoostersURN : CommonPostURN{
    typealias Derived = BoostersResponse
    
    var baseURLType: BaseURLType {
        .base
    }
    
    var pathType: PathType{
        .boosters
    }
    
    var body: Data?
    
    var headers: ServiceHeaderType?{
        .DEFAULT
    }
    
}



