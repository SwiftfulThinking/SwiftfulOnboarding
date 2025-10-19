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

    var body: some View {
        switch media {
        case .systemIcon(let named):
            Image(systemName: named)
                .font(.system(size: 64))
                .foregroundColor(.blue)

        case .image(let urlString):
            ImageLoaderView(urlString: urlString)
                .frame(width: 120, height: 120)

        case .video(let urlString):
            VideoLoaderView(
                urlString: urlString,
                useSwiftUIVideoPlayer: false
            )
            .frame(width: 200, height: 120)

        case .lottie(let urlString):
            LottieLoaderView(
                urlString: urlString,
                loopMode: .loop
            )
            .frame(width: 120, height: 120)
        }
    }
}

#Preview {
    VStack(spacing: 24) {
        AnyMediaView(media: .systemIcon(named: "star.fill"))

        AnyMediaView(media: .systemIcon(named: "heart.circle.fill"))

        AnyMediaView(media: .image(urlString: "https://picsum.photos/600/600"))

        AnyMediaView(media: .video(urlString: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8"))

        AnyMediaView(media: .lottie(urlString: "https://lottie.host/94e07a1d-7159-4ed1-b7ba-6e0dc5f96ab2/xHR9ygBKCu.json"))
    }
    .padding()
}
