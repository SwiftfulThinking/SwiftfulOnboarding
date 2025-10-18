//
//  RegularSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

struct RegularSlideView: View {

    var title: String? = nil
    var subtitle: String? = nil
    var image: String? = nil
    var onButtonClick: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 0) {
            // Content
            VStack(spacing: 24) {
                // Image
                if let image = image {
                    Image(systemName: image)
                        .font(.system(size: 64))
                        .foregroundColor(.blue)
                        .padding(.top, 40)
                }

                // Text content
                VStack(spacing: 12) {
                    if let title = title {
                        Text(title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }

                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                    }
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Continue button at bottom
            Button(action: {
                onButtonClick?()
            }) {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 32)
        }
    }
}

#Preview {
    VStack(spacing: 32) {
        RegularSlideView(
            title: "Welcome to Our App",
            subtitle: "Discover amazing features that will help you be more productive",
            image: "star.fill"
        )
        .frame(height: 400)
        .background(Color.gray.opacity(0.1))

        RegularSlideView(
            title: "Get Started",
            subtitle: nil,
            image: "rocket.fill"
        )
        .frame(height: 400)
        .background(Color.gray.opacity(0.1))

        RegularSlideView(
            title: "Simple Setup",
            subtitle: "Just a few steps to get you going",
            image: nil
        )
        .frame(height: 400)
        .background(Color.gray.opacity(0.1))
    }
}