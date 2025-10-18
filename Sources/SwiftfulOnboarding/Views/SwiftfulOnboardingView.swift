//
//  SwiftfulOnboardingView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

struct SwiftfulOnboardingView: View {

    @StateObject private var viewModel = SwiftfulOnboardingViewModel()

    var body: some View {
        ZStack {
            // Main content
            VStack(spacing: 0) {
                // Header
                OnboardingHeaderView(
                    style: .progressBar,
                    alignment: .center,
                    currentPage: 3,
                    totalPages: 10,
                    showBackButton: true
                )

                // Content area - ZStack with previous, current, and next slides
                ZStack {
                    ForEach(Array(viewModel.slides.enumerated()), id: \.offset) { index, slide in
                        // Only render previous, current, and next slides
                        if abs(index - viewModel.currentIndex) <= 1 {
                            AnyOnboardingSlideView(
                                slideType: .regular(
                                    title: slide,
                                    subtitle: "Page \(index + 1) of \(viewModel.slides.count)",
                                    image: "sparkles"
                                ),
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
    SwiftfulOnboardingView()
}