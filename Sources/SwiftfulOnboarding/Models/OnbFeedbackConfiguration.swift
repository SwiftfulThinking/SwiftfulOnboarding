//
//  OnbFeedbackConfiguration.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

struct OnbFeedbackConfiguration {

    var style: AnyFeedbackViewStyle = .top()
    var backgroundColor: Color = .green
    var borderWidth: CGFloat = 0
    var borderColor: Color = .clear
    var cornerRadius: CGFloat = 24
    var horizontalPadding: CGFloat = 0
    var title: String? = nil
    var titleFont: Font = .headline
    var subtitle: String? = nil
    var subtitleFont: Font = .subheadline
    var titleSubtitleSpacing: CGFloat = 8
    var titleAlignment: OnbTextAlignment = .leading
    var paddingTop: CGFloat = 16
    var paddingBottom: CGFloat = 16
    var paddingHorizontal: CGFloat = 24

}
