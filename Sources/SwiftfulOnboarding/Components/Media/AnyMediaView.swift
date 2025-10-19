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
    var cornerRadius: CGFloat = 0

    var body: some View {
        switch media {
        case .systemIcon(let named):
            Image(systemName: named)
                .resizable()
                .aspectRatio(contentMode: .fit)

        case .image(let urlString):
            ImageLoaderView(urlString: urlString)

        case .video(let urlString):
            VideoLoaderView(
                urlString: urlString,
                useSwiftUIVideoPlayer: false,
                cornerRadius: cornerRadius
            )

        case .lottie(let urlString):
            LottieLoaderView(
                urlString: urlString,
                loopMode: .loop,
                cornerRadius: cornerRadius
            )
        }
    }
}

#Preview {
    VStack(spacing: 24) {
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

        // Large size
        AnyMediaView(media: .image(urlString: "https://picsum.photos/600/600"))
            .frame(width: 120, height: 120)

        AnyMediaView(media: .video(urlString: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8"))
            .frame(width: 200, height: 120)

        AnyMediaView(media: .lottie(urlString: "https://lottie.host/94e07a1d-7159-4ed1-b7ba-6e0dc5f96ab2/xHR9ygBKCu.json"))
            .frame(width: 120, height: 120)
    }
    .padding()
}
