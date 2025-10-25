//
//  OnbFeedbackConfiguration.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

public struct OnbFeedbackConfiguration: Sendable {

    public var backgroundColor: Color? = nil
    public var borderWidth: CGFloat? = nil
    public var borderColor: Color? = nil
    public var cornerRadius: CGFloat? = nil
    public var horizontalPadding: CGFloat? = nil
    public var title: String? = nil
    public var titleFont: Font? = nil
    public var subtitle: String? = nil
    public var subtitleFont: Font? = nil
    public var titleSubtitleSpacing: CGFloat? = nil
    public var titleAlignment: OnbTextAlignment? = nil
    public var paddingTop: CGFloat? = nil
    public var paddingBottom: CGFloat? = nil
    public var paddingHorizontal: CGFloat? = nil

    public init(
        backgroundColor: Color? = nil,
        borderWidth: CGFloat? = nil,
        borderColor: Color? = nil,
        cornerRadius: CGFloat? = nil,
        horizontalPadding: CGFloat? = nil,
        title: String? = nil,
        titleFont: Font? = nil,
        subtitle: String? = nil,
        subtitleFont: Font? = nil,
        titleSubtitleSpacing: CGFloat? = nil,
        titleAlignment: OnbTextAlignment? = nil,
        paddingTop: CGFloat? = nil,
        paddingBottom: CGFloat? = nil,
        paddingHorizontal: CGFloat? = nil
    ) {
        self.backgroundColor = backgroundColor
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.horizontalPadding = horizontalPadding
        self.title = title
        self.titleFont = titleFont
        self.subtitle = subtitle
        self.subtitleFont = subtitleFont
        self.titleSubtitleSpacing = titleSubtitleSpacing
        self.titleAlignment = titleAlignment
        self.paddingTop = paddingTop
        self.paddingBottom = paddingBottom
        self.paddingHorizontal = paddingHorizontal
    }

    public static let `default` = OnbFeedbackConfiguration(
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
