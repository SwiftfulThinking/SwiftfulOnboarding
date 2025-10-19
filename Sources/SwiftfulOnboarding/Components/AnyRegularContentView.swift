//
//  AnyRegularContentView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

struct AnyRegularContentView: View {

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

    var body: some View {
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
    }
}

#Preview {
    AnyRegularContentView(
        title: "Welcome",
        subtitle: "Get started with our app",
        media: .systemIcon(named: "star.fill", size: .large),
        mediaPosition: .top
    )
}
