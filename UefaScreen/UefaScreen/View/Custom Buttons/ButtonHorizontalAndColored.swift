//
//  ButtonHorizontalAndColored.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 03/06/24.
//

import SwiftUI

struct ButtonHorizontalAndColored: View {
    var imageName: String?
    var systemImage: Bool?
    var buttonText: String?
    
    var body: some View {
        Button(action: {
//            print("Copy code")
        }) {
            HStack {
                Text(buttonText ?? "")
                Spacer()
                if systemImage ?? false {
                    Image(systemName: imageName ?? "")
                } else {
                    Image(imageName ?? "")
                }
            }
            .padding(.horizontal,15)
            .padding(.vertical, 20)
            
            .background(Color.blue0D1E62)
        }}
}

#Preview {
    ButtonHorizontalAndColored()
}
