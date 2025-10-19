//
//  MultipleChoiceSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

enum OnbSelectionBehavior {
    case single
    case multi
}

struct OnbChoiceOption {
    var id: String
    var content: OnbButtonContentData
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
    var selectionBehavior: OnbSelectionBehavior = .single
    var paddingTop: CGFloat = 24
    var paddingBottom: CGFloat = 0
    var horizontalPaddingContent: CGFloat = 24
    var horizontalPaddingTitle: CGFloat = 40
    var contentSpacing: CGFloat = 24
    var footerPadding: OnbFooterPadding = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var onOptionClick: ((String) -> Void)? = nil
    var onButtonClick: (() -> Void)? = nil

    @State private var selectedOptions: Set<String> = []

    var body: some View {
        if options.count > 4 {
            // UI with ScrollView
            VStack(spacing: 0) {
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
                        VStack(spacing: optionsSpacing) {
                            ForEach(options, id: \.id) { option in
                                OnbButtonContent(data: option.content)
                                    .onbButtonStyle(
                                        style: optionsButtonStyle,
                                        isSelected: selectedOptions.contains(option.id)
                                    ) {
                                        toggleSelection(for: option.id)
                                    }
                            }
                        }
                        .padding(.horizontal, horizontalPaddingContent)

                        // Bottom padding to account for footer
                        Color.clear
                            .frame(height: footerPadding.top + 56 + footerPadding.bottom)
                    }
                    .ignoresSafeArea(edges: .bottom)

                    // Continue button overlaying at bottom
                    VStack(spacing: 0) {
                        Text(ctaText)
                            .onbButtonStyle(
                                style: ctaButtonStyle
                            ) {
                                onButtonClick?()
                            }
                            .disabled(selectedOptions.isEmpty)
                            .padding(.top, footerPadding.top)
                            .padding(.leading, footerPadding.leading)
                            .padding(.trailing, footerPadding.trailing)
                            .padding(.bottom, footerPadding.bottom)
                    }
                    .background(
                        LinearGradient(colors: [
                            Color(uiColor: .systemBackground).opacity(0.0),
                            Color(uiColor: .systemBackground).opacity(0.4),
                            Color(uiColor: .systemBackground).opacity(0.8)
                        ], startPoint: .top, endPoint: .bottom)
                    )
                }
            }
        } else {
            // UI without ScrollView
            VStack(spacing: 0) {
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
                    VStack(spacing: optionsSpacing) {
                        ForEach(options, id: \.id) { option in
                            OnbButtonContent(data: option.content)
                                .onbButtonStyle(
                                    style: optionsButtonStyle,
                                    isSelected: selectedOptions.contains(option.id)
                                ) {
                                    toggleSelection(for: option.id)
                                }
                        }
                    }
                    .padding(.horizontal, horizontalPaddingContent)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.top, paddingTop)
                .padding(.bottom, paddingBottom)

                // Continue button at bottom
                Text(ctaText)
                    .onbButtonStyle(
                        style: ctaButtonStyle
                    ) {
                        onButtonClick?()
                    }
                    .disabled(selectedOptions.isEmpty)
                    .opacity(selectedOptions.isEmpty ? 0.5 : 1.0)
                    .padding(.top, footerPadding.top)
                    .padding(.leading, footerPadding.leading)
                    .padding(.trailing, footerPadding.trailing)
                    .padding(.bottom, footerPadding.bottom)
            }
        }
    }

    private func toggleSelection(for optionId: String) {
        switch selectionBehavior {
        case .single:
            if selectedOptions.contains(optionId) {
                selectedOptions.remove(optionId)
            } else {
                selectedOptions = [optionId]
            }
        case .multi:
            if selectedOptions.contains(optionId) {
                selectedOptions.remove(optionId)
            } else {
                selectedOptions.insert(optionId)
            }
        }
        onOptionClick?(optionId)
    }
}

#Preview {
    SwiftfulOnboardingView(
        configuration: OnbConfiguration(
            headerStyle: .progressBar,
            headerAlignment: .center,
            showBackButton: true,
            slides: [
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
                    selectionBehavior: .multi
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
                    selectionBehavior: .single
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
                    )
                )
            ]
        )
    )
}
