//
//  OnbHeaderConfiguration.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

public struct OnbHeaderConfiguration: Sendable {
    public var headerStyle: HeaderStyle = .progressBar
    public var headerAlignment: HeaderAlignment = .center
    public var showBackButton: OnbBackButtonBehavior = .afterFirstSlide
    public var backButtonColor: Color = .primary
    public var progressBarAccentColor: Color = .blue

    public init(
        headerStyle: HeaderStyle = .progressBar,
        headerAlignment: HeaderAlignment = .center,
        showBackButton: OnbBackButtonBehavior = .afterFirstSlide,
        backButtonColor: Color = .primary,
        progressBarAccentColor: Color = .blue
    ) {
        self.headerStyle = headerStyle
        self.headerAlignment = headerAlignment
        self.showBackButton = showBackButton
        self.backButtonColor = backButtonColor
        self.progressBarAccentColor = progressBarAccentColor
    }

    public static let `default` = OnbHeaderConfiguration()
}
