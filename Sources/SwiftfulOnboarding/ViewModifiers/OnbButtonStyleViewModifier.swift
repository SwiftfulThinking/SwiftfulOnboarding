//
//  OnbButtonStyleViewModifier.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

enum OnbButtonStyleType {
    case solid(backgroundColor: Color, textColor: Color)
    case outline(textColor: Color, borderColor: Color)
    case solidOutline(backgroundColor: Color, textColor: Color, borderColor: Color)
    case duolingo(backgroundColor: Color, textColor: Color, shadowColor: Color)
}

enum OnbButtonPressStyle {
    case press
    case opacity
    case tap
}

struct OnbButtonStyle: ButtonStyle {

    var style: OnbButtonStyleType
    var pressStyle: OnbButtonPressStyle = .press

    // Typography and sizing
    var font: Font = .headline
    var height: CGFloat = 56
    var cornerRadius: CGFloat = 12
    var horizontalPadding: CGFloat = 16
    var borderWidth: CGFloat = 2

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
        case .solid(let backgroundColor, let textColor):
            configuration.label
                .font(font)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
                .padding(.horizontal, horizontalPadding)
                .scaleEffect(scaleAmount)
                .opacity(opacityAmount)

        case .outline(let textColor, let borderColor):
            configuration.label
                .font(font)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .background(Color.black.opacity(0.001))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: borderWidth)
                )
                .padding(.horizontal, horizontalPadding)
                .scaleEffect(scaleAmount)
                .opacity(opacityAmount)

        case .solidOutline(let backgroundColor, let textColor, let borderColor):
            configuration.label
                .font(font)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .background(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: borderWidth)
                )
                .cornerRadius(cornerRadius)
                .padding(.horizontal, horizontalPadding)
                .scaleEffect(scaleAmount)
                .opacity(opacityAmount)

        case .duolingo(let backgroundColor, let textColor, let shadowColor):
            ZStack {
                // Shadow layer (stays in place)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(shadowColor.opacity(0.4))
                    .frame(maxWidth: .infinity)
                    .frame(height: height)
                    .offset(y: 4)

                // Main button (moves down when pressed)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .frame(maxWidth: .infinity)
                    .frame(height: height)
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
                    .frame(height: height)
                    .offset(y: configuration.isPressed ? 3 : 0)

                // Label (moves with main button)
                configuration.label
                    .font(font.weight(.bold))
                    .foregroundColor(textColor)
                    .offset(y: configuration.isPressed ? 3 : 0)
            }
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .padding(.horizontal, horizontalPadding)
        }
    }
}

// Extension for easier usage
extension View {
    func onbButtonStyle(
        style: OnbButtonStyleType,
        pressStyle: OnbButtonPressStyle = .press,
        font: Font = .headline,
        height: CGFloat = 56,
        cornerRadius: CGFloat = 12,
        horizontalPadding: CGFloat = 16,
        borderWidth: CGFloat = 2,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            self
        }
        .buttonStyle(
            OnbButtonStyle(
                style: style,
                pressStyle: pressStyle,
                font: font,
                height: height,
                cornerRadius: cornerRadius,
                horizontalPadding: horizontalPadding,
                borderWidth: borderWidth
            )
        )
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 32) {
            // Solid style
            Text("Solid Blue")
                .onbButtonStyle(
                    style: .solid(backgroundColor: .blue, textColor: .white),
                    pressStyle: .opacity
                ) {
                    print("Solid Blue tapped")
                }

            Text("Solid Green")
                .onbButtonStyle(
                    style: .solid(backgroundColor: .green, textColor: .black),
                    pressStyle: .tap
                ) {
                    print("Solid Green tapped")
                }

            // Outline style
            Text("Outline Blue")
                .onbButtonStyle(
                    style: .outline(textColor: .blue, borderColor: .blue)
                ) {
                    print("Outline Blue tapped")
                }

            Text("Outline Purple")
                .onbButtonStyle(
                    style: .outline(textColor: .purple, borderColor: .purple)
                ) {
                    print("Outline Purple tapped")
                }

            // Solid Outline style
            Text("Solid Outline Orange")
                .onbButtonStyle(
                    style: .solidOutline(backgroundColor: .orange, textColor: .white, borderColor: .red)
                ) {
                    print("Solid Outline Orange tapped")
                }

            Text("Solid Outline Custom")
                .onbButtonStyle(
                    style: .solidOutline(backgroundColor: .indigo, textColor: .white, borderColor: .yellow),
                    borderWidth: 3
                ) {
                    print("Solid Outline Custom tapped")
                }

            // Duolingo style
            Text("Duolingo Green")
                .onbButtonStyle(
                    style: .duolingo(
                        backgroundColor: Color(red: 0.35, green: 0.78, blue: 0.14),
                        textColor: .white,
                        shadowColor: Color(red: 0.25, green: 0.58, blue: 0.10)
                    )
                ) {
                    print("Duolingo Green tapped")
                }

            Text("Duolingo Blue")
                .onbButtonStyle(
                    style: .duolingo(backgroundColor: .blue, textColor: .white, shadowColor: .blue)
                ) {
                    print("Duolingo Blue tapped")
                }

            // Custom configurations with different sizes
            Text("Small Outline")
                .onbButtonStyle(
                    style: .outline(textColor: .pink, borderColor: .pink),
                    font: .subheadline,
                    height: 40,
                    cornerRadius: 8
                ) {
                    print("Small Outline tapped")
                }

            Text("Large Duolingo")
                .onbButtonStyle(
                    style: .duolingo(backgroundColor: .purple, textColor: .white, shadowColor: .purple),
                    height: 72,
                    cornerRadius: 100
                ) {
                    print("Large Duolingo tapped")
                }

            // Different press styles
            Text("Press Style")
                .onbButtonStyle(
                    style: .solid(backgroundColor: .orange, textColor: .white),
                    pressStyle: .press
                ) {
                    print("Press style tapped")
                }

            Text("Opacity Style")
                .onbButtonStyle(
                    style: .solid(backgroundColor: .teal, textColor: .white),
                    pressStyle: .opacity
                ) {
                    print("Opacity style tapped")
                }

            Text("Tap Style (No Animation)")
                .onbButtonStyle(
                    style: .solid(backgroundColor: .mint, textColor: .black),
                    pressStyle: .tap
                ) {
                    print("Tap style tapped")
                }
        }
        .padding()
    }
    .background(Color.gray.opacity(0.4))
}
