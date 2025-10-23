//
//  YesNoSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

struct YesNoSlideView: View {

    var title: String? = nil
    var titleFont: Font = .largeTitle
    var subtitle: String? = nil
    var subtitleFont: Font = .body
    var titleSubtitleSpacing: CGFloat = 8
    var titleAlignment: OnbTextAlignment = .center
    var media: OnbMediaType? = nil
    var mediaPosition: OnbMediaPosition = .top
    var contentAlignment: OnbContentAlignment = .center
    var paddingTop: CGFloat = 40
    var paddingBottom: CGFloat = 0
    var horizontalPaddingContent: CGFloat = 0
    var horizontalPaddingTitle: CGFloat = 40
    var contentSpacing: CGFloat = 24
    var yesNoSpacing: CGFloat = 12
    var yesOption: OnbChoiceOption = OnbChoiceOption(id: "yes", content: OnbButtonContentData(text: "Yes"))
    var noOption: OnbChoiceOption = OnbChoiceOption(id: "no", content: OnbButtonContentData(text: "No"))
    var yesNoButtonStyle: OnbButtonStyleType = .solidOutline(backgroundColor: .clear, textColor: .blue, borderColor: .blue, selectedBackgroundColor: .blue, selectedTextColor: .white, selectedBorderColor: .blue)
    var yesNoButtonFormatData: OnbButtonFormatData = .default
    var selectionBehavior: OnbSelectionBehavior = .single()
    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .gray, textColor: .white, selectedBackgroundColor: .blue, selectedTextColor: .white)
    var ctaButtonFormatData: OnbButtonFormatData = .default
    var handleSelection: ((OnbChoiceOption, OnbSelectionBehavior) -> Void)? = nil
    var onButtonClick: (([OnbChoiceOption]) -> Void)? = nil
    var selectedOptions: [OnbChoiceOption] = []
    var feedbackStyle: AnyFeedbackViewStyle = .top()

    private var shouldShowContinueButton: Bool {
        switch selectionBehavior {
        case .single(let autoAdvance):
            return !autoAdvance
        case .multi:
            return true
        }
    }

    private var currentFeedback: OnbFeedbackConfiguration? {
        selectedOptions.last(where: { $0.feedbackConfiguration != nil })?.feedbackConfiguration
    }

    private var anyOptionHasFeedback: Bool {
        [yesOption, noOption].contains(where: { $0.feedbackConfiguration != nil })
    }

    var body: some View {
        VStack(spacing: 0) {
            // Top feedback
            if anyOptionHasFeedback, case .top = feedbackStyle,
               let feedbackConfig = currentFeedback ?? [yesOption, noOption].first(where: { $0.feedbackConfiguration != nil })?.feedbackConfiguration {
                AnyFeedbackViewContainer(config: feedbackConfig, style: feedbackStyle)
                    .padding(.horizontal, horizontalPaddingContent > 0 ? horizontalPaddingContent : 24)
                    .opacity(currentFeedback != nil ? 1.0 : 0.0)
            }

            // Content
            AnyRegularContentView(
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
                contentSpacing: contentSpacing
            )

            // Yes/No buttons
            HStack(spacing: yesNoSpacing) {
                OnbButtonContent(
                    data: noOption.content
                )
                .onbButtonStyle(
                    style: yesNoButtonStyle,
                    isSelected: selectedOptions.contains(noOption),
                    format: yesNoButtonFormatData
                ) {
                    toggleSelection(for: noOption)
                }

                OnbButtonContent(
                    data: yesOption.content
                )
                .onbButtonStyle(
                    style: yesNoButtonStyle,
                    isSelected: selectedOptions.contains(yesOption),
                    format: yesNoButtonFormatData
                ) {
                    toggleSelection(for: yesOption)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)

            // Bottom feedback
            if anyOptionHasFeedback, case .bottom = feedbackStyle,
               let feedbackConfig = currentFeedback ?? [yesOption, noOption].first(where: { $0.feedbackConfiguration != nil })?.feedbackConfiguration {
                AnyFeedbackViewContainer(config: feedbackConfig, style: feedbackStyle)
                    .padding(.horizontal, horizontalPaddingContent > 0 ? horizontalPaddingContent : 24)
                    .opacity(currentFeedback != nil ? 1.0 : 0.0)
            }

            // Continue button at bottom
            if shouldShowContinueButton {
                OnbButtonContent(
                    data: OnbButtonContentData(text: ctaText)
                )
                .onbButtonStyle(
                    style: ctaButtonStyle,
                    isSelected: !selectedOptions.isEmpty,
                    format: ctaButtonFormatData
                ) {
                    onButtonClick?(selectedOptions)
                }
                .disabled(selectedOptions.isEmpty)
                .padding(.top, footerData.top)
                .padding(.leading, footerData.leading)
                .padding(.trailing, footerData.trailing)
                .padding(.bottom, footerData.bottom)
            }
        }
    }

    private func toggleSelection(for option: OnbChoiceOption) {
        handleSelection?(option, selectionBehavior)

        switch selectionBehavior {
        case .single(let autoAdvance):
            if autoAdvance && selectedOptions.contains(option) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    onButtonClick?(selectedOptions)
                }
            }
        case .multi:
            break
        }
    }
}

#Preview {
    SwiftfulOnboardingView(
        configuration: OnbConfiguration(
            headerStyle: .progressBar,
            headerAlignment: .center,
            showBackButton: .afterFirstSlide,
            slides: [
                .yesNo(
                    id: "slide1",
                    title: "Enable Notifications?",
                    subtitle: "Stay up to date with the latest updates",
                    media: .systemIcon(named: "bell.fill", size: .large),
                    mediaPosition: .top,
                    selectionBehavior: .single(autoAdvance: true)
                ),
                .yesNo(
                    id: "slide2",
                    title: "Share Your Location?",
                    subtitle: "Help us provide better recommendations",
                    media: .systemIcon(named: "location.fill", size: .large),
                    mediaPosition: .top,
                    selectionBehavior: .single(autoAdvance: true)
                ),
                .yesNo(
                    id: "slide3",
                    title: "Join Our Community?",
                    subtitle: "Connect with other users",
                    media: .systemIcon(named: "person.3.fill", size: .large),
                    mediaPosition: .top,
                    selectionBehavior: .single()
                )
            ]
        )
    )
}
