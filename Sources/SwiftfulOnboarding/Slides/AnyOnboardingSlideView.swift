//
//  AnyOnboardingSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

struct AnyOnboardingSlideView: View {

    let slideType: OnbSlideType
    var selectedOptions: [OnbChoiceOption]
    var handleSelection: ((OnbChoiceOption, OnbSelectionBehavior) -> Void)? = nil
    var onButtonClick: (([OnbChoiceOption]) -> Void)? = nil

    var body: some View {
        switch slideType {
        case .regular(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let media, let mediaPosition, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, _, _, _):
            RegularSlideView(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing,
                titleAlignment: titleAlignment,
                media: media,
                mediaPosition: mediaPosition,
                contentAlignment: contentAlignment,
                paddingTop: paddingTop,
                paddingBottom: paddingBottom,
                horizontalPaddingContent: horizontalPaddingContent,
                horizontalPaddingTitle: horizontalPaddingTitle,
                contentSpacing: contentSpacing,
                footerData: footerData,
                ctaText: ctaText,
                ctaButtonStyle: ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData,
                onButtonClick: {
                    onButtonClick?([])
                }
            )
        case .multipleChoice(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let options, let optionsSpacing, let optionsButtonStyle, let optionsButtonFormatData, let selectionBehavior, let isGrid, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, let feedbackStyle, _, _, _):
            MultipleChoiceSlideView(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing,
                titleAlignment: titleAlignment,
                options: options,
                optionsSpacing: optionsSpacing,
                optionsButtonStyle: optionsButtonStyle,
                optionsButtonFormatData: optionsButtonFormatData,
                selectionBehavior: selectionBehavior,
                isGrid: isGrid,
                contentAlignment: contentAlignment,
                paddingTop: paddingTop,
                paddingBottom: paddingBottom,
                horizontalPaddingContent: horizontalPaddingContent,
                horizontalPaddingTitle: horizontalPaddingTitle,
                contentSpacing: contentSpacing,
                footerData: footerData,
                ctaText: ctaText,
                ctaButtonStyle: ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData,
                handleSelection: handleSelection,
                onButtonClick: { selections in
                    onButtonClick?(selections)
                },
                selectedOptions: selectedOptions,
                feedbackStyle: feedbackStyle
            )
        case .yesNo(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let media, let mediaPosition, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let yesNoSpacing, let yesOption, let noOption, let yesNoButtonStyle, let yesNoButtonFormatData, let selectionBehavior, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, let feedbackStyle, _, _, _):
            YesNoSlideView(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing,
                titleAlignment: titleAlignment,
                media: media,
                mediaPosition: mediaPosition,
                contentAlignment: contentAlignment,
                paddingTop: paddingTop,
                paddingBottom: paddingBottom,
                horizontalPaddingContent: horizontalPaddingContent,
                horizontalPaddingTitle: horizontalPaddingTitle,
                contentSpacing: contentSpacing,
                yesNoSpacing: yesNoSpacing,
                yesOption: yesOption,
                noOption: noOption,
                yesNoButtonStyle: yesNoButtonStyle,
                yesNoButtonFormatData: yesNoButtonFormatData,
                selectionBehavior: selectionBehavior,
                footerData: footerData,
                ctaText: ctaText,
                ctaButtonStyle: ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData,
                handleSelection: handleSelection,
                onButtonClick: { selections in
                    onButtonClick?(selections)
                },
                selectedOptions: selectedOptions,
                feedbackStyle: feedbackStyle
            )
        case .rating(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let media, let mediaPosition, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let ratingButtonStyle, let ratingCornerRadius, let ratingButtonOption, let ratingFont, let ratingLabels, let selectionBehavior, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, let getResponseConfiguration, let getFeedbackConfiguration, let getInsertConfiguration, let feedbackStyle, _, _, _):
            RatingSlideView(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing,
                titleAlignment: titleAlignment,
                media: media,
                mediaPosition: mediaPosition,
                contentAlignment: contentAlignment,
                paddingTop: paddingTop,
                paddingBottom: paddingBottom,
                horizontalPaddingContent: horizontalPaddingContent,
                horizontalPaddingTitle: horizontalPaddingTitle,
                contentSpacing: contentSpacing,
                ratingButtonStyle: ratingButtonStyle,
                ratingCornerRadius: ratingCornerRadius,
                ratingButtonOption: ratingButtonOption,
                ratingFont: ratingFont,
                ratingLabels: ratingLabels,
                selectionBehavior: selectionBehavior,
                footerData: footerData,
                ctaText: ctaText,
                ctaButtonStyle: ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData,
                handleSelection: handleSelection,
                onButtonClick: { selections in
                    onButtonClick?(selections)
                },
                selectedOptions: selectedOptions,
                getResponseConfiguration: getResponseConfiguration,
                getFeedbackConfiguration: getFeedbackConfiguration,
                getInsertConfiguration: getInsertConfiguration,
                feedbackStyle: feedbackStyle
            )
        case .textInput(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingTitle, let contentSpacing, let textFieldKeyboardType, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, _, _, _):
            TextInputSlideView(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing,
                titleAlignment: titleAlignment,
                contentAlignment: contentAlignment,
                paddingTop: paddingTop,
                paddingBottom: paddingBottom,
                horizontalPaddingTitle: horizontalPaddingTitle,
                contentSpacing: contentSpacing,
                textFieldKeyboardType: textFieldKeyboardType,
                footerData: footerData,
                ctaText: ctaText,
                ctaButtonStyle: ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData,
                onButtonClick: { selections in
                    onButtonClick?(selections)
                },
                selectedOptions: selectedOptions
            )
        case .datePicker(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingTitle, let contentSpacing, let datePickerPosition, let datePickerStyle, let datePickerComponents, let datePickerStartDate, let datePickerMinimumDate, let datePickerMaximumDate, let datePickerHorizontalPadding, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, _, _, _):
            DatePickerSlideView(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing,
                titleAlignment: titleAlignment,
                contentAlignment: contentAlignment,
                paddingTop: paddingTop,
                paddingBottom: paddingBottom,
                horizontalPaddingTitle: horizontalPaddingTitle,
                contentSpacing: contentSpacing,
                datePickerPosition: datePickerPosition,
                datePickerStyle: datePickerStyle,
                datePickerComponents: datePickerComponents,
                datePickerStartDate: datePickerStartDate,
                datePickerMinimumDate: datePickerMinimumDate,
                datePickerMaximumDate: datePickerMaximumDate,
                datePickerHorizontalPadding: datePickerHorizontalPadding,
                footerData: footerData,
                ctaText: ctaText,
                ctaButtonStyle: ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData,
                onButtonClick: { selections in
                    onButtonClick?(selections)
                },
                selectedOptions: selectedOptions
            )
        case .picker(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingTitle, let contentSpacing, let pickerPosition, let pickerStyle, let pickerOptions, let pickerHorizontalPadding, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, _, _, _):
            AnyPickerSlideView(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing,
                titleAlignment: titleAlignment,
                contentAlignment: contentAlignment,
                paddingTop: paddingTop,
                paddingBottom: paddingBottom,
                horizontalPaddingTitle: horizontalPaddingTitle,
                contentSpacing: contentSpacing,
                pickerPosition: pickerPosition,
                pickerStyle: pickerStyle,
                pickerOptions: pickerOptions,
                pickerHorizontalPadding: pickerHorizontalPadding,
                footerData: footerData,
                ctaText: ctaText,
                ctaButtonStyle: ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData,
                onButtonClick: { selections in
                    onButtonClick?(selections)
                },
                selectedOptions: selectedOptions
            )
        case .primaryAction(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let media, let mediaPosition, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, let secondaryButtonText, let secondaryButtonStyle, let secondaryButtonFormatData, let secondaryButtonSpacing, let onDidPressPrimaryButton, _, _, _):
            PrimaryActionSlideView(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                titleSubtitleSpacing: titleSubtitleSpacing,
                titleAlignment: titleAlignment,
                media: media,
                mediaPosition: mediaPosition,
                contentAlignment: contentAlignment,
                paddingTop: paddingTop,
                paddingBottom: paddingBottom,
                horizontalPaddingContent: horizontalPaddingContent,
                horizontalPaddingTitle: horizontalPaddingTitle,
                contentSpacing: contentSpacing,
                footerData: footerData,
                ctaText: ctaText,
                ctaButtonStyle: ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData,
                secondaryButtonText: secondaryButtonText,
                secondaryButtonStyle: secondaryButtonStyle,
                secondaryButtonFormatData: secondaryButtonFormatData,
                secondaryButtonSpacing: secondaryButtonSpacing,
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
            ]
        )
    )
}
