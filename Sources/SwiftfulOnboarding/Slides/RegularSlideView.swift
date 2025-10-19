//
//  RegularSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

@MainActor
enum OnbMediaSize {
    case fixed(width: CGFloat, height: CGFloat)
    case max
    case small
    case medium
    case large

    var frame: (width: CGFloat?, height: CGFloat?) {
        let isIPad: Bool = {
            #if os(iOS)
            return UIDevice.current.userInterfaceIdiom == .pad
            #else
            return false
            #endif
        }()

        switch self {
        case .fixed(let width, let height):
            return (width, height)
        case .max:
            return (nil, nil)
        case .small:
            return isIPad ? (120, 120) : (64, 64)
        case .medium:
            return isIPad ? (300, 300) : (180, 180)
        case .large:
            return isIPad ? (450, 450) : (300, 300)
        }
    }
}

enum OnbMediaPosition {
    case top
    case bottom
}

struct RegularSlideView: View {

    var title: String? = nil
    var titleFont: Font = .largeTitle
    var subtitle: String? = nil
    var subtitleFont: Font = .body
    var titleSubtitleSpacing: CGFloat = 12
    var titleAlignment: OnbTextAlignment = .center
    var media: OnbMediaType? = nil
    var mediaSize: OnbMediaSize = .large
    var mediaPosition: OnbMediaPosition = .top
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var onButtonClick: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 0) {
            // Content
            VStack(spacing: 24) {
                // Media at top
                if let media = media, mediaPosition == .top {
                    let frameSize = mediaSize.frame
                    AnyMediaView(media: media)
                        .frame(width: frameSize.width, height: frameSize.height)
                        .padding(.top, 40)
                }

                // Text content
                OnbTitleContent(
                    title: title,
                    titleFont: titleFont,
                    subtitle: subtitle,
                    subtitleFont: subtitleFont,
                    spacing: titleSubtitleSpacing,
                    alignment: titleAlignment
                )

                // Media at bottom
                if let media = media, mediaPosition == .bottom {
                    let frameSize = mediaSize.frame
                    AnyMediaView(media: media)
                        .frame(width: frameSize.width, height: frameSize.height)
                        .padding(.bottom, 40)
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Continue button at bottom
            Text(ctaText)
                .onbButtonStyle(
                    style: ctaButtonStyle
                ) {
                    onButtonClick?()
                }
                .padding(.bottom, 32)
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
                .regular(
                    id: "slidea",
                    title: "All Done!",
                    subtitle: "You're ready to go",
                    media: .image(urlString: "https://picsum.photos/600/600"),
                    mediaSize: .small,
                    mediaPosition: .top
                ),
                .regular(
                    id: "slideb",
                    title: "All Done!",
                    subtitle: "You're ready to go",
                    media: .image(urlString: "https://picsum.photos/600/600"),
                    mediaSize: .medium,
                    mediaPosition: .top
                ),
                .regular(
                    id: "slidec",
                    title: "All Done!",
                    subtitle: "You're ready to go",
                    media: .image(urlString: "https://picsum.photos/600/600"),
                    mediaSize: .large,
                    mediaPosition: .top
                ),
                .regular(
                    id: "slide1",
                    title: "Welcome to Our App",
                    subtitle: "Experience something amazing",
                    media: .systemIcon(named: "hand.wave.fill"),
                    mediaSize: .small,
                    mediaPosition: .top
                ),
                .regular(
                    id: "slide2",
                    title: "Get Started",
                    subtitle: "It's quick and easy",
                    media: .systemIcon(named: "play.circle.fill"),
                    mediaSize: .medium,
                    mediaPosition: .bottom
                ),
                .regular(
                    id: "slide3",
                    title: "Simple Setup",
                    subtitle: "Just a few taps",
                    media: .systemIcon(named: "gear"),
                    mediaSize: .large,
                    mediaPosition: .top
                ),
                .regular(
                    id: "slide4",
                    title: "Privacy Policy",
                    subtitle: "Your data is safe with us",
                    media: .systemIcon(named: "lock.fill"),
                    mediaSize: .fixed(width: 150, height: 150),
                    mediaPosition: .bottom
                ),
                .regular(
                    id: "slide5",
                    title: "All Done!",
                    subtitle: "You're ready to go",
                    media: .image(urlString: "https://picsum.photos/600/600"),
                    mediaSize: .max,
                    mediaPosition: .top
                )
            ]
        )
    )
}
