//
//  OnbConfiguration.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

struct OnbConfiguration {

    // Header configuration
    var headerStyle: HeaderStyle = .progressBar
    var headerAlignment: HeaderAlignment = .center
    var showBackButton: Bool = true

    // Slides data
    var slides: [OnbSlideType] = []

    // Background color
    var backgroundColor: Color = .clear

}