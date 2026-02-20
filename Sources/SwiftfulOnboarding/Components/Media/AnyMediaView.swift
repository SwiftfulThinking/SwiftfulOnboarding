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
    var isSelected: Bool = false

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

        case .image(let urlString, _, _, let cornerRadius, let borderColor, let borderWidth, let selectedBorderColor, let selectedBorderWidth):
            let currentBorderColor = isSelected ? (selectedBorderColor ?? borderColor) : borderColor
            let currentBorderWidth = isSelected ? (selectedBorderWidth ?? borderWidth) : borderWidth

            ImageLoaderView(urlString: urlString, aspectRatioValue: nil)
                .ifSatisfiesCondition(aspectRatioValue != nil, transform: { content in
                    content
                        .aspectRatio(aspectRatioValue, contentMode: .fit)
                })
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(currentBorderColor ?? .clear, lineWidth: currentBorderWidth)
                )
                .animation(.easeInOut(duration: 0.2), value: isSelected)

        case .bundleImage(let named, _, _, let cornerRadius, let borderColor, let borderWidth, let selectedBorderColor, let selectedBorderWidth):
            let currentBorderColor = isSelected ? (selectedBorderColor ?? borderColor) : borderColor
            let currentBorderWidth = isSelected ? (selectedBorderWidth ?? borderWidth) : borderWidth

            Rectangle()
                .opacity(0)
                .overlay(
                    Image(named)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .allowsHitTesting(false)
                )
                .clipped()
                .ifSatisfiesCondition(aspectRatioValue != nil, transform: { content in
                    content
                        .aspectRatio(aspectRatioValue, contentMode: .fit)
                })
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(currentBorderColor ?? .clear, lineWidth: currentBorderWidth)
                )
                .animation(.easeInOut(duration: 0.2), value: isSelected)

        case .video(let urlString, _, _, let useSwiftUIVideoPlayer, let loop, let cornerRadius, let borderColor, let borderWidth, let selectedBorderColor, let selectedBorderWidth):
            let currentBorderColor = isSelected ? (selectedBorderColor ?? borderColor) : borderColor
            let currentBorderWidth = isSelected ? (selectedBorderWidth ?? borderWidth) : borderWidth

            VideoLoaderView(
                urlString: urlString,
                useSwiftUIVideoPlayer: useSwiftUIVideoPlayer,
                loop: loop
            )
                .ifSatisfiesCondition(aspectRatioValue != nil, transform: { content in
                    content
                        .aspectRatio(aspectRatioValue, contentMode: .fit)
                })
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(currentBorderColor ?? .clear, lineWidth: currentBorderWidth)
                )
                .animation(.easeInOut(duration: 0.2), value: isSelected)

        case .lottie(let urlString, _, _, let loopMode, let cornerRadius, let borderColor, let borderWidth, let selectedBorderColor, let selectedBorderWidth):
            let currentBorderColor = isSelected ? (selectedBorderColor ?? borderColor) : borderColor
            let currentBorderWidth = isSelected ? (selectedBorderWidth ?? borderWidth) : borderWidth

            LottieLoaderView(
                urlString: urlString,
                loopMode: loopMode,
                cornerRadius: cornerRadius
            )
            .ifSatisfiesCondition(aspectRatioValue != nil, transform: { content in
                content
                    .aspectRatio(aspectRatioValue, contentMode: .fit)
            })
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(currentBorderColor ?? .clear, lineWidth: currentBorderWidth)
            )
            .animation(.easeInOut(duration: 0.2), value: isSelected)
        }
    }
}

#Preview {
    struct PreviewContent: View {
        @State private var isSelected: Bool = false

        var body: some View {
            ScrollView {
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

                    // Image with border and selected state
                    Button {
                        isSelected.toggle()
                    } label: {
                        AnyMediaView(
                            media: .image(
                                urlString: "https://picsum.photos/600/600",
                                cornerRadius: 12,
                                borderColor: .blue,
                                borderWidth: 2,
                                selectedBorderColor: .green,
                                selectedBorderWidth: 4
                            ),
                            isSelected: isSelected
                        )
                        .frame(height: 200)
                    }

                    // Image with border only when selected
                    Button {
                        isSelected.toggle()
                    } label: {
                        AnyMediaView(
                            media: .image(
                                urlString: "https://picsum.photos/400/400",
                                cornerRadius: 16,
                                borderColor: nil,
                                borderWidth: 0,
                                selectedBorderColor: .orange,
                                selectedBorderWidth: 3
                            ),
                            isSelected: isSelected
                        )
                        .frame(height: 200)
                    }

                    // Video with border
                    AnyMediaView(
                        media: .video(
                            urlString: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8",
                            aspectRatio: .auto,
                            cornerRadius: 16,
                            borderColor: .purple,
                            borderWidth: 3,
                            selectedBorderColor: .pink,
                            selectedBorderWidth: 5
                        ),
                        isSelected: isSelected
                    )
                    .frame(height: 200)

                    Text(isSelected ? "Selected" : "Not Selected")
                        .font(.headline)
                        .foregroundColor(isSelected ? .green : .gray)
                }
                .padding()
            }
        }
    }

    return PreviewContent()
}
