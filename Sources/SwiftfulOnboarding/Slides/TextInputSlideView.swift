//
//  TextInputSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

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
    var textFieldKeyboardType: UIKeyboardType = .default
    var textFieldHorizontalPadding: CGFloat = 24
    var isValidText: ((String) -> Bool)? = nil
    var onTextChanged: ((String) -> Void)? = nil
    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var ctaButtonFormatData: OnbButtonFormatData = .default
    var onButtonClick: (() -> Void)? = nil

    @State private var currentText: String = ""

    private var isTextValid: Bool {
        if let isValidText = isValidText {
            return isValidText(currentText)
        }
        return !currentText.isEmpty
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
                    onButtonClick?()
                }
                .disabled(!isTextValid)
                .padding(.top, footerData.top)
                .padding(.leading, footerData.leading)
                .padding(.trailing, footerData.trailing)
                .padding(.bottom, footerData.bottom)
        }
    }
}

#Preview {
    SwiftfulOnboardingView(
        configuration: OnbConfiguration(
            headerStyle: .progressBar,
            headerAlignment: .center,
            showBackButton: true,
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
