//
//  PreviewFlows.swift
//  SwiftfulOnboarding
//
//  Created on 10/24/25.
//

import SwiftUI

struct PreviewFlows {

    static var simpleFlow: OnbConfiguration {
        OnbConfiguration(
            headerConfiguration: OnbHeaderConfiguration(
                headerStyle: .progressBar,
                headerAlignment: .center,
                showBackButton: .afterFirstSlide
            ),
            slides: [
                .regular(
                    id: "regular",
                    title: "Regular Slide",
                    subtitle: "Basic slide with title, subtitle, and CTA button"
                ),
                .multipleChoice(
                    id: "multipleChoice_autoAdvance_true",
                    title: "Multiple Choice (Auto Advance: True)",
                    subtitle: "Select an option and it auto advances",
                    options: [
                        OnbChoiceOption(id: "option1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "option2", content: OnbButtonContentData(text: "Option 2")),
                        OnbChoiceOption(id: "option3", content: OnbButtonContentData(text: "Option 3"))
                    ],
                    selectionBehavior: .single(autoAdvance: true)
                ),
                .multipleChoice(
                    id: "multipleChoice_autoAdvance_false",
                    title: "Multiple Choice (Auto Advance: False)",
                    subtitle: "Select options and tap Continue",
                    options: [
                        OnbChoiceOption(id: "option1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "option2", content: OnbButtonContentData(text: "Option 2")),
                        OnbChoiceOption(id: "option3", content: OnbButtonContentData(text: "Option 3"))
                    ],
                    selectionBehavior: .single(autoAdvance: false)
                ),
                .multipleChoice(
                    id: "multipleChoice_multi",
                    title: "Multiple Choice (Multi Select)",
                    subtitle: "Select multiple options and tap Continue",
                    options: [
                        OnbChoiceOption(id: "option1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "option2", content: OnbButtonContentData(text: "Option 2")),
                        OnbChoiceOption(id: "option3", content: OnbButtonContentData(text: "Option 3"))
                    ],
                    selectionBehavior: .multi
                ),
                .yesNo(
                    id: "yesNo_autoAdvance_true",
                    title: "Yes/No (Auto Advance: True)",
                    subtitle: "Select yes or no and it auto advances",
                    selectionBehavior: .single(autoAdvance: true)
                ),
                .yesNo(
                    id: "yesNo_autoAdvance_false",
                    title: "Yes/No (Auto Advance: False)",
                    subtitle: "Select yes or no and tap Continue",
                    selectionBehavior: .single(autoAdvance: false)
                ),
                .rating(
                    id: "rating_autoAdvance_true",
                    title: "Rating (Auto Advance: True)",
                    subtitle: "Rate 1-5 and it auto advances",
                    selectionBehavior: .single(autoAdvance: true)
                ),
                .rating(
                    id: "rating_autoAdvance_false",
                    title: "Rating (Auto Advance: False)",
                    subtitle: "Rate 1-5 and tap Continue",
                    selectionBehavior: .single(autoAdvance: false)
                ),
                .textInput(
                    id: "textInput",
                    title: "Text Input",
                    subtitle: "Enter text and tap Continue"
                ),
                .datePicker(
                    id: "datePicker",
                    title: "Date Picker",
                    subtitle: "Select a date and tap Continue"
                ),
                .picker(
                    id: "picker",
                    title: "Picker",
                    subtitle: "Select an option from the picker",
                    pickerOptions: ["Option 1", "Option 2", "Option 3", "Option 4"]
                ),
                .primaryAction(
                    id: "primaryAction",
                    title: "Primary Action",
                    subtitle: "Slide with primary and optional secondary button"
                )
            ],
            slideDefaults: OnbSlideDefaults(
                contentAlignment: .top
            )
        )
    }

    static var regularSlidesFlow: OnbConfiguration {
        OnbConfiguration(
            headerConfiguration: OnbHeaderConfiguration(
                headerStyle: .progressBar,
                headerAlignment: .center,
                showBackButton: .afterFirstSlide,
                backButtonColor: .red,
                progressBarAccentColor: .red
            ),
            slides: [
                // Title + Subtitle, Center
                .regular(
                    id: "title_subtitle_center",
                    title: "Title + Subtitle",
                    subtitle: "Content aligned center",
                    contentAlignment: .center
                ),
                // Title + Subtitle, Top
                .regular(
                    id: "title_subtitle_top",
                    title: "Title + Subtitle",
                    subtitle: "Content aligned top",
                    contentAlignment: .top
                ),
                // Title Only, Center
                .regular(
                    id: "title_only_center",
                    title: "Title Only",
                    contentAlignment: .center
                ),
                // Title Only, Top
                .regular(
                    id: "title_only_top",
                    title: "Title Only",
                    contentAlignment: .top
                ),
                // Title + Image, Center
                .regular(
                    id: "title_image_center",
                    title: "Title + Image",
                    media: .systemIcon(named: "star.fill", size: .large),
                    contentAlignment: .center
                ),
                // Title + Image, Top
                .regular(
                    id: "title_image_top",
                    title: "Title + Image",
                    media: .systemIcon(named: "star.fill", size: .large),
                    contentAlignment: .top
                ),
                // Title + Subtitle + Image, Center
                .regular(
                    id: "title_subtitle_image_center",
                    title: "Title + Subtitle + Image",
                    subtitle: "All elements with center alignment",
                    media: .systemIcon(named: "heart.fill", size: .large),
                    contentAlignment: .center
                ),
                // Title + Subtitle + Image, Top
                .regular(
                    id: "title_subtitle_image_top",
                    title: "Title + Subtitle + Image",
                    subtitle: "All elements with top alignment",
                    media: .systemIcon(named: "heart.fill", size: .large),
                    contentAlignment: .top
                ),
                // Title + Image (Below), Center
                .regular(
                    id: "title_image_below_center",
                    title: "Title + Image Below",
                    media: .systemIcon(named: "star.fill", size: .large),
                    mediaPosition: .bottom,
                    contentAlignment: .center
                ),
                // Title + Image (Below), Top
                .regular(
                    id: "title_image_below_top",
                    title: "Title + Image Below",
                    media: .systemIcon(named: "star.fill", size: .large),
                    mediaPosition: .bottom,
                    contentAlignment: .top
                ),
                // Title + Subtitle + Image (Below), Center
                .regular(
                    id: "title_subtitle_image_below_center",
                    title: "Title + Subtitle + Image Below",
                    subtitle: "Image positioned below content, centered",
                    media: .systemIcon(named: "heart.fill", size: .large),
                    mediaPosition: .bottom,
                    contentAlignment: .center
                ),
                // Title + Subtitle + Image (Below), Top
                .regular(
                    id: "title_subtitle_image_below_top",
                    title: "Title + Subtitle + Image Below",
                    subtitle: "Image positioned below content, top aligned",
                    media: .systemIcon(named: "heart.fill", size: .large),
                    mediaPosition: .bottom,
                    contentAlignment: .top
                )
            ],
            slideDefaults: OnbSlideDefaults(
                ctaButtonStyle: .outline(textColor: .red, borderColor: .red)
            )
        )
    }
}

#Preview("Simple Flow") {
    SwiftfulOnboardingView(
        configuration: PreviewFlows.simpleFlow
    )
}

#Preview("Regular Slides") {
    SwiftfulOnboardingView(
        configuration: PreviewFlows.regularSlidesFlow
    )
}
