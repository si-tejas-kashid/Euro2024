//
//  TextFieldFocus.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 17/06/24.
//

import SwiftUI

struct TextFieldFocus: View {
    @State private var isFocused = false
    @State private var text: String = ""

    var body: some View {
        VStack {
            FocusableView(isFocused: $isFocused, placeholder: "Enter text here")
                .padding()
            
            Button("Focus Text Field") {
                self.isFocused = true
            }
            .padding()
        }
    }
}

#Preview {
    TextFieldFocus()
}
