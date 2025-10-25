//
//  OnbTitleContent.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

public enum OnbTextAlignment {
    case leading
    case center
    case trailing

    var textAlignment: TextAlignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }

    var frameAlignment: Alignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}

struct OnbTitleContent: View {

    var title: String? = nil
    var titleFont: Font = .largeTitle
    var subtitle: String? = nil
    var subtitleFont: Font = .body
    var spacing: CGFloat = 12
    var alignment: OnbTextAlignment = .center

    var body: some View {
        VStack(spacing: spacing) {
            if let title = title {
                Text(title)
                    .font(titleFont)
                    .fontWeight(.bold)
                    .multilineTextAlignment(alignment.textAlignment)
                    .frame(maxWidth: .infinity, alignment: alignment.frameAlignment)
            }

            if let subtitle = subtitle {
                Text(subtitle)
                    .font(subtitleFont)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(alignment.textAlignment)
                    .frame(maxWidth: .infinity, alignment: alignment.frameAlignment)
            }
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 40) {
            // Both title and subtitle - center aligned
            OnbTitleContent(
                title: "Welcome to Our App",
                subtitle: "Experience something amazing"
            )

            // Leading aligned
            OnbTitleContent(
                title: "Leading Alignment",
                subtitle: "This text is aligned to the left",
                alignment: .leading
            )

            // Trailing aligned
            OnbTitleContent(
                title: "Trailing Alignment",
                subtitle: "This text is aligned to the right",
                alignment: .trailing
            )

            // Custom fonts with leading alignment
            OnbTitleContent(
                title: "Custom Fonts Leading",
                titleFont: .title,
                subtitle: "With different styling aligned left",
                subtitleFont: .callout,
                alignment: .leading
            )

            // Custom spacing with trailing alignment
            OnbTitleContent(
                title: "Custom Spacing Trailing",
                subtitle: "More space between title and subtitle",
                spacing: 24,
                alignment: .trailing
            )

            // Small fonts center aligned
            OnbTitleContent(
                title: "Small Title Centered",
                titleFont: .title2,
                subtitle: "Small subtitle text in the center",
                subtitleFont: .caption,
                alignment: .center
            )

            // Title only - leading
            OnbTitleContent(
                title: "Get Started",
                alignment: .leading
            )

            // Subtitle only - trailing
            OnbTitleContent(
                subtitle: "It's quick and easy",
                alignment: .trailing
            )
        }
        .padding()
    }
}
