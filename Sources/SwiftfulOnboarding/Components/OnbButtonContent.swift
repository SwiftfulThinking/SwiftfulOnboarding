//
//  OnbButtonContent.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

enum OnbButtonSecondaryContent {
    case emoji(String)
}

enum OnbButtonSecondaryContentPlacement {
    case leading
    case centerLeading
    case centerTrailing
    case trailing
}

enum OnbButtonTextPlacement {
    case center
    case leading
}

struct OnbButtonContent: View {

    let text: String
    var secondaryContent: OnbButtonSecondaryContent? = nil
    var secondaryContentPlacement: OnbButtonSecondaryContentPlacement = .trailing
    var textPlacement: OnbButtonTextPlacement = .center
    var horizontalPadding: CGFloat = 12

    var body: some View {
        Group {
            if let secondaryContent = secondaryContent {
                switch secondaryContentPlacement {
                case .leading:
                    leadingView(secondaryContent: secondaryContent)
                case .centerLeading:
                    centerLeadingView(secondaryContent: secondaryContent)
                case .centerTrailing:
                    centerTrailingView(secondaryContent: secondaryContent)
                case .trailing:
                    trailingView(secondaryContent: secondaryContent)
                }
            } else {
                switch textPlacement {
                case .center:
                    Text(text)
                case .leading:
                    HStack {
                        Text(text)
                        Spacer()
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }

    @ViewBuilder
    private func leadingView(secondaryContent: OnbButtonSecondaryContent) -> some View {
        switch textPlacement {
        case .center:
            ZStack {
                Text(text)

                secondaryContentView(secondaryContent)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        case .leading:
            HStack(spacing: 8) {
                secondaryContentView(secondaryContent)
                Text(text)
                Spacer()
            }
        }
    }

    @ViewBuilder
    private func centerLeadingView(secondaryContent: OnbButtonSecondaryContent) -> some View {
        HStack(spacing: 8) {
            secondaryContentView(secondaryContent)
            Text(text)
        }
    }

    @ViewBuilder
    private func centerTrailingView(secondaryContent: OnbButtonSecondaryContent) -> some View {
        HStack(spacing: 8) {
            Text(text)
            secondaryContentView(secondaryContent)
        }
    }

    @ViewBuilder
    private func trailingView(secondaryContent: OnbButtonSecondaryContent) -> some View {
        switch textPlacement {
        case .center:
            ZStack {
                Text(text)

                secondaryContentView(secondaryContent)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        case .leading:
            HStack(spacing: 8) {
                Text(text)
                secondaryContentView(secondaryContent)
                Spacer()
            }
        }
    }

    @ViewBuilder
    private func secondaryContentView(_ content: OnbButtonSecondaryContent) -> some View {
        switch content {
        case .emoji(let emoji):
            Text(emoji)
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 32) {
        // Basic text examples
        OnbButtonContent(text: "Continue")

        OnbButtonContent(text: "Get Started")

        OnbButtonContent(text: "Sign Up")

        // With emoji
        OnbButtonContent(
            text: "Continue",
            secondaryContent: .emoji("→")
        )

        OnbButtonContent(
            text: "Get Started",
            secondaryContent: .emoji("🚀")
        )

        OnbButtonContent(
            text: "Sign Up",
            secondaryContent: .emoji("✨")
        )

        // Different placement options
        OnbButtonContent(
            text: "Leading",
            secondaryContent: .emoji("←"),
            secondaryContentPlacement: .leading
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .blue, textColor: .white)
        ) {
            print("Leading tapped")
        }

        OnbButtonContent(
            text: "Center Leading",
            secondaryContent: .emoji("💫"),
            secondaryContentPlacement: .centerLeading
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .purple, textColor: .white)
        ) {
            print("Center Leading tapped")
        }

        OnbButtonContent(
            text: "Center Trailing",
            secondaryContent: .emoji("✨"),
            secondaryContentPlacement: .centerTrailing
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .orange, textColor: .white)
        ) {
            print("Center Trailing tapped")
        }

        OnbButtonContent(
            text: "Trailing",
            secondaryContent: .emoji("→"),
            secondaryContentPlacement: .trailing
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .green, textColor: .white)
        ) {
            print("Trailing tapped")
        }

        // Leading text placement examples
        Divider()

        Text("Leading Text Placement")
            .font(.headline)

        OnbButtonContent(
            text: "Back",
            secondaryContent: .emoji("⬅️"),
            secondaryContentPlacement: .leading,
            textPlacement: .leading
        )
        .onbButtonStyle(
            style: .outline(textColor: .blue, borderColor: .blue)
        ) {
            print("Back with leading text tapped")
        }

        OnbButtonContent(
            text: "Continue",
            secondaryContent: .emoji("→"),
            secondaryContentPlacement: .trailing,
            textPlacement: .leading
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .blue, textColor: .white)
        ) {
            print("Continue with leading text tapped")
        }

        OnbButtonContent(
            text: "Settings",
            textPlacement: .leading
        )
        .onbButtonStyle(
            style: .outline(textColor: .gray, borderColor: .gray)
        ) {
            print("Settings tapped")
        }

        // With horizontal padding
        Divider()

        Text("With Horizontal Padding")
            .font(.headline)

        OnbButtonContent(
            text: "Padded Button",
            secondaryContent: .emoji("🔲"),
            secondaryContentPlacement: .trailing,
            horizontalPadding: 16
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .purple, textColor: .white)
        ) {
            print("Padded button tapped")
        }

        OnbButtonContent(
            text: "Menu Item",
            secondaryContent: .emoji("›"),
            secondaryContentPlacement: .trailing,
            textPlacement: .leading,
            horizontalPadding: 20
        )
        .onbButtonStyle(
            style: .outline(textColor: .blue, borderColor: .blue)
        ) {
            print("Menu item tapped")
        }
        }
        .padding()
    }
}