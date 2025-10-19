//
//  AnyOnboardingSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

struct AnyOnboardingSlideView: View {

    let slideType: OnbSlideType
    var onButtonClick: (() -> Void)? = nil

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
                onButtonClick: onButtonClick
            )
        case .multipleChoice(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let options, let optionsSpacing, let optionsButtonStyle, let optionsButtonFormatData, let selectionBehavior, let isGrid, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, _, _, _):
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
                onButtonClick: onButtonClick
            )
        case .yesNo(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let media, let mediaPosition, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let yesNoSpacing, let yesText, let noText, let yesNoButtonStyle, let yesNoButtonFormatData, let selectionBehavior, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, _, _, _):
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
                yesText: yesText,
                noText: noText,
                yesNoButtonStyle: yesNoButtonStyle,
                yesNoButtonFormatData: yesNoButtonFormatData,
                selectionBehavior: selectionBehavior,
                footerData: footerData,
                ctaText: ctaText,
                ctaButtonStyle: ctaButtonStyle,
                ctaButtonFormatData: ctaButtonFormatData,
                onButtonClick: onButtonClick
            )
        case .rating(_, let title, let titleFont, let subtitle, let subtitleFont, let titleSubtitleSpacing, let titleAlignment, let media, let mediaPosition, let contentAlignment, let paddingTop, let paddingBottom, let horizontalPaddingContent, let horizontalPaddingTitle, let contentSpacing, let ratingButtonStyle, let ratingCornerRadius, let ratingButtonOption, let ratingFont, let ratingLabels, let selectionBehavior, let footerData, let ctaText, let ctaButtonStyle, let ctaButtonFormatData, _, _, _):
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
                onButtonClick: onButtonClick
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
                onButtonClick: onButtonClick
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
                onButtonClick: onButtonClick
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
                onButtonClick: onButtonClick
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
                onButtonClick: onButtonClick
            )
        }
    }
}

#Preview {
    VStack(spacing: 24) {
        AnyOnboardingSlideView(
            slideType: .regular(
                id: "welcome",
                title: "Welcome",
                subtitle: "Get started with our app",
                media: .systemIcon(named: "star.fill")
            )
        )

        AnyOnboardingSlideView(
            slideType: .regular(
                id: "features",
                title: "Features",
                subtitle: nil,
                media: nil
            )
        )

        AnyOnboardingSlideView(
            slideType: .regular(
                id: "video-demo",
                title: "Video Demo",
                subtitle: "Watch our intro",
                media: .video(urlString: "https://example.com/intro.mp4")
            )
        )
    }
}