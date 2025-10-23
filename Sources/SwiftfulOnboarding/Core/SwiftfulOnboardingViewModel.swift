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

    func onSlideButtonClick(selections: [OnbChoiceOption]) {
        let currentSlide = slides[currentIndex]
        savedSelections[currentSlide.id] = selections

        // Check if any selection has a responseConfiguration
        if let responseConfig = selections.first(where: { $0.responseConfiguration != nil })?.responseConfiguration {
            responseConfiguration = responseConfig
            showResponseView = true
        } else {
            nextSlide()
        }
    }

    func onResponseButtonClick() {
        showResponseView = false
        responseConfiguration = nil
        nextSlide()
    }

    private func nextSlide() {
        insertSlidesFromSelections()

        if currentIndex < slides.count - 1 {
            currentIndex += 1
        }
    }

    private func insertSlidesFromSelections() {
        let currentSlide = slides[currentIndex]
        guard let selections = savedSelections[currentSlide.id] else { return }

        // Process selections in reverse order
        for selection in selections.reversed() {
            guard let insertConfigs = selection.insertConfiguration else { continue }

            // Process insertConfiguration array in order
            for insertConfig in insertConfigs {
                insertSlide(insertConfig)
            }
        }
    }

    private func insertSlide(_ insertConfig: InsertSlideData) {
        let insertIndex: Int?

        switch insertConfig.placement {
        case .next:
            // Insert right after current slide
            insertIndex = currentIndex + 1

        case .after(let slideCount):
            // Insert at currentIndex + slideCount, or at end if out of bounds
            let targetIndex = currentIndex + slideCount
            insertIndex = min(targetIndex, slides.count)

        case .after(let slideId):
            // Find slide with matching ID ahead of current position
            if let foundIndex = slides[(currentIndex + 1)...].firstIndex(where: { $0.id == slideId }) {
                insertIndex = foundIndex + 1
            } else {
                // Slide ID not found ahead of current position, do nothing
                insertIndex = nil
            }
        }

        if let index = insertIndex {
            slides.insert(insertConfig.slide, at: index)
        }
    }

    func previousSlide() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }

    func toggleSelection(for option: OnbChoiceOption, selectionBehavior: OnbSelectionBehavior) {
        let currentSlide = slides[currentIndex]
        var currentSelections = savedSelections[currentSlide.id] ?? []

        switch selectionBehavior {
        case .single:
            if let index = currentSelections.firstIndex(of: option) {
                currentSelections.remove(at: index)
            } else {
                currentSelections = [option]
            }
        case .multi:
            if let index = currentSelections.firstIndex(of: option) {
                currentSelections.remove(at: index)
            } else {
                currentSelections.append(option)
            }
        }

        savedSelections[currentSlide.id] = currentSelections
    }

    func getSelections(for slideId: String) -> [OnbChoiceOption] {
        return savedSelections[slideId] ?? []
    }

    func getCurrentSelections() -> [OnbChoiceOption] {
        let currentSlide = slides[currentIndex]
        return savedSelections[currentSlide.id] ?? []
    }

}
