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
        mediaSize: OnbMediaSize = .max,
        mediaPosition: OnbMediaPosition = .top,
        contentAlignment: OnbContentAlignment = .center,
        paddingTop: CGFloat = 40,
        paddingBottom: CGFloat = 0,
        horizontalPaddingContent: CGFloat = 0,
        horizontalPaddingTitle: CGFloat = 40,
        contentSpacing: CGFloat = 24,
        footerPadding: OnbFooterPadding = .default,
        ctaText: String = "Continue",
        ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
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
        selectionBehavior: OnbSelectionBehavior = .single,
        isGrid: Bool = false,
        contentAlignment: OnbContentAlignment = .center,
        paddingTop: CGFloat = 24,
        paddingBottom: CGFloat = 0,
        horizontalPaddingContent: CGFloat = 24,
        horizontalPaddingTitle: CGFloat = 40,
        contentSpacing: CGFloat = 24,
        footerPadding: OnbFooterPadding = .default,
        ctaText: String = "Continue",
        ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    )

    var id: String {
        switch self {
        case .regular(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .multipleChoice(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        }
    }
}
