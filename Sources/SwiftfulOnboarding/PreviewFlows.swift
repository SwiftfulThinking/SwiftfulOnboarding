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
}

#Preview("Simple Flow") {
    SwiftfulOnboardingView(
        configuration: PreviewFlows.simpleFlow
    )
}
