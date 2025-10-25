//
//  AnyOnboardingSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

struct AnyOnboardingSlideView: View {

    let slideType: OnbSlideType
    let slideDefaults: OnbSlideDefaults
    var selectedOptions: [OnbChoiceOption]
    var handleSelection: ((OnbChoiceOption, OnbSelectionBehavior) -> Void)? = nil
    var onButtonClick: (([OnbChoiceOption]) -> Void)? = nil

    var body: some View {
        switch slideType {
        case .regular(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let media, let mediaPosition, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, _, _, _):
            RegularSlideView(
                title: title,
                titleFont: titleFont ?? slideDefaults.titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont ?? slideDefaults.subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing ?? slideDefaults.titleSubtitleSpacing,
                titleAlignment: titleAlignment ?? slideDefaults.titleAlignment,
                media: media,
                mediaPosition: mediaPosition ?? slideDefaults.mediaPosition,
                contentAlignment: contentAlignment ?? slideDefaults.contentAlignment,
                paddingTop: paddingTop ?? slideDefaults.paddingTop,
                paddingBottom: paddingBottom ?? slideDefaults.paddingBottom,
                horizontalPaddingContent: horizontalPaddingContent ?? slideDefaults.horizontalPaddingContent,
                horizontalPaddingTitle: horizontalPaddingTitle ?? slideDefaults.horizontalPaddingTitle,
                contentSpacing: contentSpacing ?? slideDefaults.contentSpacing,
                footerData: footerData ?? slideDefaults.footerData,
                ctaText: ctaText ?? slideDefaults.ctaText,
                ctaButtonStyle: ctaButtonStyle ?? slideDefaults.ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData ?? slideDefaults.ctaButtonFormatData,
                onButtonClick: {
                    onButtonClick?([])
                }
            )
        case .multipleChoice(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let options, let optionsSpacing, let optionsButtonStyle, let optionsButtonFormatData, let selectionBehavior, let isGrid, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, let feedbackStyle, _, _, _):
            MultipleChoiceSlideView(
                title: title,
                titleFont: titleFont ?? slideDefaults.titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont ?? slideDefaults.subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing ?? slideDefaults.titleSubtitleSpacing,
                titleAlignment: titleAlignment ?? slideDefaults.titleAlignment,
                options: options,
                optionsSpacing: optionsSpacing ?? slideDefaults.optionsSpacing,
                optionsButtonStyle: optionsButtonStyle ?? slideDefaults.optionsButtonStyle,
                optionsButtonFormatData: optionsButtonFormatData ?? slideDefaults.optionsButtonFormatData,
                selectionBehavior: selectionBehavior ?? slideDefaults.selectionBehavior,
                isGrid: isGrid ?? slideDefaults.isGrid,
                contentAlignment: contentAlignment ?? slideDefaults.contentAlignment,
                paddingTop: paddingTop ?? slideDefaults.paddingTop,
                paddingBottom: paddingBottom ?? slideDefaults.paddingBottom,
                horizontalPaddingContent: horizontalPaddingContent ?? slideDefaults.horizontalPaddingContent,
                horizontalPaddingTitle: horizontalPaddingTitle ?? slideDefaults.horizontalPaddingTitle,
                contentSpacing: contentSpacing ?? slideDefaults.contentSpacing,
                footerData: footerData ?? slideDefaults.footerData,
                ctaText: ctaText ?? slideDefaults.ctaText,
                ctaButtonStyle: ctaButtonStyle ?? slideDefaults.ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData ?? slideDefaults.ctaButtonFormatData,
                handleSelection: handleSelection,
                onButtonClick: { selections in
                    onButtonClick?(selections)
                },
                selectedOptions: selectedOptions,
                feedbackStyle: feedbackStyle ?? slideDefaults.feedbackStyle,
                feedbackConfigurationDefaults: slideDefaults.feedbackConfiguration
            )
        case .yesNo(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let media, let mediaPosition, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let optionsSpacing, let yesOption, let noOption, let optionsButtonStyle, let optionsButtonFormatData, let selectionBehavior, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, let feedbackStyle, _, _, _):
            YesNoSlideView(
                title: title,
                titleFont: titleFont ?? slideDefaults.titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont ?? slideDefaults.subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing ?? slideDefaults.titleSubtitleSpacing,
                titleAlignment: titleAlignment ?? slideDefaults.titleAlignment,
                media: media,
                mediaPosition: mediaPosition ?? slideDefaults.mediaPosition,
                contentAlignment: contentAlignment ?? slideDefaults.contentAlignment,
                paddingTop: paddingTop ?? slideDefaults.paddingTop,
                paddingBottom: paddingBottom ?? slideDefaults.paddingBottom,
                horizontalPaddingContent: horizontalPaddingContent ?? slideDefaults.horizontalPaddingContent,
                horizontalPaddingTitle: horizontalPaddingTitle ?? slideDefaults.horizontalPaddingTitle,
                contentSpacing: contentSpacing ?? slideDefaults.contentSpacing,
                optionsSpacing: optionsSpacing ?? slideDefaults.optionsSpacing,
                yesOption: yesOption,
                noOption: noOption,
                optionsButtonStyle: optionsButtonStyle ?? slideDefaults.optionsButtonStyle,
                optionsButtonFormatData: optionsButtonFormatData ?? slideDefaults.optionsButtonFormatData,
                selectionBehavior: selectionBehavior ?? slideDefaults.selectionBehavior,
                footerData: footerData ?? slideDefaults.footerData,
                ctaText: ctaText ?? slideDefaults.ctaText,
                ctaButtonStyle: ctaButtonStyle ?? slideDefaults.ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData ?? slideDefaults.ctaButtonFormatData,
                handleSelection: handleSelection,
                onButtonClick: { selections in
                    onButtonClick?(selections)
                },
                selectedOptions: selectedOptions,
                feedbackStyle: feedbackStyle ?? slideDefaults.feedbackStyle,
                feedbackConfigurationDefaults: slideDefaults.feedbackConfiguration
            )
        case .rating(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let media, let mediaPosition, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let optionsButtonStyle, let ratingCornerRadius, let ratingButtonOption, let ratingFont, let ratingLabels, let selectionBehavior, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, let getResponseConfiguration, let getFeedbackConfiguration, let getInsertConfiguration, let feedbackStyle, _, _, _):
            RatingSlideView(
                title: title,
                titleFont: titleFont ?? slideDefaults.titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont ?? slideDefaults.subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing ?? slideDefaults.titleSubtitleSpacing,
                titleAlignment: titleAlignment ?? slideDefaults.titleAlignment,
                media: media,
                mediaPosition: mediaPosition ?? slideDefaults.mediaPosition,
                contentAlignment: contentAlignment ?? slideDefaults.contentAlignment,
                paddingTop: paddingTop ?? slideDefaults.paddingTop,
                paddingBottom: paddingBottom ?? slideDefaults.paddingBottom,
                horizontalPaddingContent: horizontalPaddingContent ?? slideDefaults.horizontalPaddingContent,
                horizontalPaddingTitle: horizontalPaddingTitle ?? slideDefaults.horizontalPaddingTitle,
                contentSpacing: contentSpacing ?? slideDefaults.contentSpacing,
                optionsButtonStyle: optionsButtonStyle ?? slideDefaults.optionsButtonStyle,
                ratingCornerRadius: ratingCornerRadius,
                ratingButtonOption: ratingButtonOption,
                ratingFont: ratingFont,
                ratingLabels: ratingLabels,
                selectionBehavior: selectionBehavior ?? slideDefaults.selectionBehavior,
                footerData: footerData ?? slideDefaults.footerData,
                ctaText: ctaText ?? slideDefaults.ctaText,
                ctaButtonStyle: ctaButtonStyle ?? slideDefaults.ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData ?? slideDefaults.ctaButtonFormatData,
                handleSelection: handleSelection,
                onButtonClick: { selections in
                    onButtonClick?(selections)
                },
                selectedOptions: selectedOptions,
                getResponseConfiguration: getResponseConfiguration,
                getFeedbackConfiguration: getFeedbackConfiguration,
                getInsertConfiguration: getInsertConfiguration,
                feedbackStyle: feedbackStyle ?? slideDefaults.feedbackStyle,
                feedbackConfigurationDefaults: slideDefaults.feedbackConfiguration
            )
        case .textInput(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingTitle, let contentSpacing, let textFieldKeyboardType, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, _, _, _):
            TextInputSlideView(
                title: title,
                titleFont: titleFont ?? slideDefaults.titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont ?? slideDefaults.subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing ?? slideDefaults.titleSubtitleSpacing,
                titleAlignment: titleAlignment ?? slideDefaults.titleAlignment,
                contentAlignment: contentAlignment ?? slideDefaults.contentAlignment,
                paddingTop: paddingTop ?? slideDefaults.paddingTop,
                paddingBottom: paddingBottom ?? slideDefaults.paddingBottom,
                horizontalPaddingTitle: horizontalPaddingTitle ?? slideDefaults.horizontalPaddingTitle,
                contentSpacing: contentSpacing ?? slideDefaults.contentSpacing,
                textFieldKeyboardType: textFieldKeyboardType,
                footerData: footerData ?? slideDefaults.footerData,
                ctaText: ctaText ?? slideDefaults.ctaText,
                ctaButtonStyle: ctaButtonStyle ?? slideDefaults.ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData ?? slideDefaults.ctaButtonFormatData,
                onButtonClick: { selections in
                    onButtonClick?(selections)
                },
                selectedOptions: selectedOptions
            )
        case .datePicker(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingTitle, let contentSpacing, let datePickerPosition, let datePickerStyle, let datePickerComponents, let datePickerStartDate, let datePickerMinimumDate, let datePickerMaximumDate, let horizontalPaddingContent, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, _, _, _):
            DatePickerSlideView(
                title: title,
                titleFont: titleFont ?? slideDefaults.titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont ?? slideDefaults.subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing ?? slideDefaults.titleSubtitleSpacing,
                titleAlignment: titleAlignment ?? slideDefaults.titleAlignment,
                contentAlignment: contentAlignment ?? slideDefaults.contentAlignment,
                paddingTop: paddingTop ?? slideDefaults.paddingTop,
                paddingBottom: paddingBottom ?? slideDefaults.paddingBottom,
                horizontalPaddingTitle: horizontalPaddingTitle ?? slideDefaults.horizontalPaddingTitle,
                contentSpacing: contentSpacing ?? slideDefaults.contentSpacing,
                datePickerPosition: datePickerPosition,
                datePickerStyle: datePickerStyle,
                datePickerComponents: datePickerComponents,
                datePickerStartDate: datePickerStartDate,
                datePickerMinimumDate: datePickerMinimumDate,
                datePickerMaximumDate: datePickerMaximumDate,
                horizontalPaddingContent: horizontalPaddingContent ?? slideDefaults.horizontalPaddingContent,
                footerData: footerData ?? slideDefaults.footerData,
                ctaText: ctaText ?? slideDefaults.ctaText,
                ctaButtonStyle: ctaButtonStyle ?? slideDefaults.ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData ?? slideDefaults.ctaButtonFormatData,
                onButtonClick: { selections in
                    onButtonClick?(selections)
                },
                selectedOptions: selectedOptions
            )
        case .picker(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingTitle, let contentSpacing, let pickerPosition, let pickerStyle, let pickerOptions, let horizontalPaddingContent, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, _, _, _):
            AnyPickerSlideView(
                title: title,
                titleFont: titleFont ?? slideDefaults.titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont ?? slideDefaults.subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing ?? slideDefaults.titleSubtitleSpacing,
                titleAlignment: titleAlignment ?? slideDefaults.titleAlignment,
                contentAlignment: contentAlignment ?? slideDefaults.contentAlignment,
                paddingTop: paddingTop ?? slideDefaults.paddingTop,
                paddingBottom: paddingBottom ?? slideDefaults.paddingBottom,
                horizontalPaddingTitle: horizontalPaddingTitle ?? slideDefaults.horizontalPaddingTitle,
                contentSpacing: contentSpacing ?? slideDefaults.contentSpacing,
                pickerPosition: pickerPosition,
                pickerStyle: pickerStyle,
                pickerOptions: pickerOptions,
                horizontalPaddingContent: horizontalPaddingContent ?? slideDefaults.horizontalPaddingContent,
                footerData: footerData ?? slideDefaults.footerData,
                ctaText: ctaText ?? slideDefaults.ctaText,
                ctaButtonStyle: ctaButtonStyle ?? slideDefaults.ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData ?? slideDefaults.ctaButtonFormatData,
                onButtonClick: { selections in
                    onButtonClick?(selections)
                },
                selectedOptions: selectedOptions
            )
        case .primaryAction(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let media, let mediaPosition, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, let secondaryButtonText, let secondaryButtonStyle, let secondaryButtonFormatData, let secondaryButtonSpacing, let onDidPressPrimaryButton, _, _, _):
            PrimaryActionSlideView(
                title: title,
                titleFont: titleFont ?? slideDefaults.titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont ?? slideDefaults.subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing ?? slideDefaults.titleSubtitleSpacing,
                titleAlignment: titleAlignment ?? slideDefaults.titleAlignment,
                media: media,
                mediaPosition: mediaPosition ?? slideDefaults.mediaPosition,
                contentAlignment: contentAlignment ?? slideDefaults.contentAlignment,
                paddingTop: paddingTop ?? slideDefaults.paddingTop,
                paddingBottom: paddingBottom ?? slideDefaults.paddingBottom,
                horizontalPaddingContent: horizontalPaddingContent ?? slideDefaults.horizontalPaddingContent,
                horizontalPaddingTitle: horizontalPaddingTitle ?? slideDefaults.horizontalPaddingTitle,
                contentSpacing: contentSpacing ?? slideDefaults.contentSpacing,
                footerData: footerData ?? slideDefaults.footerData,
                ctaText: ctaText ?? slideDefaults.ctaText,
                ctaButtonStyle: ctaButtonStyle ?? slideDefaults.ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData ?? slideDefaults.ctaButtonFormatData,
                secondaryButtonText: secondaryButtonText,
                secondaryButtonStyle: secondaryButtonStyle ?? slideDefaults.secondaryButtonStyle,
                secondaryButtonFormatData: secondaryButtonFormatData ?? slideDefaults.secondaryButtonFormatData,
                secondaryButtonSpacing: secondaryButtonSpacing ?? slideDefaults.secondaryButtonSpacing,
                onDidPressPrimaryButton: onDidPressPrimaryButton,
                onButtonClick: {
                    onButtonClick?([])
                }
            )
        }
    }
}

#Preview {
    SwiftfulOnboardingView(
        configuration: OnbConfiguration(
            headerConfiguration: OnbHeaderConfiguration(
                headerStyle: .progressBar,
                headerAlignment: .center,
                showBackButton: .afterFirstSlide
            ),
            slides: [
                .regular(
                    id: "welcome",
                    title: "Welcome",
                    subtitle: "Get started with our app",
                    media: .systemIcon(named: "star.fill")
                ),
                .multipleChoice(
                    id: "choice",
                    title: "Pick your favorites",
                    options: [
                        OnbChoiceOption(id: "1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "2", content: OnbButtonContentData(text: "Option 2"))
                    ]
                )
            ],
            slideDefaults: .default
        )
    )
}
