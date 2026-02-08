//
//  TextInputSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import UIKit
import SwiftUI

enum OnbTextFieldPosition {
    case auto
    case bottom
}

struct TextInputSlideView: View {

    var title: String? = nil
    var titleFont: Font = .largeTitle
    var subtitle: String? = nil
    var subtitleFont: Font = .body
    var titleSubtitleSpacing: CGFloat = 8
    var titleAlignment: OnbTextAlignment = .center
    var contentAlignment: OnbContentAlignment = .center
    var paddingTop: CGFloat = 40
    var paddingBottom: CGFloat = 0
    var horizontalPaddingTitle: CGFloat = 40
    var contentSpacing: CGFloat = 24
    var textFieldPosition: OnbTextFieldPosition = .auto
    var textFieldBackgroundColor: Color = .white
    var textFieldBorderColor: Color = .gray
    var textFieldBorderWidth: CGFloat = 1
    var textFieldCornerRadius: CGFloat = 8
    var textFieldFont: Font = .body
    var textFieldPlaceholder: String = "Enter text"
    var textFieldKeyboardType: OnbKeyboardType = .default
    var textFieldHorizontalPadding: CGFloat = 24
    var textFieldStartingText: String? = nil
    var isValidText: ((String) -> Bool)? = nil
    var onTextChanged: ((String) -> Void)? = nil
    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var ctaButtonFormatData: OnbButtonFormatData = .default
    var onButtonClick: (([OnbChoiceOption]) -> Void)? = nil
    var selectedOptions: [OnbChoiceOption] = []

    @State private var currentText: String = ""

    private func initializeText() {
        if let startingText = textFieldStartingText, currentText.isEmpty {
            currentText = startingText
        } else if let savedText = selectedOptions.first?.content.text, currentText.isEmpty {
            currentText = savedText
        }
    }

    private var isTextValid: Bool {
        if let isValidText = isValidText {
            return isValidText(currentText)
        }
        return !currentText.isEmpty
    }

    private func textToOption(_ text: String) -> OnbChoiceOption {
        OnbChoiceOption(
            id: "text_input",
            content: OnbButtonContentData(text: text, value: text)
        )
    }

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: contentSpacing) {
                // Title and subtitle
                OnbTitleContent(
                    title: title,
                    titleFont: titleFont,
                    subtitle: subtitle,
                    subtitleFont: subtitleFont,
                    spacing: titleSubtitleSpacing,
                    alignment: titleAlignment
                )
                .padding(.horizontal, horizontalPaddingTitle)

                // Text field
                AnyTextInputField(
                    backgroundColor: textFieldBackgroundColor,
                    borderColor: textFieldBorderColor,
                    borderWidth: textFieldBorderWidth,
                    cornerRadius: textFieldCornerRadius,
                    font: textFieldFont,
                    placeholder: textFieldPlaceholder,
                    keyboardType: textFieldKeyboardType,
                    startingText: textFieldStartingText,
                    onTextChanged: { text in
                        currentText = text
                        onTextChanged?(text)
                    }
                )
                .padding(.horizontal, textFieldHorizontalPadding)
                .frame(maxWidth: .infinity, maxHeight: textFieldPosition == .bottom ? .infinity : nil, alignment: textFieldPosition == .bottom ? .bottom : .center)
            }
            .padding(.top, paddingTop)
            .padding(.bottom, paddingBottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: contentAlignment.alignment)

            // Continue button at bottom
            Text(ctaText)
                .onbButtonStyle(
                    style: ctaButtonStyle,
                    isSelected: isTextValid,
                    format: ctaButtonFormatData
                ) {
                    let option = textToOption(currentText)
                    onButtonClick?([option])
                }
                .disabled(!isTextValid)
                .padding(.top, footerData.top)
                .padding(.leading, footerData.leading)
                .padding(.trailing, footerData.trailing)
                .padding(.bottom, footerData.bottom)
        }
        .onAppear {
            initializeText()
        }
    }
}

#Preview {
    SwiftfulOnboardingView(
        configuration: OnbConfiguration(
            headerConfiguration: OnbHeaderConfiguration(
                headerStyle: .progressBar,
                headerAlignment: .center,
                showBackButton: .afterFirstSlide
            ),
            slides: [
                .textInput(
                    id: "slide1",
                    title: "What's your name?",
                    subtitle: "Default keyboard",
                    textFieldKeyboardType: .default
                ),
                .textInput(
                    id: "slide2",
                    title: "Your Email",
                    subtitle: "Email keyboard",
                    textFieldKeyboardType: .emailAddress
                ),
                .textInput(
                    id: "slide3",
                    title: "Your Phone Number",
                    subtitle: "Number pad keyboard",
                    textFieldKeyboardType: .numberPad
                )
            ]
        )
    )
}
