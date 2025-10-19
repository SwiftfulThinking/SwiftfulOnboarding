//
//  LottieLoaderView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI
import Lottie

struct LottieLoaderView: View {

    let urlString: String
    var loopMode: LottieLoopMode = .loop
    var contentMode: UIView.ContentMode = .scaleAspectFit

    var body: some View {
        if let url = URL(string: urlString) {
            LottieView({
                await LottieAnimation.loadedFrom(url: url)
            })
                .playing(loopMode: loopMode)
                .cornerRadius(12)
        } else {
            Text("Invalid Lottie URL")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
        }
    }
}

#Preview {
    VStack(spacing: 24) {
        // Sample Lottie animation from LottieFiles
        LottieLoaderView(
            urlString: "https://assets8.lottiefiles.com/packages/lf20_q0cz4zhn.json"
        )
        .frame(width: 200, height: 200)
    }
    .padding()
}
