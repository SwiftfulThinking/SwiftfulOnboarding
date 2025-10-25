//
//  MultipleChoiceSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

#if canImport(UIKit)
import UIKit
#endif
import SwiftUI

public enum OnbSelectionBehavior: Sendable {
    case single(autoAdvance: Bool = false)
    case multi(max: Int? = nil)
}

public struct OnbChoiceOption: Hashable, Equatable {
    public var id: String
    public var content: OnbButtonContentData
    public var responseConfiguration: OnbResponseConfiguration?
    public var feedbackConfiguration: OnbFeedbackConfiguration?
    public var insertConfiguration: [InsertSlideData]?

    public init(
        id: String,
        content: OnbButtonContentData,
        responseConfiguration: OnbResponseConfiguration? = nil,
        feedbackConfiguration: OnbFeedbackConfiguration? = nil,
        insertConfiguration: [InsertSlideData]? = nil
    ) {
        self.id = id
        self.content = content
        self.responseConfiguration = responseConfiguration
        self.feedbackConfiguration = feedbackConfiguration
        self.insertConfiguration = insertConfiguration
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

struct MultipleChoiceSlideView: View {

    var title: String? = nil
    var titleFont: Font = .largeTitle
    var subtitle: String? = nil
    var subtitleFont: Font = .body
    var titleSubtitleSpacing: CGFloat = 8
    var titleAlignment: OnbTextAlignment = .center
    var options: [OnbChoiceOption] = []
    var optionsSpacing: CGFloat = 12
    var optionsButtonStyle: OnbButtonStyleType = .outline(textColor: .blue, borderColor: .blue)
    var optionsButtonFormatData: OnbButtonFormatData = .default
    var selectionBehavior: OnbSelectionBehavior = .single()
    var isGrid: Bool = false
    var contentAlignment: OnbContentAlignment = .top
    var paddingTop: CGFloat = 24
    var paddingBottom: CGFloat = 0
    var horizontalPaddingContent: CGFloat = 24
    var horizontalPaddingTitle: CGFloat = 40
    var contentSpacing: CGFloat = 24

    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var ctaButtonFormatData: OnbButtonFormatData = .default
    var handleSelection: ((OnbChoiceOption, OnbSelectionBehavior) -> Void)? = nil
    var onButtonClick: (([OnbChoiceOption]) -> Void)? = nil
    var selectedOptions: [OnbChoiceOption] = []
    var feedbackStyle: AnyFeedbackViewStyle = .top()
    var feedbackConfigurationDefaults: OnbFeedbackConfiguration = OnbFeedbackConfiguration()

    private var shouldShowContinueButton: Bool {
        switch selectionBehavior {
        case .single(let autoAdvance):
            return !autoAdvance
        case .multi:
            return true
        }
    }

    private var horizontalButtonPadding: CGFloat {
        isGrid ? 4 : 12
    }

    private var currentFeedback: OnbFeedbackConfiguration? {
        selectedOptions.last(where: { $0.feedbackConfiguration != nil })?.feedbackConfiguration
    }

    private var anyOptionHasFeedback: Bool {
        options.contains(where: { $0.feedbackConfiguration != nil })
    }

    var body: some View {
        if options.count > 4 {
            // UI with ScrollView
            VStack(spacing: 0) {
                // Top feedback
                if anyOptionHasFeedback, case .top = feedbackStyle,
                   let feedbackConfig = currentFeedback ?? options.first(where: { $0.feedbackConfiguration != nil })?.feedbackConfiguration {
                    AnyFeedbackViewContainer(config: feedbackConfig, defaultConfig: feedbackConfigurationDefaults, style: feedbackStyle)
                        .padding(.horizontal, horizontalPaddingContent)
                        .opacity(currentFeedback != nil ? 1.0 : 0.0)
                }

                // Title/Subtitle at top
                OnbTitleContent(
                    title: title,
                    titleFont: titleFont,
                    subtitle: subtitle,
                    subtitleFont: subtitleFont,
                    spacing: titleSubtitleSpacing,
                    alignment: titleAlignment
                )
                .padding(.horizontal, horizontalPaddingTitle)
                .padding(.top, paddingTop)
                .padding(.bottom, contentSpacing)

                ZStack(alignment: .bottom) {
                    // ScrollView with options
                    ScrollView {
                        if isGrid {
                            NonLazyVGrid(columns: 2, spacing: optionsSpacing, items: options) { option in
                                if let option {
                                    OnbButtonContent(
                                        data: option.content,
                                        isSelected: selectedOptions.contains(option),
                                        horizontalPadding: horizontalButtonPadding,
                                        textColor: optionsButtonStyle.currentTextColor(isSelected: selectedOptions.contains(option))
                                    )
                                    .onbButtonStyle(
                                        style: optionsButtonStyle,
                                        isSelected: selectedOptions.contains(option),
                                        format: optionsButtonFormatData,
                                        horizontalPadding: horizontalButtonPadding
                                    ) {
                                        toggleSelection(for: option)
                                    }
                                }
                            }
                            .padding(.horizontal, horizontalPaddingContent)
                        } else {
                            VStack(spacing: optionsSpacing) {
                                ForEach(options, id: \.id) { option in
                                    OnbButtonContent(
                                        data: option.content,
                                        isSelected: selectedOptions.contains(option),
                                        horizontalPadding: horizontalButtonPadding,
                                        textColor: optionsButtonStyle.currentTextColor(isSelected: selectedOptions.contains(option))
                                    )
                                    .onbButtonStyle(
                                        style: optionsButtonStyle,
                                        isSelected: selectedOptions.contains(option),
                                        format: optionsButtonFormatData,
                                        horizontalPadding: horizontalButtonPadding
                                    ) {
                                        toggleSelection(for: option)
                                    }
                                }
                            }
                            .padding(.horizontal, horizontalPaddingContent)
                        }

                        // Bottom padding to account for footer
                        Color.clear
                            .frame(height: footerData.top + 56 + footerData.bottom + 24)
                    }
                    .ignoresSafeArea(edges: .bottom)

                    VStack(spacing: 0) {
                        // Bottom feedback
                        if anyOptionHasFeedback, case .bottom = feedbackStyle,
                           let feedbackConfig = currentFeedback ?? options.first(where: { $0.feedbackConfiguration != nil })?.feedbackConfiguration {
                            AnyFeedbackViewContainer(config: feedbackConfig, defaultConfig: feedbackConfigurationDefaults, style: feedbackStyle)
                                .padding(.horizontal, horizontalPaddingContent)
                                .opacity(currentFeedback != nil ? 1.0 : 0.0)
                        }

                        // Continue button overlaying at bottom
                        if shouldShowContinueButton {
                            VStack(spacing: 0) {
                                Text(ctaText)
                                    .onbButtonStyle(
                                        style: ctaButtonStyle,
                                        isSelected: !selectedOptions.isEmpty,
                                        format: ctaButtonFormatData
                                    ) {
                                        onButtonClick?(selectedOptions)
                                    }
                                    .disabled(selectedOptions.isEmpty)
                                    .padding(.top, max(footerData.top, 8))
                                    .padding(.leading, footerData.leading)
                                    .padding(.trailing, footerData.trailing)
                                    .padding(.bottom, footerData.bottom)
                            }
                            .background(
                                LinearGradient(colors: [
                                    Color(uiColor: .systemBackground).opacity(0.0),
                                    Color(uiColor: .systemBackground).opacity(0.7),
                                    Color(uiColor: .systemBackground).opacity(0.9)
                                ], startPoint: .top, endPoint: .bottom)
                            )
                        }
                    }
                }
            }
        } else {
            // UI without ScrollView
            VStack(spacing: 0) {
                // Top feedback
                if anyOptionHasFeedback, case .top = feedbackStyle,
                   let feedbackConfig = currentFeedback ?? options.first(where: { $0.feedbackConfiguration != nil })?.feedbackConfiguration {
                    AnyFeedbackViewContainer(config: feedbackConfig, defaultConfig: feedbackConfigurationDefaults, style: feedbackStyle)
                        .padding(.horizontal, horizontalPaddingContent)
                        .opacity(currentFeedback != nil ? 1.0 : 0.0)
                }

                // Content
                VStack(spacing: contentSpacing) {
                    // Title/Subtitle at top
                    OnbTitleContent(
                        title: title,
                        titleFont: titleFont,
                        subtitle: subtitle,
                        subtitleFont: subtitleFont,
                        spacing: titleSubtitleSpacing,
                        alignment: titleAlignment
                    )
                    .padding(.horizontal, horizontalPaddingTitle)

                    // Options
                    if isGrid {
                        NonLazyVGrid(columns: 2, spacing: optionsSpacing, items: options) { option in
                            if let option {
                                OnbButtonContent(
                                    data: option.content,
                                    isSelected: selectedOptions.contains(option),
                                    horizontalPadding: horizontalButtonPadding,
                                    textColor: optionsButtonStyle.currentTextColor(isSelected: selectedOptions.contains(option))
                                )
                                .onbButtonStyle(
                                    style: optionsButtonStyle,
                                    isSelected: selectedOptions.contains(option),
                                    format: optionsButtonFormatData,
                                    horizontalPadding: horizontalButtonPadding
                                ) {
                                    toggleSelection(for: option)
                                }
                            }
                        }
                        .padding(.horizontal, horizontalPaddingContent)
                    } else {
                        VStack(spacing: optionsSpacing) {
                            ForEach(options, id: \.id) { option in
                                OnbButtonContent(
                                    data: option.content,
                                    isSelected: selectedOptions.contains(option),
                                    horizontalPadding: horizontalButtonPadding,
                                    textColor: optionsButtonStyle.currentTextColor(isSelected: selectedOptions.contains(option))
                                )
                                .onbButtonStyle(
                                    style: optionsButtonStyle,
                                    isSelected: selectedOptions.contains(option),
                                    format: optionsButtonFormatData,
                                    horizontalPadding: horizontalButtonPadding
                                ) {
                                    toggleSelection(for: option)
                                }
                            }
                        }
                        .padding(.horizontal, horizontalPaddingContent)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: contentAlignment.alignment)
                .padding(.top, paddingTop)
                .padding(.bottom, paddingBottom)

                // Bottom feedback
                if anyOptionHasFeedback, case .bottom = feedbackStyle,
                   let feedbackConfig = currentFeedback ?? options.first(where: { $0.feedbackConfiguration != nil })?.feedbackConfiguration {
                    AnyFeedbackViewContainer(config: feedbackConfig, defaultConfig: feedbackConfigurationDefaults, style: feedbackStyle)
                        .padding(.horizontal, horizontalPaddingContent)
                        .opacity(currentFeedback != nil ? 1.0 : 0.0)
                }

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

    private func toggleSelection(for option: OnbChoiceOption) {
        handleSelection?(option, selectionBehavior)

        switch selectionBehavior {
        case .single(let autoAdvance):
            if autoAdvance && !selectedOptions.contains(option) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    onButtonClick?([option])
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
            headerConfiguration: OnbHeaderConfiguration(
                headerStyle: .progressBar,
                headerAlignment: .center,
                showBackButton: .afterFirstSlide
            ),
            slides: [
                .multipleChoice(
                    id: "themes",
                    title: "Choose Your Theme",
                    subtitle: "Pick your favorite visual style",
                    options: [
                        OnbChoiceOption(
                            id: "nature",
                            content: OnbButtonContentData(
                                text: "Nature",
                                textPlacement: .center,
                                mediaContent: .image(
                                    urlString: "https://picsum.photos/600/600",
                                    aspectRatio: .square,
                                    cornerRadius: 100,
                                    selectedBorderColor: .blue,
                                    selectedBorderWidth: 2
                                ),
                                mediaContentPlacement: .top
                            )
                        ),
                        OnbChoiceOption(
                            id: "urban",
                            content: OnbButtonContentData(
                                text: "Urban",
                                textPlacement: .center,
                                mediaContent: .image(
                                    urlString: "https://picsum.photos/600/600",
                                    aspectRatio: .square,
                                    cornerRadius: 100,
                                    selectedBorderColor: .blue,
                                    selectedBorderWidth: 2
                                ),
                                mediaContentPlacement: .top
                            )
                        ),
                        OnbChoiceOption(
                            id: "minimal",
                            content: OnbButtonContentData(
                                text: "Minimal",
                                textPlacement: .center,
                                mediaContent: .image(
                                    urlString: "https://picsum.photos/600/600",
                                    aspectRatio: .square,
                                    cornerRadius: 100,
                                    selectedBorderColor: .blue,
                                    selectedBorderWidth: 2
                                ),
                                mediaContentPlacement: .top
                            )
                        ),
                        OnbChoiceOption(
                            id: "colorful",
                            content: OnbButtonContentData(
                                text: "Colorful",
                                textPlacement: .center,
                                mediaContent: .image(
                                    urlString: "https://picsum.photos/600/600",
                                    aspectRatio: .square,
                                    cornerRadius: 100,
                                    selectedBorderColor: .blue,
                                    selectedBorderWidth: 2
                                ),
                                mediaContentPlacement: .top
                            )
                        )
                    ],
                    optionsButtonStyle: .solid(
                        backgroundColor: .clear,
                        textColor: .black,
                        selectedBackgroundColor: .clear,
                        selectedTextColor: .blue
                    ),
                    selectionBehavior: .multi(),
                    isGrid: true,
                    ctaButtonStyle: .solid(
                        backgroundColor: .gray,
                        textColor: .black,
                        selectedBackgroundColor: .blue,
                        selectedTextColor: .white
                    )
                ),
                .multipleChoice(
                    id: "interests",
                    title: "Select Your Interests",
                    subtitle: "Choose all that apply",
                    options: [
                        OnbChoiceOption(id: "sports", content: OnbButtonContentData(text: "Sports")),
                        OnbChoiceOption(id: "music", content: OnbButtonContentData(text: "Music")),
                        OnbChoiceOption(id: "art", content: OnbButtonContentData(text: "Art")),
                        OnbChoiceOption(id: "tech", content: OnbButtonContentData(text: "Technology")),
                        OnbChoiceOption(id: "food", content: OnbButtonContentData(text: "Food & Cooking")),
                        OnbChoiceOption(id: "travel", content: OnbButtonContentData(text: "Travel"))
                    ],
                    optionsButtonStyle: .solid(
                        backgroundColor: .gray,
                        textColor: .white,
                        selectedBackgroundColor: .blue,
                        selectedTextColor: .white
                    ),
                    selectionBehavior: .multi(),
                    isGrid: false
                ),
                .multipleChoice(
                    id: "plan",
                    title: "Choose Your Plan",
                    subtitle: "Select one option",
                    options: [
                        OnbChoiceOption(
                            id: "basic",
                            content: OnbButtonContentData(text: "Basic - Free")
                        ),
                        OnbChoiceOption(
                            id: "pro",
                            content: OnbButtonContentData(text: "Pro - $9.99/mo")
                        ),
                        OnbChoiceOption(
                            id: "premium",
                            content: OnbButtonContentData(text: "Premium - $19.99/mo")
                        )
                    ],
                    optionsButtonStyle: .outline(
                        textColor: .blue,
                        borderColor: .blue,
                        selectedTextColor: .green,
                        selectedBorderColor: .green
                    ),
                    selectionBehavior: .single(autoAdvance: true)
                ),
                .multipleChoice(
                    id: "experience",
                    title: "Experience Level",
                    subtitle: "How would you describe yourself?",
                    options: [
                        OnbChoiceOption(id: "beginner", content: OnbButtonContentData(text: "Beginner")),
                        OnbChoiceOption(id: "intermediate", content: OnbButtonContentData(text: "Intermediate")),
                        OnbChoiceOption(id: "advanced", content: OnbButtonContentData(text: "Advanced")),
                        OnbChoiceOption(id: "expert", content: OnbButtonContentData(text: "Expert"))
                    ],
                    optionsButtonStyle: .solidOutline(
                        backgroundColor: .white,
                        textColor: .purple,
                        borderColor: .purple,
                        selectedBackgroundColor: .purple,
                        selectedTextColor: .white,
                        selectedBorderColor: .purple
                    ),
                    isGrid: true
                ),
                .multipleChoice(
                    id: "feedback_top",
                    title: "Top Feedback Example",
                    subtitle: "Select an option to see feedback at top",
                    options: [
                        OnbChoiceOption(
                            id: "correct",
                            content: OnbButtonContentData(text: "Correct Answer"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.8, green: 0.95, blue: 0.8),
                                borderWidth: 2,
                                borderColor: Color(red: 0.2, green: 0.6, blue: 0.2),
                                title: "Great job!",
                                titleFont: .headline,
                                subtitle: "You got it right",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        ),
                        OnbChoiceOption(
                            id: "wrong",
                            content: OnbButtonContentData(text: "Wrong Answer"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.95, green: 0.8, blue: 0.8),
                                borderWidth: 2,
                                borderColor: Color(red: 0.8, green: 0.2, blue: 0.2),
                                title: "Oops!",
                                titleFont: .headline,
                                subtitle: "Try again",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        )
                    ],
                    optionsButtonStyle: .outline(textColor: .blue, borderColor: .blue),
                    selectionBehavior: .single(),
                    feedbackStyle: .top()
                ),
                .multipleChoice(
                    id: "feedback_bottom",
                    title: "Bottom Feedback Example",
                    subtitle: "Select an option to see feedback at bottom",
                    options: [
                        OnbChoiceOption(
                            id: "option1",
                            content: OnbButtonContentData(text: "Option 1"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.8, green: 0.9, blue: 0.95),
                                borderWidth: 2,
                                borderColor: Color(red: 0.2, green: 0.4, blue: 0.8),
                                title: "Nice choice!",
                                titleFont: .headline,
                                subtitle: "This is a bottom feedback message",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        ),
                        OnbChoiceOption(
                            id: "option2",
                            content: OnbButtonContentData(text: "Option 2"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.95, green: 0.9, blue: 0.8),
                                borderWidth: 2,
                                borderColor: Color(red: 0.8, green: 0.5, blue: 0.2),
                                title: "Interesting!",
                                titleFont: .headline,
                                subtitle: "Another bottom feedback",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        )
                    ],
                    optionsButtonStyle: .solid(backgroundColor: .gray, textColor: .white, selectedBackgroundColor: .blue, selectedTextColor: .white),
                    selectionBehavior: .single(),
                    feedbackStyle: .bottom()
                )
            ]
        )
    )
}
