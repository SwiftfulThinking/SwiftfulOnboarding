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
    @Published var showResponseView: Bool = false
    @Published var responseConfiguration: OnbResponseConfiguration? = nil
    @Published var savedSelections: [String: [OnbChoiceOption]] = [:]

    init(configuration: OnbConfiguration) {
        self.configuration = configuration
        self.slides = configuration.slides
    }

    func nextSlide(selections: [OnbChoiceOption]) {
        let currentSlide = slides[currentIndex]
        savedSelections[currentSlide.id] = selections
        
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
