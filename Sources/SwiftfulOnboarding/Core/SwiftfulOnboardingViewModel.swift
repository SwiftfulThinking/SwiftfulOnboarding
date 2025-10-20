//
//  SwiftfulOnboardingViewModel.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

@MainActor
class SwiftfulOnboardingViewModel: ObservableObject {

    let configuration: OnbConfiguration
    @Published var currentIndex: Int = 0
    @Published var slides: [OnbSlideType] = []

    init(configuration: OnbConfiguration) {
        self.configuration = configuration
        self.slides = configuration.slides
    }

    func nextSlide() {
        if currentIndex < slides.count - 1 {
            currentIndex += 1
        }
    }

    func previousSlide() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }

}