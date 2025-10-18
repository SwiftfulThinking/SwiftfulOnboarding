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

                // Content area placeholder
                Text("SwiftfulOnboardingView")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

#Preview {
    SwiftfulOnboardingView()
}