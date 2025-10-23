//
//  OnbConfiguration.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

enum OnbBackButtonBehavior {
    case always
    case afterFirstSlide
    case never
}

enum OnbTransitionStyle {
    case none
    case opacity
    case slide
    case fade
}

struct OnbConfiguration {

    // Header configuration
    var headerStyle: HeaderStyle = .progressBar
    var headerAlignment: HeaderAlignment = .center
    var showBackButton: OnbBackButtonBehavior = .afterFirstSlide
    var backButtonColor: Color = .primary

    // Slides data
    var slides: [OnbSlideType] = []

    // Slide defaults
    var slideDefaults: OnbSlideDefaults = .default

}