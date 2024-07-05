//
//  EmployeeModel.swift
//  POCNetworkManager
//
//  Created by Tejas Kashid on 04/07/24.
//

import Foundation

struct EmployeeResponseModel: Decodable {
    let status: String?
    let data: [EmployeeData]?
    let message: String?
}

struct EmployeeData: Decodable {
    let id: Int?
    let employeeName: String?
    let employeeSalary: Int?
    let employeeAge: Int?
    let profileImage: String?

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}

//MARK: - Employee Request Model

struct EmployeeRequestModel: Encodable {
    let employeeName: String?
    let employeeSalary: Int?
    let employeeAge: Int?
    
    enum CodingKeys: String, CodingKey {
        case employeeName = "name"
        case employeeSalary = "salary"
        case employeeAge = "age"
    }
}

// MARK: - CreateEmployee
struct CreateEmployee: Decodable {
    let status: String
    let data: DataClass
    let message: String
}

// MARK: - DataClass
struct DataClass: Decodable {
    let name: String
    let salary: Int
    let age: Int
    let id: Int
}


