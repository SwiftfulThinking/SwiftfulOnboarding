//
//  VideoLoaderView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI
import AVKit

struct VideoLoaderView: View {

    let urlString: String
    var useSwiftUIVideoPlayer: Bool = true
    var cornerRadius: CGFloat = 0
    @State private var player: AVPlayer?

    var body: some View {
        Group {
            if let player = player {
                if useSwiftUIVideoPlayer {
                    VideoPlayer(player: player)
                        .cornerRadius(cornerRadius)
                } else {
                    SimpleVideoPlayerView(player: player)
                        .cornerRadius(cornerRadius)
                }
            } else if URL(string: urlString) != nil {
                ProgressView("Loading video...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(cornerRadius)
            } else {
                Text("Invalid video URL")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(cornerRadius)
            }
        }
        .onAppear {
            if let url = URL(string: urlString) {
                player = AVPlayer(url: url)
                player?.play()
            }
        }
    }
}

// Custom video player without controls
struct SimpleVideoPlayerView: UIViewRepresentable {
    let player: AVPlayer

    func makeUIView(context: Context) -> UIView {
        let view = PlayerView()
        view.playerLayer.player = player
        view.playerLayer.videoGravity = .resizeAspectFill

        // Loop the video
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { _ in
            Task { @MainActor in
                player.seek(to: CMTime.zero)
                player.play()
            }
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // No updates needed
    }

    class PlayerView: UIView {
        override class var layerClass: AnyClass {
            AVPlayerLayer.self
        }

        var playerLayer: AVPlayerLayer {
            layer as! AVPlayerLayer
        }
    }
}

#Preview("With Controls") {
    VideoLoaderView(
        urlString: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8",
        useSwiftUIVideoPlayer: true
    )
    .frame(height: 200)
    .padding()
}

#Preview("Without Controls") {
    VideoLoaderView(
        urlString: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8",
        useSwiftUIVideoPlayer: false
    )
    .frame(height: 200)
    .padding()
}
