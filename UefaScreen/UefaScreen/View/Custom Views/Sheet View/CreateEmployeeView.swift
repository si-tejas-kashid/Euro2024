//
//  CreateEmployeeView.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 05/07/24.
//

import SwiftUI

struct CreateEmployeeView: View {
    @EnvironmentObject var viewModel: MatchPredictorVM
    @State var employeeName: String = String()
    @State var employeeSalary: String = String()
    @State var employeeAge: String = String()
    var submitDetail:(EmployeeRequestModel) -> ()
    
    var body: some View {
        VStack {
            createEmployeesViewHeaderView
            createEmployeesViewInputView
        }
        .cornerRadius(20)
        .background(viewModel.fromIpad ? Color.whiteF4F3F5 : Color.blue0D1E62)
        .foregroundColor(viewModel.fromIpad ? Color.grey000D40 : Color.white)
    }
    
    //MARK: Header View
    var createEmployeesViewHeaderView: some View {
        HStack {
            Text("Enter Details below")
                .bold()
                .padding(.top,5)
            Spacer()
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    viewModel.onDismiss()
                }
            }) {
                ZStack {
                    if viewModel.fromIpad{
                        Circle()
                            .fill()
                            .foregroundColor(Color.white)
                            .frame(width: 22)
                    }
                    Image(systemName: "xmark")
                        .opacity(0.6)
                        .font(.system(size: viewModel.fromIpad ? 10 : 15, weight: viewModel.fromIpad ? .bold : .medium))
                        .padding(viewModel.fromIpad ? 5 : 0)
                }
                
            }
        }
        .padding(.horizontal,15)
        .padding(.vertical,15)
    }
    
    //MARK: Input Fields
    var createEmployeesViewInputView: some View {
        VStack {
            HStack(spacing:10) {
                Text("Name:")
                    .bold()
                TextField(" Enter name", text: $employeeName)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(4.0)
                    .multilineTextAlignment(.center)
            }
            HStack(spacing:7) {
                Text("Salary:")
                    .bold()
                TextField(" Enter salary", text: $employeeSalary)
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .cornerRadius(4.0)
                    .multilineTextAlignment(.center)
            }
            
            HStack(spacing:25) {
                Text("Age:")
                    .bold()
                TextField(" Enter age", text: $employeeAge)
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .cornerRadius(4.0)
                    .multilineTextAlignment(.center)
            }
            
            Button(action: {
                if !(employeeName.isEmpty || Int(employeeSalary) ?? 0 < 0 || Int(employeeAge) ?? 0 < 0) {
                    submitDetail(EmployeeRequestModel(employeeName: employeeName,employeeSalary: Int(employeeSalary),employeeAge: Int(employeeAge)))
                }
            }) {
                Text("Submit")
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5.0)
                            .stroke()
                    )
            }
            .padding(.all, 1)
        }
        .padding([.horizontal,.bottom])
    }
    
}

//#Preview {
//    CreateEmployeeView()
//        
//}
