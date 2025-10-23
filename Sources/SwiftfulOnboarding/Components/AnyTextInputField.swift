//
//  AnyTextInputField.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

#if canImport(UIKit)
import UIKit
#endif
import SwiftUI

struct AnyTextInputField: View {

    var backgroundColor: Color = .white
    var borderColor: Color = .gray
    var borderWidth: CGFloat = 1
    var cornerRadius: CGFloat = 8
    var font: Font = .body
    var placeholder: String = "Enter text"
    var keyboardType: UIKeyboardType = .default
    var startingText: String? = nil
    var onTextChanged: ((String) -> Void)? = nil

    @State private var text: String = ""

    var body: some View {
        TextField(placeholder, text: $text)
            .font(font)
            .keyboardType(keyboardType)
            .padding(12)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .cornerRadius(cornerRadius)
            .onAppear {
                if let startingText = startingText {
                    text = startingText
                }
            }
            .onChange(of: text) { newValue in
                onTextChanged?(newValue)
            }
    }
}

#Preview {
    VStack(spacing: 16) {
        AnyTextInputField(
            placeholder: "Default Style"
        )

        AnyTextInputField(
            backgroundColor: .blue.opacity(0.1),
            borderColor: .blue,
            borderWidth: 2,
            cornerRadius: 12,
            font: .headline,
            placeholder: "Custom Style"
        )

        AnyTextInputField(
            backgroundColor: .green.opacity(0.1),
            borderColor: .green,
            borderWidth: 3,
            cornerRadius: 20,
            font: .title3,
            placeholder: "Another Style"
        )
    }
    .padding()
}
