//
//  OnbSlideType.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import UIKit
import SwiftUI

public typealias OnbKeyboardType = UIKeyboardType

public enum OnbSlideType {
    case regular(
        id: String,
        title: String? = nil,
        titleFont: Font? = nil,
        subtitle: String? = nil,
        subtitleFont: Font? = nil,
        titleSubtitleSpacing: CGFloat? = nil,
        titleAlignment: OnbTextAlignment? = nil,
        media: OnbMediaType? = nil,
        mediaPosition: OnbMediaPosition? = nil,
        contentAlignment: OnbContentAlignment? = nil,
        paddingTop: CGFloat? = nil,
        paddingBottom: CGFloat? = nil,
        horizontalPaddingContent: CGFloat? = nil,
        horizontalPaddingTitle: CGFloat? = nil,
        contentSpacing: CGFloat? = nil,
        footerData: OnbFooterData? = nil,
        ctaText: String? = nil,
        ctaButtonStyle: OnbButtonStyleType? = nil,
        ctaButtonFormatData: OnbButtonFormatData? = nil,
        background: OnbBackgroundType? = nil,
        showBackButton: Bool? = nil,
        backButtonColor: Color? = nil
    )
    case multipleChoice(
        id: String,
        title: String? = nil,
        titleFont: Font? = nil,
        subtitle: String? = nil,
        subtitleFont: Font? = nil,
        titleSubtitleSpacing: CGFloat? = nil,
        titleAlignment: OnbTextAlignment? = nil,
        options: [OnbChoiceOption],
        optionsSpacing: CGFloat? = nil,
        optionsButtonStyle: OnbButtonStyleType? = nil,
        optionsButtonFormatData: OnbButtonFormatData? = nil,
        selectionBehavior: OnbSelectionBehavior? = nil,
        isGrid: Bool? = nil,
        contentAlignment: OnbContentAlignment? = nil,
        paddingTop: CGFloat? = nil,
        paddingBottom: CGFloat? = nil,
        horizontalPaddingContent: CGFloat? = nil,
        horizontalPaddingTitle: CGFloat? = nil,
        contentSpacing: CGFloat? = nil,
        footerData: OnbFooterData? = nil,
        ctaText: String? = nil,
        ctaButtonStyle: OnbButtonStyleType? = nil,
        ctaButtonFormatData: OnbButtonFormatData? = nil,
        feedbackStyle: AnyFeedbackViewStyle? = nil,
        background: OnbBackgroundType? = nil,
        showBackButton: Bool? = nil,
        backButtonColor: Color? = nil
    )
    case yesNo(
        id: String,
        title: String? = nil,
        titleFont: Font? = nil,
        subtitle: String? = nil,
        subtitleFont: Font? = nil,
        titleSubtitleSpacing: CGFloat? = nil,
        titleAlignment: OnbTextAlignment? = nil,
        media: OnbMediaType? = nil,
        mediaPosition: OnbMediaPosition? = nil,
        contentAlignment: OnbContentAlignment? = nil,
        paddingTop: CGFloat? = nil,
        paddingBottom: CGFloat? = nil,
        horizontalPaddingContent: CGFloat? = nil,
        horizontalPaddingTitle: CGFloat? = nil,
        contentSpacing: CGFloat? = nil,
        optionsSpacing: CGFloat? = nil,
        yesOption: OnbChoiceOption = OnbChoiceOption(id: "yes", content: OnbButtonContentData(text: "Yes")),
        noOption: OnbChoiceOption = OnbChoiceOption(id: "no", content: OnbButtonContentData(text: "No")),
        optionsButtonStyle: OnbButtonStyleType? = nil,
        optionsButtonFormatData: OnbButtonFormatData? = nil,
        selectionBehavior: OnbSelectionBehavior? = nil,
        footerData: OnbFooterData? = nil,
        ctaText: String? = nil,
        ctaButtonStyle: OnbButtonStyleType? = nil,
        ctaButtonFormatData: OnbButtonFormatData? = nil,
        feedbackStyle: AnyFeedbackViewStyle? = nil,
        background: OnbBackgroundType? = nil,
        showBackButton: Bool? = nil,
        backButtonColor: Color? = nil
    )
    case rating(
        id: String,
        title: String? = nil,
        titleFont: Font? = nil,
        subtitle: String? = nil,
        subtitleFont: Font? = nil,
        titleSubtitleSpacing: CGFloat? = nil,
        titleAlignment: OnbTextAlignment? = nil,
        media: OnbMediaType? = nil,
        mediaPosition: OnbMediaPosition? = nil,
        contentAlignment: OnbContentAlignment? = nil,
        paddingTop: CGFloat? = nil,
        paddingBottom: CGFloat? = nil,
        horizontalPaddingContent: CGFloat? = nil,
        horizontalPaddingTitle: CGFloat? = nil,
        contentSpacing: CGFloat? = nil,
        optionsButtonStyle: OnbButtonStyleType? = nil,
        ratingCornerRadius: CGFloat = 32,
        ratingButtonOption: OnbRatingButtonOption = .thumbs,
        ratingFont: Font = .title.weight(.medium),
        ratingLabels: RatingFooterLabels? = nil,
        selectionBehavior: OnbSelectionBehavior? = nil,
        footerData: OnbFooterData? = nil,
        ctaText: String? = nil,
        ctaButtonStyle: OnbButtonStyleType? = nil,
        ctaButtonFormatData: OnbButtonFormatData? = nil,
        getResponseConfiguration: (@MainActor (Int) -> OnbResponseConfiguration?)? = nil,
        getFeedbackConfiguration: (@MainActor (Int) -> OnbFeedbackConfiguration?)? = nil,
        getInsertConfiguration: (@MainActor (Int) -> [InsertSlideData]?)? = nil,
        feedbackStyle: AnyFeedbackViewStyle? = nil,
        background: OnbBackgroundType? = nil,
        showBackButton: Bool? = nil,
        backButtonColor: Color? = nil
    )
    case textInput(
        id: String,
        title: String? = nil,
        titleFont: Font? = nil,
        subtitle: String? = nil,
        subtitleFont: Font? = nil,
        titleSubtitleSpacing: CGFloat? = nil,
        titleAlignment: OnbTextAlignment? = nil,
        contentAlignment: OnbContentAlignment? = nil,
        paddingTop: CGFloat? = nil,
        paddingBottom: CGFloat? = nil,
        horizontalPaddingTitle: CGFloat? = nil,
        contentSpacing: CGFloat? = nil,
        textFieldKeyboardType: OnbKeyboardType = .default,
        footerData: OnbFooterData? = nil,
        ctaText: String? = nil,
        ctaButtonStyle: OnbButtonStyleType? = nil,
        ctaButtonFormatData: OnbButtonFormatData? = nil,
        background: OnbBackgroundType? = nil,
        showBackButton: Bool? = nil,
        backButtonColor: Color? = nil
    )
    case datePicker(
        id: String,
        title: String? = nil,
        titleFont: Font? = nil,
        subtitle: String? = nil,
        subtitleFont: Font? = nil,
        titleSubtitleSpacing: CGFloat? = nil,
        titleAlignment: OnbTextAlignment? = nil,
        contentAlignment: OnbContentAlignment? = nil,
        paddingTop: CGFloat? = nil,
        paddingBottom: CGFloat? = nil,
        horizontalPaddingTitle: CGFloat? = nil,
        contentSpacing: CGFloat? = nil,
        datePickerPosition: OnbDatePickerPosition = .auto,
        datePickerStyle: OnbDatePickerStyle = .graphical,
        datePickerComponents: OnbDatePickerComponents = .date,
        datePickerStartDate: Date? = nil,
        datePickerMinimumDate: Date? = nil,
        datePickerMaximumDate: Date? = nil,
        horizontalPaddingContent: CGFloat? = nil,
        footerData: OnbFooterData? = nil,
        ctaText: String? = nil,
        ctaButtonStyle: OnbButtonStyleType? = nil,
        ctaButtonFormatData: OnbButtonFormatData? = nil,
        background: OnbBackgroundType? = nil,
        showBackButton: Bool? = nil,
        backButtonColor: Color? = nil
    )
    case picker(
        id: String,
        title: String? = nil,
        titleFont: Font? = nil,
        subtitle: String? = nil,
        subtitleFont: Font? = nil,
        titleSubtitleSpacing: CGFloat? = nil,
        titleAlignment: OnbTextAlignment? = nil,
        contentAlignment: OnbContentAlignment? = nil,
        paddingTop: CGFloat? = nil,
        paddingBottom: CGFloat? = nil,
        horizontalPaddingTitle: CGFloat? = nil,
        contentSpacing: CGFloat? = nil,
        pickerPosition: OnbPickerPosition = .auto,
        pickerStyle: OnbPickerStyle = .wheel,
        pickerOptions: [String],
        horizontalPaddingContent: CGFloat? = nil,
        footerData: OnbFooterData? = nil,
        ctaText: String? = nil,
        ctaButtonStyle: OnbButtonStyleType? = nil,
        ctaButtonFormatData: OnbButtonFormatData? = nil,
        background: OnbBackgroundType? = nil,
        showBackButton: Bool? = nil,
        backButtonColor: Color? = nil
    )
    case primaryAction(
        id: String,
        title: String? = nil,
        titleFont: Font? = nil,
        subtitle: String? = nil,
        subtitleFont: Font? = nil,
        titleSubtitleSpacing: CGFloat? = nil,
        titleAlignment: OnbTextAlignment? = nil,
        media: OnbMediaType? = nil,
        mediaPosition: OnbMediaPosition? = nil,
        contentAlignment: OnbContentAlignment? = nil,
        paddingTop: CGFloat? = nil,
        paddingBottom: CGFloat? = nil,
        horizontalPaddingContent: CGFloat? = nil,
        horizontalPaddingTitle: CGFloat? = nil,
        contentSpacing: CGFloat? = nil,
        footerData: OnbFooterData? = nil,
        ctaText: String? = nil,
        ctaButtonStyle: OnbButtonStyleType? = nil,
        ctaButtonFormatData: OnbButtonFormatData? = nil,
        secondaryButtonText: String? = nil,
        secondaryButtonStyle: OnbButtonStyleType? = nil,
        secondaryButtonFormatData: OnbButtonFormatData? = nil,
        secondaryButtonSpacing: CGFloat? = nil,
        onDidPressPrimaryButton: (@MainActor (@escaping () -> Void) -> Void)? = nil,
        background: OnbBackgroundType? = nil,
        showBackButton: Bool? = nil,
        backButtonColor: Color? = nil
    )

