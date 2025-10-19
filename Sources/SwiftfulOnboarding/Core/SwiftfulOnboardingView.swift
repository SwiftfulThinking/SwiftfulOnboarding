//
//  SwiftfulOnboardingView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

struct SwiftfulOnboardingView: View {

    @StateObject private var viewModel: SwiftfulOnboardingViewModel

    init(configuration: OnbConfiguration = OnbConfiguration()) {
        _viewModel = StateObject(wrappedValue: SwiftfulOnboardingViewModel(configuration: configuration))
    }

    private var currentBackgroundColor: Color {
        guard viewModel.currentIndex >= 0 && viewModel.currentIndex < viewModel.slides.count else {
            return viewModel.configuration.backgroundColor
        }
        if let override = viewModel.slides[viewModel.currentIndex].backgroundColorOverride {
            return override
        }
        return viewModel.configuration.backgroundColor
    }

    var body: some View {
        ZStack {
            // Background color
            currentBackgroundColor
                .ignoresSafeArea()
                .animation(.easeInOut, value: viewModel.currentIndex)

            // Main content
            VStack(spacing: 0) {
                // Header
                OnboardingHeaderView(
                    style: viewModel.configuration.headerStyle,
                    alignment: viewModel.configuration.headerAlignment,
                    currentPage: viewModel.currentIndex + 1,
                    totalPages: viewModel.slides.count,
                    showBackButton: viewModel.configuration.showBackButton && viewModel.currentIndex > 0
                )

                // Content area - ZStack with previous, current, and next slides
                ZStack {
                    ForEach(Array(viewModel.slides.enumerated()), id: \.element.id) { index, slide in
                        // Only render previous, current, and next slides
                        if abs(index - viewModel.currentIndex) <= 1 {
                            AnyOnboardingSlideView(
                                slideType: slide,
                                onButtonClick: {
                                    viewModel.nextSlide()
                                }
                            )
                            .opacity(index == viewModel.currentIndex ? 1 : 0)
                        }
                    }
                }
            }
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
                    id: "welcome",
                    title: "Welcome",
                    subtitle: "Get started with our amazing app",
                    media: .systemIcon(named: "star.fill")
                ),
                .regular(
                    id: "features",
                    title: "Key Features",
                    subtitle: "Discover what you can do",
                    media: .systemIcon(named: "sparkles")
                ),
                .regular(
                    id: "get-started",
                    title: "Get Started",
                    subtitle: "Just a few steps to begin",
                    media: .systemIcon(named: "arrow.right.circle.fill")
                ),
                .regular(
                    id: "privacy",
                    title: "Your Privacy Matters",
                    subtitle: "We keep your data safe",
                    media: .systemIcon(named: "lock.shield.fill")
                ),
                .regular(
                    id: "ready",
                    title: "Ready to Go!",
                    subtitle: "Let's dive in",
                    media: .systemIcon(named: "checkmark.circle.fill")
                )
            ]
        )
    )
}
