//
//  OnbButtonStyleViewModifier.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

enum OnbButtonStyleType {
    case solid(backgroundColor: Color, textColor: Color, selectedBackgroundColor: Color? = nil, selectedTextColor: Color? = nil)
    case outline(textColor: Color, borderColor: Color, borderWidth: CGFloat = 2, selectedTextColor: Color? = nil, selectedBorderColor: Color? = nil)
    case solidOutline(backgroundColor: Color, textColor: Color, borderColor: Color, borderWidth: CGFloat = 2, selectedBackgroundColor: Color? = nil, selectedTextColor: Color? = nil, selectedBorderColor: Color? = nil)
    case duolingo(backgroundColor: Color, textColor: Color, shadowColor: Color, selectedBackgroundColor: Color? = nil, selectedTextColor: Color? = nil, selectedShadowColor: Color? = nil)

    func currentTextColor(isSelected: Bool) -> Color {
        switch self {
        case .solid(_, let textColor, _, let selectedTextColor):
            return isSelected ? (selectedTextColor ?? textColor) : textColor
        case .outline(let textColor, _, _, let selectedTextColor, _):
            return isSelected ? (selectedTextColor ?? textColor) : textColor
        case .solidOutline(_, let textColor, _, _, _, let selectedTextColor, _):
            return isSelected ? (selectedTextColor ?? textColor) : textColor
        case .duolingo(_, let textColor, _, _, let selectedTextColor, _):
            return isSelected ? (selectedTextColor ?? textColor) : textColor
        }
    }
}

enum OnbButtonPressStyle {
    case press
    case opacity
    case tap
}

enum OnbButtonHeight {
    case fixed(CGFloat)
    case verticalPadding(CGFloat)
}

struct OnbButtonStyle: ButtonStyle {

    var style: OnbButtonStyleType
    var pressStyle: OnbButtonPressStyle = .press
    var isSelected: Bool = false

    // Typography and sizing
    var font: Font = .headline
    var height: OnbButtonHeight = .verticalPadding(12)
    var cornerRadius: CGFloat = 12
    var horizontalPadding: CGFloat = 16

    private var fixedHeight: CGFloat? {
        switch height {
        case .fixed(let value): return value
        case .verticalPadding: return nil
        }
    }

