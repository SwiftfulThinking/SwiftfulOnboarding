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

    private var currentBackground: OnbBackgroundType {
        guard viewModel.currentIndex >= 0 && viewModel.currentIndex < viewModel.slides.count else {
            return viewModel.configuration.slideDefaults.background
        }
        if let override = viewModel.slides[viewModel.currentIndex].background {
            return override
        }
        return viewModel.configuration.slideDefaults.background
    }

    private var shouldShowBackButton: Bool {
        guard viewModel.currentIndex >= 0 && viewModel.currentIndex < viewModel.slides.count else {
            return false
        }

        // Check for slide-specific override first
        if let override = viewModel.slides[viewModel.currentIndex].showBackButton {
            return override
        }

        // Use configuration behavior
        switch viewModel.configuration.headerConfiguration.showBackButton {
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
            return viewModel.configuration.headerConfiguration.backButtonColor
        }
        if let override = viewModel.slides[viewModel.currentIndex].backButtonColor {
            return override
        }
        return viewModel.configuration.headerConfiguration.backButtonColor
    }

    private var screenWidth: CGFloat {
        #if os(iOS)
        return UIScreen.main.bounds.width
        #else
        return NSScreen.main?.frame.width ?? 800
        #endif
    }

    private func slideOpacity(for index: Int) -> Double {
        switch viewModel.configuration.slideDefaults.transitionStyle {
        case .none:
            return index == viewModel.currentIndex ? 1 : 0
        case .slide:
            return 1
        case .opacity, .fade:
            return index == viewModel.currentIndex ? 1 : 0
        }
    }

    private func slideOffset(for index: Int) -> CGFloat {
        switch viewModel.configuration.slideDefaults.transitionStyle {
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
        switch viewModel.configuration.slideDefaults.transitionStyle {
        case .none:
            return false
        case .opacity, .slide, .fade:
            return true
        }
    }

    @ViewBuilder
    private var backgroundView: some View {
        switch currentBackground {
        case .solidColor(let color):
            color
        case .gradient(let gradient, let startPoint, let endPoint):
            LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint)
        case .image(let urlString):
            AnyMediaView(
                media: .image(urlString: urlString),
                isSelected: false
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    var body: some View {
        ZStack {
            // Background
            backgroundView
                .ignoresSafeArea()
                .animation(.easeInOut, value: viewModel.currentIndex)

            // Main content
            VStack(spacing: 0) {
                // Header
                OnboardingHeaderView(
                    style: viewModel.configuration.headerConfiguration.headerStyle,
                    alignment: viewModel.configuration.headerConfiguration.headerAlignment,
                    currentPage: viewModel.currentIndex + 1,
                    totalPages: viewModel.slides.count,
                    showBackButton: shouldShowBackButton,
                    isFirstSlide: viewModel.currentIndex == 0,
                    backButtonColor: currentBackButtonColor,
                    progressBarAccentColor: viewModel.configuration.headerConfiguration.progressBarAccentColor,
                    onBackButtonPressed: {
                        viewModel.previousSlide()
                    }
                )

                // Content area - ZStack with previous, current, and next slides
                ZStack(alignment: .top) {
                    ForEach(Array(viewModel.slides.enumerated()), id: \.element.id) { index, slide in
                        let isPreviousSlide = index == viewModel.currentIndex - 1
                        let isCurrentSlide = index == viewModel.currentIndex
                        let isNextSlide = index == viewModel.currentIndex + 1

                        if isPreviousSlide || isCurrentSlide || isNextSlide {
                            AnyOnboardingSlideView(
                                slideType: slide,
                                slideDefaults: viewModel.configuration.slideDefaults,
                                selectedOptions: viewModel.getSelections(for: slide.id),
                                handleSelection: { option, behavior in
                                    viewModel.toggleSelection(for: option, selectionBehavior: behavior)
                                },
                                onButtonClick: { selections in
                                    viewModel.onSlideButtonClick(selections: selections)
                                }
                            )
                            .frame(maxWidth: .infinity)
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
                        viewModel.onResponseButtonClick()
                    }
                )
            }
        }
    }
}

#Preview("Default") {
    SwiftfulOnboardingView(
        configuration: OnbConfiguration(
            headerConfiguration: OnbHeaderConfiguration(
                headerStyle: .progressBar,
                headerAlignment: .center,
                showBackButton: .afterFirstSlide
            ),
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

#Preview("Gradient Background") {
    SwiftfulOnboardingView(
        configuration: OnbConfiguration(
            headerConfiguration: OnbHeaderConfiguration(
                headerStyle: .progressBar,
                headerAlignment: .center,
                showBackButton: .afterFirstSlide
            ),
            slides: [
                .regular(
                    id: "welcome",
                    title: "Welcome",
                    subtitle: "Get started with our amazing app",
                    media: .systemIcon(named: "star.fill"),
                    background: .gradient(
                        Gradient(colors: [.purple, .blue]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                ),
                .regular(
                    id: "features",
                    title: "Key Features",
                    subtitle: "Discover what you can do",
                    media: .systemIcon(named: "sparkles"),
                    background: .gradient(
                        Gradient(colors: [.blue, .cyan]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                ),
                .regular(
                    id: "get-started",
                    title: "Get Started",
                    subtitle: "Just a few steps to begin",
                    media: .systemIcon(named: "arrow.right.circle.fill"),
                    background: .gradient(
                        Gradient(colors: [.orange, .pink]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            ],
            slideDefaults: OnbSlideDefaults(
                background: .gradient(
                    Gradient(colors: [.purple, .pink]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        )
    )
}

#Preview("Image Background") {
    SwiftfulOnboardingView(
        configuration: OnbConfiguration(
            headerConfiguration: OnbHeaderConfiguration(
                headerStyle: .progressBar,
                headerAlignment: .center,
                showBackButton: .afterFirstSlide
            ),
            slides: [
                .regular(
                    id: "welcome",
                    title: "Welcome",
                    subtitle: "Get started with our amazing app",
                    media: .systemIcon(named: "star.fill"),
                    background: .image(
                        urlString: "https://picsum.photos/400/800"
                    )
                ),
                .regular(
                    id: "features",
                    title: "Key Features",
                    subtitle: "Discover what you can do",
                    media: .systemIcon(named: "sparkles"),
                    background: .image(
                        urlString: "https://picsum.photos/400/801"
                    )
                ),
                .regular(
                    id: "get-started",
                    title: "Get Started",
                    subtitle: "Just a few steps to begin",
                    media: .systemIcon(named: "arrow.right.circle.fill"),
                    background: .solidColor(.black.opacity(0.8))
                )
            ],
            slideDefaults: OnbSlideDefaults(
                background: .image(
                    urlString: "https://picsum.photos/400/802"
                )
            )
        )
    )
}
