//
//  OnbTitleContent.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

struct OnbTitleContent: View {

    var title: String? = nil
    var titleFont: Font = .largeTitle
    var subtitle: String? = nil
    var subtitleFont: Font = .body
    var spacing: CGFloat = 12

    var body: some View {
        VStack(spacing: spacing) {
            if let title = title {
                Text(title)
                    .font(titleFont)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }

            if let subtitle = subtitle {
                Text(subtitle)
                    .font(subtitleFont)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
            }
        }
    }
}

#Preview {
    VStack(spacing: 40) {
        // Both title and subtitle
        OnbTitleContent(
            title: "Welcome to Our App",
            subtitle: "Experience something amazing"
        )

        // Title only
        OnbTitleContent(
            title: "Get Started"
        )

        // Subtitle only
        OnbTitleContent(
            subtitle: "It's quick and easy"
        )

        // Custom fonts
        OnbTitleContent(
            title: "Custom Fonts",
            titleFont: .title,
            subtitle: "With different styling",
            subtitleFont: .callout
        )

        // Custom spacing
        OnbTitleContent(
            title: "Custom Spacing",
            subtitle: "More space between title and subtitle",
            spacing: 24
        )

        // Small fonts
        OnbTitleContent(
            title: "Small Title",
            titleFont: .title2,
            subtitle: "Small subtitle text",
            subtitleFont: .caption
        )

        // No spacing
        OnbTitleContent(
            title: "No Spacing",
            titleFont: .headline,
            subtitle: "Tight layout",
            subtitleFont: .subheadline,
            spacing: 4
        )
    }
    .padding()
}
