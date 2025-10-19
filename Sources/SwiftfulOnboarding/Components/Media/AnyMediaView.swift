//
//  AnyMediaView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct AnyMediaView: View {

    let media: OnbMediaType

    private var aspectRatioValue: CGFloat? {
        switch media.aspectRatio {
        case .auto:
            return nil
        case .square:
            return 1.0
        case .portrait:
            return 3.0 / 4.0
        case .landscape:
            return 16.0 / 9.0
        }
    }

    var body: some View {
        switch media {
        case .systemIcon(let named, _):
            Image(systemName: named)
                .resizable()
                .aspectRatio(contentMode: .fit)

        case .image(let urlString, _, _, let cornerRadius):
            ImageLoaderView(urlString: urlString)
                .ifSatisfiesCondition(aspectRatioValue != nil, transform: { content in
                    content
                        .aspectRatio(aspectRatioValue, contentMode: .fill)
                })
                .cornerRadius(cornerRadius)

        case .video(let urlString, _, _, let useSwiftUIVideoPlayer, let loop, let cornerRadius):
            VideoLoaderView(
                urlString: urlString,
                useSwiftUIVideoPlayer: useSwiftUIVideoPlayer,
                loop: loop
            )
                .ifSatisfiesCondition(aspectRatioValue != nil, transform: { content in
                    content
                        .aspectRatio(aspectRatioValue, contentMode: .fill)
                })
                .cornerRadius(cornerRadius)

        case .lottie(let urlString, _, _, let loopMode, let cornerRadius):
            LottieLoaderView(
                urlString: urlString,
                loopMode: loopMode,
                cornerRadius: cornerRadius
            )
            .ifSatisfiesCondition(aspectRatioValue != nil, transform: { content in
                content
                    .aspectRatio(aspectRatioValue, contentMode: .fill)
            })
        }
    }
}

#Preview {
    VStack(spacing: 40) {
        // Small size
        HStack(spacing: 16) {
            AnyMediaView(media: .systemIcon(named: "star.fill"))
                .frame(width: 24, height: 24)

            AnyMediaView(media: .systemIcon(named: "heart.circle.fill"))
                .frame(width: 24, height: 24)
        }

        // Medium size
        AnyMediaView(media: .systemIcon(named: "person.circle.fill"))
            .frame(width: 64, height: 64)

        // Large size with corner radius
        AnyMediaView(media: .image(urlString: "https://picsum.photos/600/600", cornerRadius: 12))
//            .frame(width: 120, height: 120)

        AnyMediaView(media: .video(urlString: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8", aspectRatio: .auto, cornerRadius: 16))
            .frame(height: 120)

//        AnyMediaView(media: .lottie(urlString: "https://lottie.host/94e07a1d-7159-4ed1-b7ba-6e0dc5f96ab2/xHR9ygBKCu.json", cornerRadius: 8))
//            .frame(width: 120, height: 120)
    }
    .padding()
}
