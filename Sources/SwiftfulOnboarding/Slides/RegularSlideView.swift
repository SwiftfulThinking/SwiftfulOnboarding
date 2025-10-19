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
    case auto
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
        case .auto:
            return (nil, nil)
        case .small:
            return isIPad ? (120, 120) : (64, 64)
        case .medium:
            return isIPad ? (300, 300) : (180, 180)
        case .large:
            return isIPad ? (450, 450) : (300, 300)
        }
    }

    var frameSecondary: (width: CGFloat?, height: CGFloat?) {
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
        case .auto:
            return (nil, nil)
        case .small:
            return isIPad ? (48, 48) : (24, 24)
        case .medium:
            return isIPad ? (96, 96) : (48, 48)
        case .large:
            return isIPad ? (180, 180) : (96, 96)
        }
    }
}

enum OnbMediaPosition {
    case top
    case bottom
}

enum OnbContentAlignment {
    case top
    case center
    case bottom

    var alignment: Alignment {
        switch self {
        case .top:
            return .top
        case .center:
            return .center
        case .bottom:
            return .bottom
        }
    }
}

struct OnbFooterData {
    var leading: CGFloat
    var trailing: CGFloat
    var bottom: CGFloat
    var top: CGFloat
    var cornerRadius: CGFloat

    static let `default` = OnbFooterData(
        leading: 24,
        trailing: 24,
        bottom: 24,
        top: 24,
        cornerRadius: 12
    )
}

struct OnbButtonFormatData {
    var pressStyle: OnbButtonPressStyle
    var font: Font
    var height: CGFloat
    var cornerRadius: CGFloat

    static let `default` = OnbButtonFormatData(
        pressStyle: .press,
        font: .headline,
        height: 56,
        cornerRadius: 12
    )
}

struct RegularSlideView: View {

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
    var onButtonClick: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 0) {
            // Content
            VStack(spacing: contentSpacing) {
                // Media at top
                if let media = media, mediaPosition == .top {
                    let frameSize = media.size.frame
                    AnyMediaView(media: media)
                        .frame(width: frameSize.width, height: frameSize.height)
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
                .padding(.horizontal, horizontalPaddingTitle)

                // Media at bottom
                if let media = media, mediaPosition == .bottom {
                    let frameSize = media.size.frame
                    AnyMediaView(media: media)
                        .frame(width: frameSize.width, height: frameSize.height)
                        .padding(.horizontal, horizontalPaddingContent)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: contentAlignment.alignment)
            .padding(.top, paddingTop)
            .padding(.bottom, paddingBottom)


            // Continue button at bottom
            Text(ctaText)
                .onbButtonStyle(
                    style: ctaButtonStyle,
                    format: ctaButtonFormatData
                ) {
                    onButtonClick?()
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
            showBackButton: true,
            slides: [
                .regular(
                    id: "slide8",
                    title: "All Done!",
                    subtitle: "You're ready to go",
                    media: .image(urlString: "https://picsum.photos/600/600", size: .auto),
                    mediaPosition: .top
                ),
                .regular(
                    id: "slide1",
                    title: "Content Aligned Top",
                    subtitle: "This content is aligned to the top",
                    media: .systemIcon(named: "arrow.up.circle.fill", size: .small),
                    mediaPosition: .top,
                    contentAlignment: .top
                ),
                .regular(
                    id: "slide2",
                    title: "Content Aligned Center",
                    subtitle: "This content is centered vertically",
                    media: .systemIcon(named: "circle.fill", size: .medium),
                    mediaPosition: .top,
                    contentAlignment: .center
                ),
                .regular(
                    id: "slide3",
                    title: "Content Aligned Bottom",
                    subtitle: "This content is aligned to the bottom",
                    media: .systemIcon(named: "arrow.down.circle.fill", size: .large),
                    mediaPosition: .top,
                    contentAlignment: .bottom
                ),
                .regular(
                    id: "slide4",
                    title: "Media at Bottom",
                    subtitle: "With content centered",
                    media: .systemIcon(named: "star.fill", size: .medium),
                    mediaPosition: .bottom,
                    contentAlignment: .center
                ),
                .regular(
                    id: "slide5",
                    title: "Get Started",
                    subtitle: "It's quick and easy",
                    media: .systemIcon(named: "play.circle.fill", size: .medium),
                    mediaPosition: .bottom
                ),
                .regular(
                    id: "slide6",
                    title: "Simple Setup",
                    subtitle: "Just a few taps",
                    media: .systemIcon(named: "gear", size: .large),
                    mediaPosition: .top
                ),
                .regular(
                    id: "slide7",
                    title: "Privacy Policy",
                    subtitle: "Your data is safe with us",
                    media: .systemIcon(named: "lock.fill", size: .fixed(width: 150, height: 150)),
                    mediaPosition: .bottom
                )
            ]
        )
    )
}
