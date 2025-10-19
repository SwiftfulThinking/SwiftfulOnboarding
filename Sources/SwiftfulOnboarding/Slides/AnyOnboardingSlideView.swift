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
        case .regular(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let media, let mediaPosition, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData):
            RegularSlideView(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing,
                titleAlignment: titleAlignment,
                media: media,
                mediaPosition: mediaPosition,
                contentAlignment: contentAlignment,
                paddingTop: paddingTop,
                paddingBottom: paddingBottom,
                horizontalPaddingContent: horizontalPaddingContent,
                horizontalPaddingTitle: horizontalPaddingTitle,
                contentSpacing: contentSpacing,
                footerData: footerData,
                ctaText: ctaText,
                ctaButtonStyle: ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData,
                onButtonClick: onButtonClick
            )
        case .multipleChoice(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let options, let optionsSpacing, let optionsButtonStyle, let optionsButtonFormatData, let selectionBehavior, let isGrid, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData):
            MultipleChoiceSlideView(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing,
                titleAlignment: titleAlignment,
                options: options,
                optionsSpacing: optionsSpacing,
                optionsButtonStyle: optionsButtonStyle,
                optionsButtonFormatData: optionsButtonFormatData,
                selectionBehavior: selectionBehavior,
                isGrid: isGrid,
                contentAlignment: contentAlignment,
                paddingTop: paddingTop,
                paddingBottom: paddingBottom,
                horizontalPaddingContent: horizontalPaddingContent,
                horizontalPaddingTitle: horizontalPaddingTitle,
                contentSpacing: contentSpacing,
                footerData: footerData,
                ctaText: ctaText,
                ctaButtonStyle: ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData,
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