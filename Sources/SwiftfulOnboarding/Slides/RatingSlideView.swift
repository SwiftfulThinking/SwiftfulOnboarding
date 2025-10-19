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
    var horizontalPaddingContent: CGFloat = 0
    var horizontalPaddingTitle: CGFloat = 40
    var contentSpacing: CGFloat = 24
    var ratingButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var ratingCornerRadius: CGFloat = 32
    var ratingButtonOption: OnbRatingButtonOption = .thumbs
    var ratingFont: Font = .title.weight(.medium)
    var ratingLabels: RatingFooterLabels? = nil
    var selectionBehavior: OnbSelectionBehavior = .single()
    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var ctaButtonFormatData: OnbButtonFormatData = .default
    var onRatingTap: ((Int) -> Void)? = nil
    var onButtonClick: (() -> Void)? = nil

    @State private var selectedRating: Int? = nil

    private var shouldShowContinueButton: Bool {
        switch selectionBehavior {
        case .single(let autoAdvance):
            return !autoAdvance
        case .multi:
            return true
        }
    }

    var body: some View {
        VStack(spacing: 0) {
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

            // Rating buttons
            RatingFooterButton(
                buttonStyle: ratingButtonStyle,
                cornerRadius: ratingCornerRadius,
                buttonOption: ratingButtonOption,
                font: ratingFont,
                labels: ratingLabels,
                selectedRating: selectedRating,
                onTap: { rating in
                    selectedRating = rating
                    onRatingTap?(rating)

                    switch selectionBehavior {
                    case .single(let autoAdvance):
                        if autoAdvance {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                onButtonClick?()
                            }
                        }
                    case .multi:
                        break
                    }
                }
            )
            .padding(.horizontal, 24)
            .padding(.top, 24)

            // Continue button at bottom
            if shouldShowContinueButton {
                Text(ctaText)
                    .onbButtonStyle(
                        style: ctaButtonStyle,
                        isSelected: selectedRating != nil,
                        format: ctaButtonFormatData
                    ) {
                        onButtonClick?()
                    }
                    .disabled(selectedRating == nil)
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
            headerStyle: .progressBar,
            headerAlignment: .center,
            showBackButton: .afterFirstSlide,
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
                )
            ]
        )
    )
}
