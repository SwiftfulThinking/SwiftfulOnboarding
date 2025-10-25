//
//  OnbFeedbackConfiguration.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

struct OnbFeedbackConfiguration {

    var backgroundColor: Color? = nil
    var borderWidth: CGFloat? = nil
    var borderColor: Color? = nil
    var cornerRadius: CGFloat? = nil
    var horizontalPadding: CGFloat? = nil
    var title: String? = nil
    var titleFont: Font? = nil
    var subtitle: String? = nil
    var subtitleFont: Font? = nil
    var titleSubtitleSpacing: CGFloat? = nil
    var titleAlignment: OnbTextAlignment? = nil
    var paddingTop: CGFloat? = nil
    var paddingBottom: CGFloat? = nil
    var paddingHorizontal: CGFloat? = nil

    static let `default` = OnbFeedbackConfiguration(
        backgroundColor: .green,
        borderWidth: 0,
        borderColor: .clear,
        cornerRadius: 24,
        horizontalPadding: 0,
        title: nil,
        titleFont: .headline,
        subtitle: nil,
        subtitleFont: .subheadline,
        titleSubtitleSpacing: 8,
        titleAlignment: .leading,
        paddingTop: 16,
        paddingBottom: 16,
        paddingHorizontal: 24
    )
}
