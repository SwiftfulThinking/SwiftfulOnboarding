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
        ctaButtonFormatData: OnbButtonFormatData = .default,
        backgroundColorOverride: Color? = nil,
        showBackButtonOverride: Bool? = nil
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
        ctaButtonFormatData: OnbButtonFormatData = .default,
        backgroundColorOverride: Color? = nil,
        showBackButtonOverride: Bool? = nil
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
        ctaButtonFormatData: OnbButtonFormatData = .default,
        backgroundColorOverride: Color? = nil,
        showBackButtonOverride: Bool? = nil
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
        ratingButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white),
        ratingCornerRadius: CGFloat = 32,
        ratingButtonOption: OnbRatingButtonOption = .thumbs,
        ratingFont: Font = .title.weight(.medium),
        ratingLabels: RatingFooterLabels? = nil,
        selectionBehavior: OnbSelectionBehavior = .single(),
        footerData: OnbFooterData = .default,
        ctaText: String = "Continue",
        ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white),
        ctaButtonFormatData: OnbButtonFormatData = .default,
        backgroundColorOverride: Color? = nil,
        showBackButtonOverride: Bool? = nil
    )
    case textInput(
        id: String,
        title: String? = nil,
        titleFont: Font = .largeTitle,
        subtitle: String? = nil,
        subtitleFont: Font = .body,
        titleSubtitleSpacing: CGFloat = 8,
        titleAlignment: OnbTextAlignment = .center,
        contentAlignment: OnbContentAlignment = .center,
        paddingTop: CGFloat = 40,
        paddingBottom: CGFloat = 0,
        horizontalPaddingTitle: CGFloat = 40,
        contentSpacing: CGFloat = 24,
        textFieldKeyboardType: UIKeyboardType = .default,
        footerData: OnbFooterData = .default,
        ctaText: String = "Continue",
        ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white),
        ctaButtonFormatData: OnbButtonFormatData = .default,
        backgroundColorOverride: Color? = nil,
        showBackButtonOverride: Bool? = nil
    )
    case datePicker(
        id: String,
        title: String? = nil,
        titleFont: Font = .largeTitle,
        subtitle: String? = nil,
        subtitleFont: Font = .body,
        titleSubtitleSpacing: CGFloat = 8,
        titleAlignment: OnbTextAlignment = .center,
        contentAlignment: OnbContentAlignment = .center,
        paddingTop: CGFloat = 40,
        paddingBottom: CGFloat = 0,
        horizontalPaddingTitle: CGFloat = 40,
        contentSpacing: CGFloat = 24,
        datePickerPosition: OnbDatePickerPosition = .auto,
        datePickerStyle: OnbDatePickerStyle = .graphical,
        datePickerComponents: OnbDatePickerComponents = .date,
        datePickerStartDate: Date? = nil,
        datePickerMinimumDate: Date? = nil,
        datePickerMaximumDate: Date? = nil,
        datePickerHorizontalPadding: CGFloat = 24,
        footerData: OnbFooterData = .default,
        ctaText: String = "Continue",
        ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white),
        ctaButtonFormatData: OnbButtonFormatData = .default,
        backgroundColorOverride: Color? = nil,
        showBackButtonOverride: Bool? = nil
    )
    case picker(
        id: String,
        title: String? = nil,
        titleFont: Font = .largeTitle,
        subtitle: String? = nil,
        subtitleFont: Font = .body,
        titleSubtitleSpacing: CGFloat = 8,
        titleAlignment: OnbTextAlignment = .center,
        contentAlignment: OnbContentAlignment = .center,
        paddingTop: CGFloat = 40,
        paddingBottom: CGFloat = 0,
        horizontalPaddingTitle: CGFloat = 40,
        contentSpacing: CGFloat = 24,
        pickerPosition: OnbPickerPosition = .auto,
        pickerStyle: OnbPickerStyle = .wheel,
        pickerOptions: [String] = [],
        pickerHorizontalPadding: CGFloat = 24,
        footerData: OnbFooterData = .default,
        ctaText: String = "Continue",
        ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white),
        ctaButtonFormatData: OnbButtonFormatData = .default,
        backgroundColorOverride: Color? = nil,
        showBackButtonOverride: Bool? = nil
    )
    case primaryAction(
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
        ctaButtonFormatData: OnbButtonFormatData = .default,
        secondaryButtonText: String? = nil,
        secondaryButtonStyle: OnbButtonStyleType = .outline(textColor: .blue, borderColor: .blue),
        secondaryButtonFormatData: OnbButtonFormatData = .default,
        secondaryButtonSpacing: CGFloat = 12,
        onDidPressPrimaryButton: ((@escaping () -> Void) -> Void)? = nil,
        backgroundColorOverride: Color? = nil,
        showBackButtonOverride: Bool? = nil
    )

    var id: String {
        switch self {
        case .regular(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .multipleChoice(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .yesNo(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .rating(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .textInput(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .datePicker(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .picker(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .primaryAction(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        }
    }

    var backgroundColorOverride: Color? {
        switch self {
        case .regular(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backgroundColorOverride, _):
            return backgroundColorOverride
        case .multipleChoice(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backgroundColorOverride, _):
            return backgroundColorOverride
        case .yesNo(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backgroundColorOverride, _):
            return backgroundColorOverride
        case .rating(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backgroundColorOverride, _):
            return backgroundColorOverride
        case .textInput(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backgroundColorOverride, _):
            return backgroundColorOverride
        case .datePicker(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backgroundColorOverride, _):
            return backgroundColorOverride
        case .picker(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backgroundColorOverride, _):
            return backgroundColorOverride
        case .primaryAction(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backgroundColorOverride, _):
            return backgroundColorOverride
        }
    }

    var showBackButtonOverride: Bool? {
        switch self {
        case .regular(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButtonOverride):
            return showBackButtonOverride
        case .multipleChoice(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButtonOverride):
            return showBackButtonOverride
        case .yesNo(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButtonOverride):
            return showBackButtonOverride
        case .rating(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButtonOverride):
            return showBackButtonOverride
        case .textInput(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButtonOverride):
            return showBackButtonOverride
        case .datePicker(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButtonOverride):
            return showBackButtonOverride
        case .picker(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButtonOverride):
            return showBackButtonOverride
        case .primaryAction(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButtonOverride):
            return showBackButtonOverride
        }
    }
}
