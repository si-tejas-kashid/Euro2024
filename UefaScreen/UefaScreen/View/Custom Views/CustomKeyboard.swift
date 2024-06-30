//
//  CustomKeyboard.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 05/06/24.
//

import SwiftUI

struct CustomKeyboard: View {
    let numbers = Array(1...9)
    var currentEnteredValue: (String) -> Void
    
    var body: some View {
        VStack {
            ForEach(0..<3) { row in
                HStack {
                    ForEach(0..<3) { column in
                        let number = numbers[row * 3 + column]
                        
                        customButton(number: "\(number)")
                    }
                }
                .padding(.horizontal,5)
                .padding(.vertical,1)
            }
            
            HStack {
                customButton(number: String())
                    .hidden()
                
                customButton(number: "0")
                customButton(number: String())
            }
            .padding(.vertical,1)
            .padding(.horizontal,5)
        }
        .padding(10)
        .background(Color.greyF3F4FC)
    }
    
    //MARK: Custom Button Function
    
    func customButton(number: String) -> some View {
        Button(action: {
            currentEnteredValue("\(number)")
        }) {
            VStack {
                if number == String() {
                    Image(systemName: "delete.left")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 33)
                        .foregroundColor(Color("grey000D40").opacity(0.6))
                        .cornerRadius(10)
                        .font(.title2)
                } else {
                    Text("\(number)")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 40)
                        .background(Color.white)
                        .foregroundColor(Color("grey000D40").opacity(0.8))
                        .cornerRadius(10)
                        .font(.system(size: 25, weight: .bold))
                }
            }
            .shadow(color: Color.black.opacity(0.14),
                    radius: 10,
                    x: 0,
                    y: 11)
        }
    }
}
#Preview {
    CustomKeyboard(currentEnteredValue: {_ in 
    })
}
