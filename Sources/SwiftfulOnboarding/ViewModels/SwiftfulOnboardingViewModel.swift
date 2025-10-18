//
//  SwiftfulOnboardingViewModel.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

@MainActor
class SwiftfulOnboardingViewModel: ObservableObject {

    @Published var slides: [String] = ["Slide 1", "Slide 2", "Slide 3", "Slide 4", "Slide 5"]
    @Published var currentIndex: Int = 0

    func nextSlide() {
        if currentIndex < slides.count - 1 {
            currentIndex += 1
        }
    }

}