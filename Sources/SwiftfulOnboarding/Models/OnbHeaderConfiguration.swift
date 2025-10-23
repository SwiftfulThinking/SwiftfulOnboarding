//
//  OnbHeaderConfiguration.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

struct OnbHeaderConfiguration {
    var headerStyle: HeaderStyle
    var headerAlignment: HeaderAlignment
    var showBackButton: OnbBackButtonBehavior
    var backButtonColor: Color

    static let `default` = OnbHeaderConfiguration(
        headerStyle: .progressBar,
        headerAlignment: .center,
        showBackButton: .afterFirstSlide,
        backButtonColor: .primary
    )
}
