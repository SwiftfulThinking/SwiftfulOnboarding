//
//  MultipleChoiceSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

enum OnbSelectionBehavior {
    case single(autoAdvance: Bool = false)
    case multi
}

struct OnbChoiceOption: Hashable, Equatable {
    var id: String
    var content: OnbButtonContentData
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
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
    var onOptionClick: ((OnbChoiceOption) -> Void)? = nil
    var onButtonClick: (([OnbChoiceOption]) -> Void)? = nil

    @State private var selectedOptions: [OnbChoiceOption] = []

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
                        if isGrid {
                            NonLazyVGrid(columns: 2, spacing: optionsSpacing, items: options) { option in
                                if let option {
                                    OnbButtonContent(
                                        data: option.content,
                                        horizontalPadding: horizontalButtonPadding
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
                                        horizontalPadding: horizontalButtonPadding
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
                            .frame(height: footerData.top + 56 + footerData.bottom)
                    }
                    .ignoresSafeArea(edges: .bottom)

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
                                .padding(.top, footerData.top)
                                .padding(.leading, footerData.leading)
                                .padding(.trailing, footerData.trailing)
                                .padding(.bottom, footerData.bottom)
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
                    if isGrid {
                        NonLazyVGrid(columns: 2, spacing: optionsSpacing, items: options) { option in
                            if let option {
                                OnbButtonContent(
                                    data: option.content,
                                    horizontalPadding: horizontalButtonPadding
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
                                    horizontalPadding: horizontalButtonPadding
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
                        .opacity(selectedOptions.isEmpty ? 0.5 : 1.0)
                        .padding(.top, footerData.top)
                        .padding(.leading, footerData.leading)
                        .padding(.trailing, footerData.trailing)
                        .padding(.bottom, footerData.bottom)
                }
            }
        }
    }

    private func toggleSelection(for option: OnbChoiceOption) {
        switch selectionBehavior {
        case .single(let autoAdvance):
            if let index = selectedOptions.firstIndex(of: option) {
                selectedOptions.remove(at: index)
            } else {
                selectedOptions = [option]

                if autoAdvance {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        onButtonClick?(selectedOptions)
                    }
                }
            }
        case .multi:
            if let index = selectedOptions.firstIndex(of: option) {
                selectedOptions.remove(at: index)
            } else {
                selectedOptions.append(option)
            }
        }
        onOptionClick?(option)
    }
}

#Preview {
    SwiftfulOnboardingView(
        configuration: OnbConfiguration(
            headerStyle: .progressBar,
            headerAlignment: .center,
            showBackButton: .afterFirstSlide,
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
                                textPlacement: .leading,
                                mediaContent: .image(urlString: "https://picsum.photos/600/600"),
                                mediaContentPlacement: .top
                            )
                        ),
                        OnbChoiceOption(
                            id: "urban",
                            content: OnbButtonContentData(
                                text: "Urban",
                                textPlacement: .leading,
                                mediaContent: .image(urlString: "https://picsum.photos/600/600"),
                                mediaContentPlacement: .top
                            )
                        ),
                        OnbChoiceOption(
                            id: "minimal",
                            content: OnbButtonContentData(
                                text: "Minimal",
                                textPlacement: .leading,
                                mediaContent: .image(urlString: "https://picsum.photos/600/600"),
                                mediaContentPlacement: .top
                            )
                        ),
                        OnbChoiceOption(
                            id: "colorful",
                            content: OnbButtonContentData(
                                text: "Colorful",
                                textPlacement: .leading,
                                mediaContent: .image(urlString: "https://picsum.photos/600/600"),
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
                    selectionBehavior: .multi,
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
                    selectionBehavior: .multi,
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
                )
            ]
        )
    )
}
