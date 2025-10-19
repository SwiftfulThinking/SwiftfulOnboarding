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

struct OnbButtonContent: View {

    let text: String
    var secondaryContent: OnbButtonSecondaryContent? = nil
    var secondaryContentPlacement: OnbButtonSecondaryContentPlacement = .trailing

    var body: some View {
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
            Text(text)
        }
    }

    @ViewBuilder
    private func leadingView(secondaryContent: OnbButtonSecondaryContent) -> some View {
        ZStack {
            Text(text)

            secondaryContentView(secondaryContent)
                .frame(maxWidth: .infinity, alignment: .leading)
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
        ZStack {
            Text(text)

            secondaryContentView(secondaryContent)
                .frame(maxWidth: .infinity, alignment: .trailing)
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

        // Outline style with different placements
        OnbButtonContent(
            text: "Back",
            secondaryContent: .emoji("⬅️"),
            secondaryContentPlacement: .leading
        )
        .onbButtonStyle(
            style: .outline(textColor: .blue, borderColor: .blue)
        ) {
            print("Back tapped")
        }

        OnbButtonContent(
            text: "Next",
            secondaryContent: .emoji("➡️"),
            secondaryContentPlacement: .trailing
        )
        .onbButtonStyle(
            style: .outline(textColor: .blue, borderColor: .blue)
        ) {
            print("Next tapped")
        }
    }
    .padding()
}