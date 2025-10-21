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

    private var shouldShowBackButton: Bool {
        guard viewModel.currentIndex >= 0 && viewModel.currentIndex < viewModel.slides.count else {
            return false
        }

        // Check for slide-specific override first
        if let override = viewModel.slides[viewModel.currentIndex].showBackButtonOverride {
            return override
        }

        // Use configuration behavior
        switch viewModel.configuration.showBackButton {
        case .always:
            return true
        case .afterFirstSlide:
            return viewModel.currentIndex > 0
        case .never:
            return false
        }
    }

    private var currentBackButtonColor: Color {
        guard viewModel.currentIndex >= 0 && viewModel.currentIndex < viewModel.slides.count else {
            return viewModel.configuration.backButtonColor
        }
        if let override = viewModel.slides[viewModel.currentIndex].backButtonColorOverride {
            return override
        }
        return viewModel.configuration.backButtonColor
    }

    private var screenWidth: CGFloat {
        #if os(iOS)
        return UIScreen.main.bounds.width
        #else
        return NSScreen.main?.frame.width ?? 800
        #endif
    }

    private func slideOpacity(for index: Int) -> Double {
        switch viewModel.configuration.transitionStyle {
        case .none:
            return index == viewModel.currentIndex ? 1 : 0
        case .slide:
            return 1
        case .opacity, .fade:
            return index == viewModel.currentIndex ? 1 : 0
        }
    }

    private func slideOffset(for index: Int) -> CGFloat {
        switch viewModel.configuration.transitionStyle {
        case .none, .opacity:
            return 0
        case .slide:
            if index == viewModel.currentIndex {
                return 0
            } else if index < viewModel.currentIndex {
                return -screenWidth
            } else {
                return screenWidth
            }
        case .fade:
            if index == viewModel.currentIndex {
                return 0
            } else if index < viewModel.currentIndex {
                return -24
            } else {
                return 24
            }
        }
    }

    private var shouldAnimateTransition: Bool {
        switch viewModel.configuration.transitionStyle {
        case .none:
            return false
        case .opacity, .slide, .fade:
            return true
        }
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
                    showBackButton: shouldShowBackButton,
                    isFirstSlide: viewModel.currentIndex == 0,
                    backButtonColor: currentBackButtonColor,
                    onBackButtonPressed: {
                        viewModel.previousSlide()
                    }
                )

                // Content area - ZStack with previous, current, and next slides
                ZStack {
                    ForEach(Array(viewModel.slides.enumerated()), id: \.element.id) { index, slide in
                        let isPreviousSlide = index == viewModel.currentIndex - 1
                        let isCurrentSlide = index == viewModel.currentIndex
                        let isNextSlide = index == viewModel.currentIndex + 1

                        if isPreviousSlide || isCurrentSlide || isNextSlide {
                            AnyOnboardingSlideView(
                                slideType: slide,
                                onButtonClick: { selections in
                                    viewModel.nextSlide(selections: selections)
                                }
                            )
                            .offset(x: slideOffset(for: index))
                            .opacity(slideOpacity(for: index))
                            .animation(shouldAnimateTransition ? .easeInOut(duration: 0.2) : nil, value: viewModel.currentIndex)
                        }
                    }
                }
            }

            // Response view layer
            if let config = viewModel.responseConfiguration {
                AnyResponseViewContainer(
                    config: config,
                    isShowing: viewModel.showResponseView,
                    onButtonClick: {
                        viewModel.nextSlide(selections: [])
                    }
                )
            }
        }
    }
}

#Preview {
    SwiftfulOnboardingView(
        configuration: OnbConfiguration(
            headerStyle: .progressBar,
            headerAlignment: .center,
            showBackButton: .afterFirstSlide,
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
