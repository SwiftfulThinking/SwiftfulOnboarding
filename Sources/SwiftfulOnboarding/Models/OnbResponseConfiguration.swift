//
//  OnbResponseConfiguration.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

struct OnbResponseConfiguration {

    var style: AnyResponseViewStyle = .center(transition: .slide)
    var backgroundColor: Color = .blue
    var borderWidth: CGFloat = 0
    var borderColor: Color = .clear
    var cornerRadius: CGFloat = 24
    var horizontalPadding: CGFloat = 0
    var title: String? = nil
    var titleFont: Font = .title
    var subtitle: String? = nil
    var subtitleFont: Font = .body
    var titleSubtitleSpacing: CGFloat = 8
    var titleAlignment: OnbTextAlignment = .center
    var paddingTop: CGFloat = 40
    var paddingBottom: CGFloat = 0
    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .white, textColor: .blue)
    var ctaButtonFormatData: OnbButtonFormatData = .default

}
