//
//  ImageLoaderView.swift
//  SwiftfulOnboarding
//
//  Created by Nick Sarno on 10/18/25.
//
import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {

    var urlString: String = "https://picsum.photos/600/600"
    var resizingMode: ContentMode = .fill
    var forceTransitionAnimation: Bool = false
    var placeholderOpacity: Double = 0.5

    var body: some View {
        Rectangle()
            .opacity(placeholderOpacity)
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            )
            .clipped()
            .ifSatisfiesCondition(forceTransitionAnimation) { content in
                content
                    .drawingGroup()
            }
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 200, height: 200)
}
