//
//  AnyFeedbackViewContainer.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

struct AnyFeedbackViewContainer: View {

    let config: OnbFeedbackConfiguration
    var style: AnyFeedbackViewStyle = .top()

    var body: some View {
        AnyFeedbackView(
            style: style,
            backgroundColor: config.backgroundColor,
            borderWidth: config.borderWidth,
            borderColor: config.borderColor,
            cornerRadius: config.cornerRadius,
            horizontalPadding: config.horizontalPadding,
            title: config.title,
            titleFont: config.titleFont,
            subtitle: config.subtitle,
            subtitleFont: config.subtitleFont,
            titleSubtitleSpacing: config.titleSubtitleSpacing,
            titleAlignment: config.titleAlignment,
            paddingTop: config.paddingTop,
            paddingBottom: config.paddingBottom,
            paddingHorizontal: config.paddingHorizontal
        )
    }
}
