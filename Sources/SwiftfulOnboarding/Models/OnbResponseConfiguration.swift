//
//  OnbResponseConfiguration.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

public struct OnbResponseConfiguration: Sendable {

    public var style: AnyResponseViewStyle?
    public var backgroundColor: Color?
    public var borderWidth: CGFloat?
    public var borderColor: Color?
    public var cornerRadius: CGFloat?
    public var horizontalPadding: CGFloat?
    public var title: String?
    public var titleFont: Font?
    public var subtitle: String?
    public var subtitleFont: Font?
    public var titleSubtitleSpacing: CGFloat?
    public var titleAlignment: OnbTextAlignment?
    public var paddingTop: CGFloat?
    public var paddingBottom: CGFloat?
    public var footerData: OnbFooterData?
    public var ctaText: String?
    public var ctaButtonStyle: OnbButtonStyleType?
    public var ctaButtonFormatData: OnbButtonFormatData?

    public init(
        style: AnyResponseViewStyle? = nil,
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
        footerData: OnbFooterData? = nil,
        ctaText: String? = nil,
        ctaButtonStyle: OnbButtonStyleType? = nil,
        ctaButtonFormatData: OnbButtonFormatData? = nil
    ) {
        self.style = style
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
        self.footerData = footerData
        self.ctaText = ctaText
        self.ctaButtonStyle = ctaButtonStyle
        self.ctaButtonFormatData = ctaButtonFormatData
    }

    public static let `default` = OnbResponseConfiguration(
        style: .center(transition: .slide),
        backgroundColor: .blue,
        borderWidth: 0,
        borderColor: .clear,
        cornerRadius: 24,
        horizontalPadding: 0,
        title: nil,
        titleFont: .title,
        subtitle: nil,
        subtitleFont: .body,
        titleSubtitleSpacing: 8,
        titleAlignment: .center,
        paddingTop: 16,
        paddingBottom: 0,
        footerData: .default,
        ctaText: "Continue",
        ctaButtonStyle: .solid(backgroundColor: .white, textColor: .blue),
        ctaButtonFormatData: .default
    )
}
