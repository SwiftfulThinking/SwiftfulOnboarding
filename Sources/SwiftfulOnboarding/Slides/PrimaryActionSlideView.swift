//
//  PrimaryActionSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

struct PrimaryActionSlideView: View {

    var title: String? = nil
    var titleFont: Font = .largeTitle
    var subtitle: String? = nil
    var subtitleFont: Font = .body
    var titleSubtitleSpacing: CGFloat = 8
    var titleAlignment: OnbTextAlignment = .center
    var media: OnbMediaType? = nil
    var mediaPosition: OnbMediaPosition = .top
    var contentAlignment: OnbContentAlignment = .center
    var paddingTop: CGFloat = 40
    var paddingBottom: CGFloat = 0
    var horizontalPaddingContent: CGFloat = 0
    var horizontalPaddingTitle: CGFloat = 40
    var contentSpacing: CGFloat = 24
    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var ctaButtonFormatData: OnbButtonFormatData = .default
    var secondaryButtonText: String? = nil
    var secondaryButtonStyle: OnbButtonStyleType = .outline(textColor: .blue, borderColor: .blue)
    var secondaryButtonFormatData: OnbButtonFormatData = .default
    var secondaryButtonSpacing: CGFloat = 12
    var onDidPressPrimaryButton: ((@escaping () -> Void) -> Void)? = nil
    var onButtonClick: (() -> Void)? = nil
    var onSecondaryButtonClick: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 0) {
            // Content
            AnyRegularContentView(
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
                contentSpacing: contentSpacing
            )

            // Buttons at bottom
            VStack(spacing: secondaryButtonSpacing) {
                Text(ctaText)
                    .onbButtonStyle(
                        style: ctaButtonStyle,
                        format: ctaButtonFormatData
                    ) {
                        if let onDidPressPrimaryButton = onDidPressPrimaryButton {
                            onDidPressPrimaryButton {
                                onButtonClick?()
                            }
                        } else {
                            onButtonClick?()
                        }
                    }

                if let secondaryButtonText = secondaryButtonText {
                    Text(secondaryButtonText)
                        .onbButtonStyle(
                            style: secondaryButtonStyle,
                            format: secondaryButtonFormatData
                        ) {
                            onSecondaryButtonClick?()
                        }
                }
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
            showBackButton: .afterFirstSlide,
            slides: [
                .primaryAction(
                    id: "slide1",
                    title: "Welcome!",
                    subtitle: "Get started with our amazing app",
                    media: .systemIcon(named: "star.fill", size: .large),
                    mediaPosition: .top,
                    secondaryButtonText: "Skip for now",
                    onDidPressPrimaryButton: { onDidCompleteAction in
                        // Perform custom action (e.g., analytics, validation, etc.)
                        print("Primary button pressed on slide 1")
                        // Call completion to trigger normal onButtonClick behavior
                        onDidCompleteAction()
                    }
                ),
                .primaryAction(
                    id: "slide2",
                    title: "Ready to Begin?",
                    subtitle: "Let's set up your account",
                    media: .systemIcon(named: "checkmark.circle.fill", size: .large),
                    mediaPosition: .top,
                    secondaryButtonText: "Maybe later",
                    onDidPressPrimaryButton: { onDidCompleteAction in
                        // Can perform async operations before completing
                        print("Primary button pressed on slide 2")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            onDidCompleteAction()
                        }
                    }
                ),
                .primaryAction(
                    id: "slide3",
                    title: "All Set!",
                    subtitle: "You're ready to go",
                    media: .systemIcon(named: "hand.thumbsup.fill", size: .large),
                    mediaPosition: .top
                )
            ]
        )
    )
}
