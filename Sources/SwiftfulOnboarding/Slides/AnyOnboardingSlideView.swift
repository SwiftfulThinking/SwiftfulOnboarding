//
//  AnyOnboardingSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

struct AnyOnboardingSlideView: View {

    let slideType: OnbSlideType
    var onButtonClick: (() -> Void)? = nil

    var body: some View {
        switch slideType {
        case .regular(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let media, let mediaSize, let mediaPosition, let ctaText, let ctaButtonStyle):
            RegularSlideView(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing,
                titleAlignment: titleAlignment,
                media: media,
                mediaSize: mediaSize,
                mediaPosition: mediaPosition,
                ctaText: ctaText,
                ctaButtonStyle: ctaButtonStyle,
                onButtonClick: onButtonClick
            )
        }
    }
}

#Preview {
    VStack(spacing: 24) {
        AnyOnboardingSlideView(
            slideType: .regular(
                id: "welcome",
                title: "Welcome",
                subtitle: "Get started with our app",
                media: .systemIcon(named: "star.fill")
            )
        )

        AnyOnboardingSlideView(
            slideType: .regular(
                id: "features",
                title: "Features",
                subtitle: nil,
                media: nil
            )
        )

        AnyOnboardingSlideView(
            slideType: .regular(
                id: "video-demo",
                title: "Video Demo",
                subtitle: "Watch our intro",
                media: .video(urlString: "https://example.com/intro.mp4")
            )
        )
    }
}