    private var verticalPadding: CGFloat? {
        switch height {
        case .fixed: return nil
        case .verticalPadding(let padding): return padding
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        let scaleAmount: CGFloat = {
            switch pressStyle {
            case .press:
                return configuration.isPressed ? 0.975 : 1.0
            case .opacity:
                return 1.0
            case .tap:
                return 1.0
            }
        }()

        let opacityAmount: Double = {
            switch pressStyle {
            case .press:
                return 1.0
            case .opacity:
                return configuration.isPressed ? 0.85 : 1.0
            case .tap:
                return 1.0
            }
        }()

        switch style {
        case .solid(let backgroundColor, let textColor, let selectedBackgroundColor, let selectedTextColor):
            let currentBackgroundColor = isSelected ? (selectedBackgroundColor ?? backgroundColor.opacity(0.7)) : backgroundColor
            let currentTextColor = isSelected ? (selectedTextColor ?? textColor) : textColor

            configuration.label
                .font(font)
                .foregroundColor(currentTextColor)
                .frame(maxWidth: .infinity)
                .padding(.vertical, verticalPadding)
                .frame(height: fixedHeight)
                .padding(.horizontal, horizontalPadding)
                .background(currentBackgroundColor)
                .cornerRadius(cornerRadius)
                .scaleEffect(scaleAmount)
                .opacity(opacityAmount)
                .animation(.easeInOut(duration: 0.2), value: isSelected)

        case .outline(let textColor, let borderColor, let borderWidth, let selectedTextColor, let selectedBorderColor):
            let currentTextColor = isSelected ? (selectedTextColor ?? textColor) : textColor
            let currentBorderColor = isSelected ? (selectedBorderColor ?? borderColor) : borderColor

            configuration.label
                .font(font)
                .foregroundColor(currentTextColor)
                .frame(maxWidth: .infinity)
                .padding(.vertical, verticalPadding)
                .frame(height: fixedHeight)
                .background(Color.black.opacity(0.001))
                .padding(.horizontal, horizontalPadding)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(currentBorderColor, lineWidth: borderWidth)
                )
                .scaleEffect(scaleAmount)
                .opacity(opacityAmount)
                .animation(.easeInOut(duration: 0.2), value: isSelected)

        case .solidOutline(let backgroundColor, let textColor, let borderColor, let borderWidth, let selectedBackgroundColor, let selectedTextColor, let selectedBorderColor):
            let currentBackgroundColor = isSelected ? (selectedBackgroundColor ?? backgroundColor.opacity(0.7)) : backgroundColor
            let currentTextColor = isSelected ? (selectedTextColor ?? textColor) : textColor
            let currentBorderColor = isSelected ? (selectedBorderColor ?? borderColor) : borderColor

            configuration.label
                .font(font)
                .foregroundColor(currentTextColor)
                .frame(maxWidth: .infinity)
                .padding(.vertical, verticalPadding)
                .frame(height: fixedHeight)
                .padding(.horizontal, horizontalPadding)
                .background(currentBackgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(currentBorderColor, lineWidth: borderWidth)
                )
                .cornerRadius(cornerRadius)
                .scaleEffect(scaleAmount)
                .opacity(opacityAmount)
                .animation(.easeInOut(duration: 0.2), value: isSelected)

        case .duolingo(let backgroundColor, let textColor, let shadowColor, let selectedBackgroundColor, let selectedTextColor, let selectedShadowColor):
            let currentBackgroundColor = isSelected ? (selectedBackgroundColor ?? backgroundColor.opacity(0.8)) : backgroundColor
            let currentTextColor = isSelected ? (selectedTextColor ?? textColor) : textColor
            let currentShadowColor = isSelected ? (selectedShadowColor ?? shadowColor.opacity(0.6)) : shadowColor

            ZStack {
                // Shadow layer (stays in place)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(currentShadowColor.opacity(0.4))
                    .frame(maxWidth: .infinity)
                    .offset(y: 4)

                // Main button (moves down when pressed)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(currentBackgroundColor)
                    .frame(maxWidth: .infinity)
                    .offset(y: configuration.isPressed ? 3 : 0)

                // Top highlight (moves with main button)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.white.opacity(0.25),
                                Color.white.opacity(0)
                            ]),
                            startPoint: .top,
                            endPoint: .center
                        )
                    )
                    .frame(maxWidth: .infinity)
                    .offset(y: configuration.isPressed ? 3 : 0)

                // Label (moves with main button)
                configuration.label
                    .font(font.weight(.bold))
                    .foregroundColor(currentTextColor)
                    .padding(.horizontal, horizontalPadding)
                    .padding(.vertical, verticalPadding)
                    .frame(height: fixedHeight)
                    .offset(y: configuration.isPressed ? 3 : 0)
            }
            .padding(.vertical, verticalPadding)
            .frame(height: fixedHeight)
            .frame(maxWidth: .infinity)
            .animation(.easeInOut(duration: 0.2), value: isSelected)
        }
    }
}

// Extension for easier usage
extension View {
    func onbButtonStyle(
        style: OnbButtonStyleType,
        isSelected: Bool = false,
        pressStyle: OnbButtonPressStyle = .press,
        font: Font = .headline,
        height: OnbButtonHeight = .verticalPadding(12),
        cornerRadius: CGFloat = 12,
        horizontalPadding: CGFloat = 16,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            self
        }
        .buttonStyle(
            OnbButtonStyle(
                style: style,
                pressStyle: pressStyle,
                isSelected: isSelected,
                font: font,
                height: height,
                cornerRadius: cornerRadius,
                horizontalPadding: horizontalPadding
            )
        )
    }

    func onbButtonStyle(
        style: OnbButtonStyleType,
        isSelected: Bool = false,
        format: OnbButtonFormatData,
        horizontalPadding: CGFloat = 16,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            self
        }
        .buttonStyle(
            OnbButtonStyle(
                style: style,
                pressStyle: format.pressStyle,
                isSelected: isSelected,
                font: format.font,
                height: format.height,
                cornerRadius: format.cornerRadius,
                horizontalPadding: horizontalPadding
            )
        )
    }
}