    public var id: String {
        switch self {
        case .regular(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .multipleChoice(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .yesNo(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .rating(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .textInput(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .datePicker(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .picker(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        case .primaryAction(let id, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return id
        }
    }

    public var background: OnbBackgroundType? {
        switch self {
        case .regular(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let background, _, _):
            return background
        case .multipleChoice(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let background, _, _):
            return background
        case .yesNo(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let background, _, _):
            return background
        case .rating(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let background, _, _):
            return background
        case .textInput(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let background, _, _):
            return background
        case .datePicker(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let background, _, _):
            return background
        case .picker(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let background, _, _):
            return background
        case .primaryAction(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let background, _, _):
            return background
        }
    }

    public var showBackButton: Bool? {
        switch self {
        case .regular(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButton, _):
            return showBackButton
        case .multipleChoice(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButton, _):
            return showBackButton
        case .yesNo(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButton, _):
            return showBackButton
        case .rating(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButton, _):
            return showBackButton
        case .textInput(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButton, _):
            return showBackButton
        case .datePicker(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButton, _):
            return showBackButton
        case .picker(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButton, _):
            return showBackButton
        case .primaryAction(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let showBackButton, _):
            return showBackButton
        }
    }

    public var backButtonColor: Color? {
        switch self {
        case .regular(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backButtonColor):
            return backButtonColor
        case .multipleChoice(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backButtonColor):
            return backButtonColor
        case .yesNo(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backButtonColor):
            return backButtonColor
        case .rating(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backButtonColor):
            return backButtonColor
        case .textInput(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backButtonColor):
            return backButtonColor
        case .datePicker(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backButtonColor):
            return backButtonColor
        case .picker(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backButtonColor):
            return backButtonColor
        case .primaryAction(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, let backButtonColor):
            return backButtonColor
        }
    }

    public var title: String? {
        switch self {
        case .regular(_, let title, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return title
        case .multipleChoice(_, let title, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return title
        case .yesNo(_, let title, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return title
        case .rating(_, let title, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return title
        case .textInput(_, let title, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return title
        case .datePicker(_, let title, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return title
        case .picker(_, let title, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return title
        case .primaryAction(_, let title, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return title
        }
    }

    public var slideType: String {
        switch self {
        case .regular:
            return "regular"
        case .multipleChoice:
            return "multipleChoice"
        case .yesNo:
            return "yesNo"
        case .rating:
            return "rating"
        case .textInput:
            return "textInput"
        case .datePicker:
            return "datePicker"
        case .picker:
            return "picker"
        case .primaryAction:
            return "primaryAction"
        }
    }
}
