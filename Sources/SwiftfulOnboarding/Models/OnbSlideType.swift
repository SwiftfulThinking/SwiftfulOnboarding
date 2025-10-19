//
//  OnbSlideType.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

protocol OnbSlideProtocol {
    var id: String { get }
}

enum OnbSlideType: OnbSlideProtocol {
    case regular(
        id: String,
        title: String? = nil,
        titleFont: Font = .largeTitle,
        subtitle: String? = nil,
        subtitleFont: Font = .body,
        titleSubtitleSpacing: CGFloat = 8,
        titleAlignment: OnbTextAlignment = .center,
        media: OnbMediaType? = nil,
        mediaPosition: OnbMediaPosition = .top,
        contentAlignment: OnbContentAlignment = .center,
        paddingTop: CGFloat = 40,
        paddingBottom: CGFloat = 0,
        horizontalPaddingContent: CGFloat = 0,
        horizontalPaddingTitle: CGFloat = 40,
        contentSpacing: CGFloat = 24,
        footerData: OnbFooterData = .default,
        ctaText: String = "Continue",
        ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white),
        ctaButtonFormatData: OnbButtonFormatData = .default
    )
    case multipleChoice(
        id: String,
        title: String? = nil,
        titleFont: Font = .largeTitle,
        subtitle: String? = nil,
        subtitleFont: Font = .body,
        titleSubtitleSpacing: CGFloat = 8,
        titleAlignment: OnbTextAlignment = .center,
        options: [OnbChoiceOption] = [],
        optionsSpacing: CGFloat = 12,
        optionsButtonStyle: OnbButtonStyleType = .outline(textColor: .blue, borderColor: .blue),
        optionsButtonFormatData: OnbButtonFormatData = .default,
        selectionBehavior: OnbSelectionBehavior = .single(),
        isGrid: Bool = false,
        contentAlignment: OnbContentAlignment = .top,
        paddingTop: CGFloat = 24,
        paddingBottom: CGFloat = 0,
        horizontalPaddingContent: CGFloat = 24,
        horizontalPaddingTitle: CGFloat = 40,
        contentSpacing: CGFloat = 24,
        footerData: OnbFooterData = .default,
        ctaText: String = "Continue",
        ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white),
        ctaButtonFormatData: OnbButtonFormatData = .default
    )
    case yesNo(
        id: String,
        title: String? = nil,
        titleFont: Font = .largeTitle,
        subtitle: String? = nil,
        subtitleFont: Font = .body,
        titleSubtitleSpacing: CGFloat = 8,
        titleAlignment: OnbTextAlignment = .center,
        media: OnbMediaType? = nil,
        mediaPosition: OnbMediaPosition = .top,
        contentAlignment: OnbContentAlignment = .center,
        paddingTop: CGFloat = 40,
        paddingBottom: CGFloat = 0,
        horizontalPaddingContent: CGFloat = 0,
        horizontalPaddingTitle: CGFloat = 40,
        contentSpacing: CGFloat = 24,
        yesNoSpacing: CGFloat = 12,
        yesText: String = "Yes",
        noText: String = "No",
        yesNoButtonStyle: OnbButtonStyleType = .solidOutline(backgroundColor: .clear, textColor: .blue, borderColor: .blue, selectedBackgroundColor: .blue, selectedTextColor: .white, selectedBorderColor: .blue),
        yesNoButtonFormatData: OnbButtonFormatData = .default,
        selectionBehavior: OnbSelectionBehavior = .single(),
        footerData: OnbFooterData = .default,
        ctaText: String = "Continue",
        ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .gray, textColor: .white, selectedBackgroundColor: .blue, selectedTextColor: .white),
        ctaButtonFormatData: OnbButtonFormatData = .default
    )
    case rating(
        id: String,
        title: String? = nil,
        titleFont: Font = .largeTitle,
        subtitle: String? = nil,
        subtitleFont: Font = .body,
        titleSubtitleSpacing: CGFloat = 8,
        titleAlignment: OnbTextAlignment = .center,
        media: OnbMediaType? = nil,
        mediaPosition: OnbMediaPosition = .top,
        contentAlignment: OnbContentAlignment = .center,
        paddingTop: CGFloat = 40,
        paddingBottom: CGFloat = 0,
        horizontalPaddingContent: CGFloat = 0,
        horizontalPaddingTitle: CGFloat = 40,
        contentSpacing: CGFloat = 24,
        footerData: OnbFooterData = .default,
        ctaText: String = "Continue",
        ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white),
        ctaButtonFormatData: OnbButtonFormatData = .default
    )

    var id: String {
        switch self {
        case .regular(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .multipleChoice(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .yesNo(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .rating(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        }
    }
}
