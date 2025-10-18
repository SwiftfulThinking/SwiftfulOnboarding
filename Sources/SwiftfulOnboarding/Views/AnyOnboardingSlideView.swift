//
//  AnyOnboardingSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

struct AnyOnboardingSlideView: View {

    let slideType: OnboardingSlideType
    var onButtonClick: (() -> Void)? = nil

    var body: some View {
        switch slideType {
        case .regular(let title, let subtitle, let image):
            RegularSlideView(
                title: title,
                subtitle: subtitle,
                image: image,
                onButtonClick: onButtonClick
            )
        }
    }
}

#Preview {
    VStack(spacing: 24) {
        AnyOnboardingSlideView(
            slideType: .regular(
                title: "Welcome",
                subtitle: "Get started with our app",
                image: "star.fill"
            )
        )

        AnyOnboardingSlideView(
            slideType: .regular(
                title: "Features",
                subtitle: nil,
                image: nil
            )
        )
    }
}