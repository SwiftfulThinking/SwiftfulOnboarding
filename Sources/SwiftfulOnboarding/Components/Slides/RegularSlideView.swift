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
    var media: OnbMediaType? = nil
    var onButtonClick: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 0) {
            // Content
            VStack(spacing: 24) {
                // Media
                if let media = media {
                    AnyMediaView(media: media)
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
    SwiftfulOnboardingView(
        configuration: OnbConfiguration(
            headerStyle: .progressBar,
            headerAlignment: .center,
            showBackButton: true,
            slides: [
                .regular(
                    id: "slide1",
                    title: "Welcome to Our App",
                    subtitle: "Experience something amazing",
                    media: .systemIcon(named: "hand.wave.fill")
                ),
                .regular(
                    id: "slide2",
                    title: "Get Started",
                    subtitle: "It's quick and easy",
                    media: .systemIcon(named: "play.circle.fill")
                ),
                .regular(
                    id: "slide3",
                    title: "Simple Setup",
                    subtitle: "Just a few taps",
                    media: .systemIcon(named: "gear")
                ),
                .regular(
                    id: "slide4",
                    title: "Privacy Policy",
                    subtitle: "Your data is safe with us",
                    media: .systemIcon(named: "lock.fill")
                ),
                .regular(
                    id: "slide5",
                    title: "All Done!",
                    subtitle: "You're ready to go",
                    media: .systemIcon(named: "checkmark.seal.fill")
                )
            ]
        )
    )
}