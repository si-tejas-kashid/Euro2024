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

struct EmployeesURN: CommonGetURN {
    typealias Derived = EmployeeResponseModel
    
    var baseURLType: BaseURLType {
        .base
    }
    
    var pathType: PathType {
        .employees
    }
}

struct CreateEmployeeURN: CommonPostURN {
    typealias Derived = CreateEmployee
    
    var baseURLType: BaseURLType {
        .base
    }
    
    var pathType: PathType {
        .createEmployee
    }
    
    var body: Data?
}
