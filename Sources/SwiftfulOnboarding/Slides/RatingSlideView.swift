//
//  RatingSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

struct RatingSlideView: View {

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
    var horizontalPaddingContent: CGFloat = 24
    var horizontalPaddingTitle: CGFloat = 40
    var contentSpacing: CGFloat = 24
    var optionsButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var ratingCornerRadius: CGFloat = 32
    var ratingButtonOption: OnbRatingButtonOption = .thumbs
    var ratingFont: Font = .title.weight(.medium)
    var ratingLabels: RatingFooterLabels? = nil
    var selectionBehavior: OnbSelectionBehavior = .single()
    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var ctaButtonFormatData: OnbButtonFormatData = .default
    var handleSelection: (@MainActor (OnbChoiceOption, OnbSelectionBehavior) -> Void)? = nil
    var onButtonClick: (@MainActor ([OnbChoiceOption]) -> Void)? = nil
    var selectedOptions: [OnbChoiceOption] = []
    var getResponseConfiguration: (@MainActor (Int) -> OnbResponseConfiguration?)? = nil
    var getFeedbackConfiguration: (@MainActor (Int) -> OnbFeedbackConfiguration?)? = nil
    var getInsertConfiguration: (@MainActor (Int) -> [InsertSlideData]?)? = nil
    var feedbackStyle: AnyFeedbackViewStyle = .top()
    var feedbackConfigurationDefaults: OnbFeedbackConfiguration = OnbFeedbackConfiguration()

    private var selectedRating: Int? {
        guard let option = selectedOptions.first,
              let rating = Int(option.id) else {
            return nil
        }
        return rating
    }

    private func ratingToOption(_ rating: Int) -> OnbChoiceOption {
        OnbChoiceOption(
            id: "\(rating)",
            content: OnbButtonContentData(text: "\(rating)", value: rating),
            responseConfiguration: getResponseConfiguration?(rating),
            feedbackConfiguration: getFeedbackConfiguration?(rating),
            insertConfiguration: getInsertConfiguration?(rating)
        )
    }

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

    private var anyRatingHasFeedback: Bool {
        guard let getFeedback = getFeedbackConfiguration else { return false }
        return (1...5).contains(where: { getFeedback($0) != nil })
    }

    var body: some View {
        VStack(spacing: 0) {
            // Top feedback
            if anyRatingHasFeedback, case .top = feedbackStyle,
               let feedbackConfig = currentFeedback ?? (1...5).compactMap({ getFeedbackConfiguration?($0) }).first {
                AnyFeedbackViewContainer(config: feedbackConfig, defaultConfig: feedbackConfigurationDefaults, style: feedbackStyle)
                    .padding(.horizontal, horizontalPaddingContent)
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

            // Bottom feedback (above rating buttons)
            if anyRatingHasFeedback, case .bottom = feedbackStyle,
               let feedbackConfig = currentFeedback ?? (1...5).compactMap({ getFeedbackConfiguration?($0) }).first {
                AnyFeedbackViewContainer(config: feedbackConfig, defaultConfig: feedbackConfigurationDefaults, style: feedbackStyle)
                    .padding(.horizontal, horizontalPaddingContent)
                    .opacity(currentFeedback != nil ? 1.0 : 0.0)
                    .padding(.top, contentSpacing)
                    .padding(.bottom, shouldShowContinueButton ? 0 : footerData.bottom + footerData.top)
            }

            // Rating buttons
            RatingFooterButton(
                buttonStyle: optionsButtonStyle,
                cornerRadius: ratingCornerRadius,
                buttonOption: ratingButtonOption,
                font: ratingFont,
                labels: ratingLabels,
                selectedRating: selectedRating,
                onTap: { rating in
                    let option = ratingToOption(rating)
                    handleSelection?(option, selectionBehavior)

                    switch selectionBehavior {
                    case .single(let autoAdvance):
                        if autoAdvance {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                onButtonClick?(selectedOptions)
                            }
                        }
                    case .multi:
                        break
                    }
                }
            )
            .padding(.horizontal, horizontalPaddingContent)
            .padding(.top, contentSpacing)
            .padding(.bottom, shouldShowContinueButton || (anyRatingHasFeedback && feedbackStyle == .bottom()) ? 0 : footerData.bottom + footerData.top)

            // Continue button at bottom
            if shouldShowContinueButton {
                Text(ctaText)
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
                .rating(
                    id: "slide1",
                    title: "Rate Your Experience",
                    subtitle: "How would you rate our app?",
                    media: .systemIcon(named: "star.fill", size: .large),
                    mediaPosition: .top,
                    selectionBehavior: .single(autoAdvance: true)
                ),
                .rating(
                    id: "slide2",
                    title: "Food Quality",
                    subtitle: "How was the quality of your meal?",
                    media: .systemIcon(named: "fork.knife", size: .large),
                    mediaPosition: .top,
                    selectionBehavior: .single(autoAdvance: true)
                ),
                .rating(
                    id: "slide3",
                    title: "Customer Service",
                    subtitle: "How satisfied are you with our service?",
                    media: .systemIcon(named: "person.fill", size: .large),
                    mediaPosition: .top
                ),
                .rating(
                    id: "feedback_top",
                    title: "Top Feedback Example",
                    subtitle: "Select a rating to see feedback at top",
                    getFeedbackConfiguration: { rating in
                        if rating >= 4 {
                            return OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.8, green: 0.95, blue: 0.8),
                                borderWidth: 2,
                                borderColor: Color(red: 0.2, green: 0.6, blue: 0.2),
                                title: "Thanks!",
                                titleFont: .headline,
                                subtitle: "You rated \(rating) stars",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        } else {
                            return OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.95, green: 0.8, blue: 0.8),
                                borderWidth: 2,
                                borderColor: Color(red: 0.8, green: 0.2, blue: 0.2),
                                title: "We can improve",
                                titleFont: .headline,
                                subtitle: "You rated \(rating) stars",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        }
                    },
                    feedbackStyle: .top()
                ),
                .rating(
                    id: "feedback_bottom",
                    title: "Bottom Feedback Example",
                    subtitle: "Select a rating to see feedback at bottom",
                    getFeedbackConfiguration: { rating in
                        if rating == 5 {
                            return OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.8, green: 0.9, blue: 0.95),
                                borderWidth: 2,
                                borderColor: Color(red: 0.2, green: 0.4, blue: 0.8),
                                title: "Perfect score!",
                                titleFont: .headline,
                                subtitle: "You gave us 5 stars",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        } else {
                            return OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.95, green: 0.9, blue: 0.8),
                                borderWidth: 2,
                                borderColor: Color(red: 0.8, green: 0.5, blue: 0.2),
                                title: "Thanks for rating!",
                                titleFont: .headline,
                                subtitle: "You selected \(rating) stars",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        }
                    },
                    feedbackStyle: .bottom()
                )
            ]
        )
    )
}
