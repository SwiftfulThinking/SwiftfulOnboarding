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
        Text("SwiftfulOnboardingView")
    }
}

#Preview {
    SwiftfulOnboardingView()
}