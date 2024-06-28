//
//  TextFieldFocusedState.swift
//  UefaScreen
//
//  Created by Tejas Kashid on 17/06/24.
//

import SwiftUI
import UIKit

struct FocusTextField: UIViewRepresentable {
    @Binding var text: String
    @Binding var isFocused: Bool
    var submitAction: () -> Void
    var font: UIFont
    var textColor: UIColor

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: FocusTextField

        init(parent: FocusTextField) {
            self.parent = parent
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.parent.isFocused = true
            }
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.parent.isFocused = false
            }
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            self.parent.submitAction()
            return true
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.parent.text = textField.text ?? ""
            }
        }
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.inputView = UIView() // hiding keyboard
        textField.inputAccessoryView = UIView() // hiding keyboard toolbar
        textField.delegate = context.coordinator
        textField.textAlignment = .center
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.spellCheckingType = .no
        textField.autocorrectionType = .no
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        DispatchQueue.main.async {
            uiView.text = text
            uiView.font = font
            uiView.textColor = textColor
        }
            if isFocused {
                uiView.becomeFirstResponder()
            } else {
                uiView.resignFirstResponder()
            }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}
