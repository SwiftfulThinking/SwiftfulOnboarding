//
//  AnyPickerSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

enum OnbPickerPosition {
    case auto
    case bottom
}

enum OnbPickerStyle {
    case wheel
    case menu
    case segmented
}

struct AnyPickerSlideView: View {

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
    var pickerPosition: OnbPickerPosition = .auto
    var pickerStyle: OnbPickerStyle = .wheel
    var pickerOptions: [String] = []
    var pickerHorizontalPadding: CGFloat = 24
    var onPickerChanged: ((String) -> Void)? = nil
    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var ctaButtonFormatData: OnbButtonFormatData = .default
    var onButtonClick: (() -> Void)? = nil

    @State private var selectedOption: String = ""

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

                // Picker
                Group {
                    switch pickerStyle {
                    case .wheel:
                        Picker("", selection: $selectedOption) {
                            ForEach(pickerOptions, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        }
                        .pickerStyle(.wheel)
                        .labelsHidden()
                    case .menu:
                        Picker("", selection: $selectedOption) {
                            ForEach(pickerOptions, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                    case .segmented:
                        Picker("", selection: $selectedOption) {
                            ForEach(pickerOptions, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        }
                        .pickerStyle(.segmented)
                        .labelsHidden()
                    }
                }
                .onChange(of: selectedOption) { newValue in
                    onPickerChanged?(newValue)
                }
                .onAppear {
                    if selectedOption.isEmpty, let firstOption = pickerOptions.first {
                        selectedOption = firstOption
                    }
                }
                .padding(.horizontal, pickerHorizontalPadding)
                .frame(maxWidth: .infinity, maxHeight: pickerPosition == .bottom ? .infinity : nil, alignment: pickerPosition == .bottom ? .bottom : .center)
            }
            .padding(.top, paddingTop)
            .padding(.bottom, paddingBottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: contentAlignment.alignment)

            // Continue button at bottom
            Text(ctaText)
                .onbButtonStyle(
                    style: ctaButtonStyle,
                    format: ctaButtonFormatData
                ) {
                    onButtonClick?()
                }
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
                .picker(
                    id: "slide1",
                    title: "Choose your country",
                    subtitle: "Wheel picker style",
                    pickerStyle: .wheel,
                    pickerOptions: ["United States", "Canada", "Mexico", "United Kingdom", "France", "Germany", "Japan", "Australia"]
                ),
                .picker(
                    id: "slide2",
                    title: "Select your plan",
                    subtitle: "Menu dropdown style",
                    pickerStyle: .menu,
                    pickerOptions: ["Free", "Basic - $9.99", "Pro - $19.99", "Enterprise - $49.99"]
                ),
                .picker(
                    id: "slide3",
                    title: "Pick a size",
                    subtitle: "Segmented control style",
                    pickerStyle: .segmented,
                    pickerOptions: ["Small", "Medium", "Large", "XL"]
                )
            ]
        )
    )
}
