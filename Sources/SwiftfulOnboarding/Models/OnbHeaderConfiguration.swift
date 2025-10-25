//
//  OnbHeaderConfiguration.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

struct OnbHeaderConfiguration {
    var headerStyle: HeaderStyle = .progressBar
    var headerAlignment: HeaderAlignment = .center
    var showBackButton: OnbBackButtonBehavior = .afterFirstSlide
    var backButtonColor: Color = .primary
    var progressBarAccentColor: Color = .blue

    static let `default` = OnbHeaderConfiguration()
}
