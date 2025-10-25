//
//  AnyFeedbackViewContainer.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

struct AnyFeedbackViewContainer: View {

    let config: OnbFeedbackConfiguration
    var defaultConfig: OnbFeedbackConfiguration = OnbFeedbackConfiguration()
    var style: AnyFeedbackViewStyle = .top()

    var body: some View {
        AnyFeedbackView(
            style: style,
            backgroundColor: config.backgroundColor ?? defaultConfig.backgroundColor ?? .green,
            borderWidth: config.borderWidth ?? defaultConfig.borderWidth ?? 0,
            borderColor: config.borderColor ?? defaultConfig.borderColor ?? .clear,
            cornerRadius: config.cornerRadius ?? defaultConfig.cornerRadius ?? 24,
            horizontalPadding: config.horizontalPadding ?? defaultConfig.horizontalPadding ?? 0,
            title: config.title ?? defaultConfig.title,
            titleFont: config.titleFont ?? defaultConfig.titleFont ?? .headline,
            subtitle: config.subtitle ?? defaultConfig.subtitle,
            subtitleFont: config.subtitleFont ?? defaultConfig.subtitleFont ?? .subheadline,
            titleSubtitleSpacing: config.titleSubtitleSpacing ?? defaultConfig.titleSubtitleSpacing ?? 8,
            titleAlignment: config.titleAlignment ?? defaultConfig.titleAlignment ?? .leading,
            paddingTop: config.paddingTop ?? defaultConfig.paddingTop ?? 16,
            paddingBottom: config.paddingBottom ?? defaultConfig.paddingBottom ?? 16,
            paddingHorizontal: config.paddingHorizontal ?? defaultConfig.paddingHorizontal ?? 24
        )
    }
}
