//
//  OnbConfiguration.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

public enum OnbBackButtonBehavior: Sendable {
    case always
    case afterFirstSlide
    case never
}

public enum OnbTransitionStyle: Sendable {
    case none
    case opacity
    case slide
    case fade
}

public struct OnbConfiguration {

    // Header configuration
    public var headerConfiguration: OnbHeaderConfiguration

    // Slides data
    public var slides: [OnbSlideType]

    // Slide defaults
    public var slideDefaults: OnbSlideDefaults

    // Callbacks
    public var onSlideComplete: ((OnbSlideData) -> Void)?
    public var onFlowComplete: ((OnbFlowData) -> Void)?

    public init(
        headerConfiguration: OnbHeaderConfiguration = .default,
        slides: [OnbSlideType] = [],
        slideDefaults: OnbSlideDefaults = .default,
        onSlideComplete: ((OnbSlideData) -> Void)? = nil,
        onFlowComplete: ((OnbFlowData) -> Void)? = nil
    ) {
        self.headerConfiguration = headerConfiguration
        self.slides = slides
        self.slideDefaults = slideDefaults
        self.onSlideComplete = onSlideComplete
        self.onFlowComplete = onFlowComplete
    }

}