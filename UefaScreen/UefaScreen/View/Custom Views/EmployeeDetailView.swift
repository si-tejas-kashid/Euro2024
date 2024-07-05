//
//  EmployeeDetailView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 04/07/24.
//

import SwiftUI

struct EmployeeDetailView: View {
    var employeeDetail: EmployeeData
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                Spacer()
                Text(employeeDetail.employeeName ?? String())
                    .font(.system(size: 20, weight: .bold))
            }
            HStack {
                Text("Age: ")
                Spacer()
                Text("\(employeeDetail.employeeAge ?? 0)")
                    .font(.system(size: 20, weight: .bold))
            }
        }
        .padding()
        .background(Color.blue0D1E62)
        .foregroundColor(.white)
    }
}


#Preview {
    EmployeeDetailView(employeeDetail: EmployeeData(id: 1, employeeName: "Tejas", employeeSalary: 1, employeeAge: 1, profileImage: ""))
}