#Preview {
    struct PreviewContent: View {
        @State private var isSelected: Bool = false

        var body: some View {
            ScrollView {
                VStack(spacing: 32) {
                    // Solid style
                    Text("Solid Blue")
                        .onbButtonStyle(
                            style: .solid(backgroundColor: .blue, textColor: .white, selectedBackgroundColor: .green, selectedTextColor: .black),
                            isSelected: isSelected,
                            pressStyle: .opacity
                        ) {
                            isSelected.toggle()
                            print("Solid Blue tapped")
                        }

                    Text("Solid Green")
                        .onbButtonStyle(
                            style: .solid(backgroundColor: .green, textColor: .black, selectedBackgroundColor: .blue, selectedTextColor: .white),
                            isSelected: isSelected,
                            pressStyle: .tap
                        ) {
                            isSelected.toggle()
                            print("Solid Green tapped")
                        }

                    // Outline style
                    Text("Outline Blue")
                        .onbButtonStyle(
                            style: .outline(textColor: .blue, borderColor: .blue, selectedTextColor: .cyan, selectedBorderColor: .cyan),
                            isSelected: isSelected
                        ) {
                            isSelected.toggle()
                            print("Outline Blue tapped")
                        }

                    Text("Outline Purple")
                        .onbButtonStyle(
                            style: .outline(textColor: .purple, borderColor: .purple, selectedTextColor: .pink, selectedBorderColor: .pink),
                            isSelected: isSelected
                        ) {
                            isSelected.toggle()
                            print("Outline Purple tapped")
                        }

                    // Solid Outline style
                    Text("Solid Outline Orange")
                        .onbButtonStyle(
                            style: .solidOutline(backgroundColor: .orange, textColor: .white, borderColor: .red, selectedBackgroundColor: .red, selectedTextColor: .white, selectedBorderColor: .orange),
                            isSelected: isSelected
                        ) {
                            isSelected.toggle()
                            print("Solid Outline Orange tapped")
                        }

                    Text("Solid Outline Custom")
                        .onbButtonStyle(
                            style: .solidOutline(backgroundColor: .indigo, textColor: .white, borderColor: .yellow, borderWidth: 3, selectedBackgroundColor: .yellow, selectedTextColor: .black, selectedBorderColor: .indigo),
                            isSelected: isSelected
                        ) {
                            isSelected.toggle()
                            print("Solid Outline Custom tapped")
                        }

                    // Duolingo style
                    Text("Duolingo Green")
                        .onbButtonStyle(
                            style: .duolingo(
                                backgroundColor: Color(red: 0.35, green: 0.78, blue: 0.14),
                                textColor: .white,
                                shadowColor: Color(red: 0.25, green: 0.58, blue: 0.10),
                                selectedBackgroundColor: Color(red: 0.25, green: 0.58, blue: 0.10),
                                selectedTextColor: .white,
                                selectedShadowColor: Color(red: 0.15, green: 0.38, blue: 0.05)
                            ),
                            isSelected: isSelected
                        ) {
                            isSelected.toggle()
                            print("Duolingo Green tapped")
                        }

                    Text("Duolingo Blue")
                        .onbButtonStyle(
                            style: .duolingo(backgroundColor: .blue, textColor: .white, shadowColor: .blue, selectedBackgroundColor: .purple, selectedTextColor: .white, selectedShadowColor: .purple),
                            isSelected: isSelected,
                            cornerRadius: 100
                        ) {
                            isSelected.toggle()
                            print("Duolingo Blue tapped")
                        }

                    // Custom configurations with different sizes
                    Text("Small Outline")
                        .onbButtonStyle(
                            style: .outline(textColor: .pink, borderColor: .pink, selectedTextColor: .red, selectedBorderColor: .red),
                            isSelected: isSelected,
                            font: .subheadline,
                            height: .fixed(40),
                            cornerRadius: 8
                        ) {
                            isSelected.toggle()
                            print("Small Outline tapped")
                        }

                    Text("Large Duolingo")
                        .onbButtonStyle(
                            style: .duolingo(backgroundColor: .purple, textColor: .white, shadowColor: .purple, selectedBackgroundColor: .indigo, selectedTextColor: .white, selectedShadowColor: .indigo),
                            isSelected: isSelected,
                            height: .fixed(72),
                            cornerRadius: 100
                        ) {
                            isSelected.toggle()
                            print("Large Duolingo tapped")
                        }

                    // Different press styles
                    Text("Press Style")
                        .onbButtonStyle(
                            style: .solid(backgroundColor: .orange, textColor: .white, selectedBackgroundColor: .red, selectedTextColor: .white),
                            isSelected: isSelected,
                            pressStyle: .press
                        ) {
                            isSelected.toggle()
                            print("Press style tapped")
                        }

                    Text("Opacity Style")
                        .onbButtonStyle(
                            style: .solid(backgroundColor: .teal, textColor: .white, selectedBackgroundColor: .cyan, selectedTextColor: .black),
                            isSelected: isSelected,
                            pressStyle: .opacity
                        ) {
                            isSelected.toggle()
                            print("Opacity style tapped")
                        }

                    Text("Tap Style (No Animation)")
                        .onbButtonStyle(
                            style: .solid(backgroundColor: .mint, textColor: .black, selectedBackgroundColor: .green, selectedTextColor: .white),
                            isSelected: isSelected,
                            pressStyle: .tap
                        ) {
                            isSelected.toggle()
                            print("Tap style tapped")
                        }

                }
                .padding()
            }
            .background(Color.gray.opacity(0.4))
        }
    }

    return PreviewContent()
}
