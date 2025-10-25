//
//  OnbResponseConfiguration.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

struct OnbResponseConfiguration {

    var style: AnyResponseViewStyle? = nil
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
    var footerData: OnbFooterData? = nil
    var ctaText: String? = nil
    var ctaButtonStyle: OnbButtonStyleType? = nil
    var ctaButtonFormatData: OnbButtonFormatData? = nil

    static let `default` = OnbResponseConfiguration(
        style: .center(transition: .slide),
        backgroundColor: .blue,
        borderWidth: 0,
        borderColor: .clear,
        cornerRadius: 24,
        horizontalPadding: 24,
        title: nil,
        titleFont: .title,
        subtitle: nil,
        subtitleFont: .body,
        titleSubtitleSpacing: 8,
        titleAlignment: .center,
        paddingTop: 40,
        paddingBottom: 0,
        footerData: .default,
        ctaText: "Continue",
        ctaButtonStyle: .solid(backgroundColor: .white, textColor: .blue),
        ctaButtonFormatData: .default
    )
}
