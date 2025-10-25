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

    static var multipleChoiceSlidesFlow: OnbConfiguration {
        OnbConfiguration(
            headerConfiguration: OnbHeaderConfiguration(
                headerStyle: .progressBar,
                headerAlignment: .center,
                showBackButton: .afterFirstSlide,
                backButtonColor: Color(red: 0.35, green: 0.78, blue: 0.14),
                progressBarAccentColor: Color(red: 0.35, green: 0.78, blue: 0.14)
            ),
            slides: [
                // 2 Options, List, Center, Single (Auto Advance)
                .multipleChoice(
                    id: "2opts_list_center_single_auto",
                    title: "2 Options, List, Center",
                    subtitle: "Single selection, auto advance",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Option 2"))
                    ],
                    selectionBehavior: .single(autoAdvance: true),
                    isGrid: false,
                    contentAlignment: .center
                ),
                // 2 Options, List, Top, Single (Manual)
                .multipleChoice(
                    id: "2opts_list_top_single_manual",
                    title: "2 Options, List, Top",
                    subtitle: "Single selection, manual continue",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Option 2"))
                    ],
                    selectionBehavior: .single(autoAdvance: false),
                    isGrid: false,
                    contentAlignment: .top
                ),
                // 2 Options, Grid, Center, Multi
                .multipleChoice(
                    id: "2opts_grid_center_multi",
                    title: "2 Options, Grid, Center",
                    subtitle: "Multi selection",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Option 2"))
                    ],
                    selectionBehavior: .multi,
                    isGrid: true,
                    contentAlignment: .center
                ),
                // 4 Options, List, Center, Single (Auto Advance)
                .multipleChoice(
                    id: "4opts_list_center_single_auto",
                    title: "4 Options, List, Center",
                    subtitle: "Single selection, auto advance",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Option 2")),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Option 3")),
                        OnbChoiceOption(id: "opt4", content: OnbButtonContentData(text: "Option 4"))
                    ],
                    selectionBehavior: .single(autoAdvance: true),
                    isGrid: false,
                    contentAlignment: .center
                ),
                // 4 Options, List, Top, Single (Manual)
                .multipleChoice(
                    id: "4opts_list_top_single_manual",
                    title: "4 Options, List, Top",
                    subtitle: "Single selection, manual continue",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Option 2")),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Option 3")),
                        OnbChoiceOption(id: "opt4", content: OnbButtonContentData(text: "Option 4"))
                    ],
                    selectionBehavior: .single(autoAdvance: false),
                    isGrid: false,
                    contentAlignment: .top
                ),
                // 4 Options, List, Center, Multi
                .multipleChoice(
                    id: "4opts_list_center_multi",
                    title: "4 Options, List, Center",
                    subtitle: "Multi selection",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Option 2")),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Option 3")),
                        OnbChoiceOption(id: "opt4", content: OnbButtonContentData(text: "Option 4"))
                    ],
                    selectionBehavior: .multi,
                    isGrid: false,
                    contentAlignment: .center
                ),
                // 4 Options, Grid, Center, Single (Auto Advance)
                .multipleChoice(
                    id: "4opts_grid_center_single_auto",
                    title: "4 Options, Grid, Center",
                    subtitle: "Single selection, auto advance",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Option 2")),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Option 3")),
                        OnbChoiceOption(id: "opt4", content: OnbButtonContentData(text: "Option 4"))
                    ],
                    selectionBehavior: .single(autoAdvance: true),
                    isGrid: true,
                    contentAlignment: .center
                ),
                // 4 Options, Grid, Top, Single (Manual)
                .multipleChoice(
                    id: "4opts_grid_top_single_manual",
                    title: "4 Options, Grid, Top",
                    subtitle: "Single selection, manual continue",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Option 2")),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Option 3")),
                        OnbChoiceOption(id: "opt4", content: OnbButtonContentData(text: "Option 4"))
                    ],
                    selectionBehavior: .single(autoAdvance: false),
                    isGrid: true,
                    contentAlignment: .top
                ),
                // 4 Options, Grid, Center, Multi
                .multipleChoice(
                    id: "4opts_grid_center_multi",
                    title: "4 Options, Grid, Center",
                    subtitle: "Multi selection",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Option 2")),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Option 3")),
                        OnbChoiceOption(id: "opt4", content: OnbButtonContentData(text: "Option 4"))
                    ],
                    selectionBehavior: .multi,
                    isGrid: true,
                    contentAlignment: .center
                ),
                // 20 Options, List, Center, Single (Auto Advance)
                .multipleChoice(
                    id: "20opts_list_center_single_auto",
                    title: "20 Options, List, Center",
                    subtitle: "Single selection, auto advance, scrollable",
                    options: (1...20).map { OnbChoiceOption(id: "opt\($0)", content: OnbButtonContentData(text: "Option \($0)")) },
                    selectionBehavior: .single(autoAdvance: true),
                    isGrid: false,
                    contentAlignment: .center
                ),
                // 20 Options, List, Top, Single (Manual)
                .multipleChoice(
                    id: "20opts_list_top_single_manual",
                    title: "20 Options, List, Top",
                    subtitle: "Single selection, manual continue, scrollable",
                    options: (1...20).map { OnbChoiceOption(id: "opt\($0)", content: OnbButtonContentData(text: "Option \($0)")) },
                    selectionBehavior: .single(autoAdvance: false),
                    isGrid: false,
                    contentAlignment: .top
                ),
                // 20 Options, List, Center, Multi
                .multipleChoice(
                    id: "20opts_list_center_multi",
                    title: "20 Options, List, Center",
                    subtitle: "Multi selection, scrollable",
                    options: (1...20).map { OnbChoiceOption(id: "opt\($0)", content: OnbButtonContentData(text: "Option \($0)")) },
                    selectionBehavior: .multi,
                    isGrid: false,
                    contentAlignment: .center
                ),
                // 20 Options, Grid, Center, Single (Auto Advance)
                .multipleChoice(
                    id: "20opts_grid_center_single_auto",
                    title: "20 Options, Grid, Center",
                    subtitle: "Single selection, auto advance, scrollable",
                    options: (1...20).map { OnbChoiceOption(id: "opt\($0)", content: OnbButtonContentData(text: "Option \($0)")) },
                    selectionBehavior: .single(autoAdvance: true),
                    isGrid: true,
                    contentAlignment: .center
                ),
                // 20 Options, Grid, Top, Single (Manual)
                .multipleChoice(
                    id: "20opts_grid_top_single_manual",
                    title: "20 Options, Grid, Top",
                    subtitle: "Single selection, manual continue, scrollable",
                    options: (1...20).map { OnbChoiceOption(id: "opt\($0)", content: OnbButtonContentData(text: "Option \($0)")) },
                    selectionBehavior: .single(autoAdvance: false),
                    isGrid: true,
                    contentAlignment: .top
                ),
                // 20 Options, Grid, Center, Multi
                .multipleChoice(
                    id: "20opts_grid_center_multi",
                    title: "20 Options, Grid, Center",
                    subtitle: "Multi selection, scrollable",
                    options: (1...20).map { OnbChoiceOption(id: "opt\($0)", content: OnbButtonContentData(text: "Option \($0)")) },
                    selectionBehavior: .multi,
                    isGrid: true,
                    contentAlignment: .center
                ),
                // Buttons with Images
                .multipleChoice(
                    id: "buttons_with_images",
                    title: "Buttons with Images",
                    subtitle: "Options with icon media content",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Star", mediaContent: .systemIcon(named: "star.fill", size: .small), mediaContentPlacement: .top)),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Heart", mediaContent: .systemIcon(named: "heart.fill", size: .small), mediaContentPlacement: .top)),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Moon", mediaContent: .systemIcon(named: "moon.fill", size: .small), mediaContentPlacement: .top)),
                        OnbChoiceOption(id: "opt4", content: OnbButtonContentData(text: "Sun", mediaContent: .systemIcon(named: "sun.max.fill", size: .small), mediaContentPlacement: .top))
                    ],
                    optionsButtonFormatData: OnbButtonFormatData(
                        pressStyle: .press,
                        font: .headline,
                        height: .fixed(150),
                        cornerRadius: 12
                    ),
                    selectionBehavior: .single(autoAdvance: false),
                    isGrid: true,
                    contentAlignment: .top
                ),
                // Buttons with Checkboxes (Circle)
                .multipleChoice(
                    id: "buttons_checkbox_circle",
                    title: "Buttons with Checkboxes",
                    subtitle: "Circle checkboxes on the right",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Option 1", textPlacement: .leading, secondaryContent: .checkbox(style: .circle, isChecked: false, borderColor: .primary, fillColor: .primary), secondaryContentPlacement: .trailing)),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Option 2", textPlacement: .leading, secondaryContent: .checkbox(style: .circle, isChecked: false, borderColor: .primary, fillColor: .primary), secondaryContentPlacement: .trailing)),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Option 3", textPlacement: .leading, secondaryContent: .checkbox(style: .circle, isChecked: false, borderColor: .primary, fillColor: .primary), secondaryContentPlacement: .trailing))
                    ],
                    selectionBehavior: .multi,
                    contentAlignment: .top
                ),
                // Buttons with Checkboxes (Square)
                .multipleChoice(
                    id: "buttons_checkbox_square",
                    title: "Buttons with Square Checkboxes",
                    subtitle: "Square checkboxes on the left",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Option 1", textPlacement: .leading, secondaryContent: .checkbox(style: .square, isChecked: false, borderColor: .gray, fillColor: Color(red: 0.35, green: 0.78, blue: 0.14)), secondaryContentPlacement: .leading)),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Option 2", textPlacement: .leading, secondaryContent: .checkbox(style: .square, isChecked: false, borderColor: .gray, fillColor: Color(red: 0.35, green: 0.78, blue: 0.14)), secondaryContentPlacement: .leading)),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Option 3", textPlacement: .leading, secondaryContent: .checkbox(style: .square, isChecked: false, borderColor: .gray, fillColor: Color(red: 0.35, green: 0.78, blue: 0.14)), secondaryContentPlacement: .leading))
                    ],
                    selectionBehavior: .multi,
                    contentAlignment: .top
                ),
                // Buttons with Emojis
                .multipleChoice(
                    id: "buttons_with_emojis",
                    title: "Buttons with Emojis",
                    subtitle: "Emojis as secondary content",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Happy", textPlacement: .leading, secondaryContent: .emoji("😊"), secondaryContentPlacement: .trailing)),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Excited", textPlacement: .leading, secondaryContent: .emoji("🎉"), secondaryContentPlacement: .trailing)),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Love", textPlacement: .leading, secondaryContent: .emoji("❤️"), secondaryContentPlacement: .trailing)),
                        OnbChoiceOption(id: "opt4", content: OnbButtonContentData(text: "Thinking", textPlacement: .leading, secondaryContent: .emoji("🤔"), secondaryContentPlacement: .trailing))
                    ],
                    selectionBehavior: .single(autoAdvance: true),
                    contentAlignment: .top
                ),
                // Buttons with Subtitle
                .multipleChoice(
                    id: "buttons_with_subtitle",
                    title: "Buttons with Subtitles",
                    subtitle: "Main text and additional description",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Basic Plan", subtitle: "$9.99/month")),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Pro Plan", subtitle: "$19.99/month")),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Enterprise", subtitle: "$49.99/month"))
                    ],
                    selectionBehavior: .single(autoAdvance: false),
                    contentAlignment: .top
                ),
                // Buttons with Media Secondary Content
                .multipleChoice(
                    id: "buttons_media_secondary",
                    title: "Buttons with Icon Secondary",
                    subtitle: "Icons on the right side",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Messages", textPlacement: .leading, secondaryContent: .media(media: .systemIcon(named: "message.fill", size: .small)), secondaryContentPlacement: .trailing)),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Settings", textPlacement: .leading, secondaryContent: .media(media: .systemIcon(named: "gearshape.fill", size: .small)), secondaryContentPlacement: .trailing)),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Profile", textPlacement: .leading, secondaryContent: .media(media: .systemIcon(named: "person.fill", size: .small)), secondaryContentPlacement: .trailing))
                    ],
                    selectionBehavior: .single(autoAdvance: true),
                    contentAlignment: .top
                )
            ],
            slideDefaults: OnbSlideDefaults(
                ctaButtonStyle: .solid(backgroundColor: .gray, textColor: .white, selectedBackgroundColor: .purple, selectedTextColor: .white),
                ctaButtonFormatData: OnbButtonFormatData(
                    pressStyle: .press,
                    font: .headline,
                    height: .fixed(55),
                    cornerRadius: 12
                ),
                optionsButtonStyle: .duolingo(
                    backgroundColor: Color(red: 0.25, green: 0.58, blue: 0.10),
                    textColor: .white,
                    shadowColor: Color(red: 0.15, green: 0.38, blue: 0.05),
                    selectedBackgroundColor: Color(red: 0.45, green: 0.88, blue: 0.24),
                    selectedTextColor: .white,
                    selectedShadowColor: Color(red: 0.35, green: 0.78, blue: 0.14)
                ),
                optionsButtonFormatData: OnbButtonFormatData(
                    pressStyle: .press,
                    font: .headline,
                    height: .fixed(55),
                    cornerRadius: 12
                )
            )
        )
    }

    static var multipleChoiceFeedbackFlow: OnbConfiguration {
        OnbConfiguration(
            headerConfiguration: OnbHeaderConfiguration(
                headerStyle: .progressBar,
                headerAlignment: .center,
                showBackButton: .afterFirstSlide,
                backButtonColor: .blue,
                progressBarAccentColor: .blue
            ),
            slides: [
                // Basic multiple choice with solid buttons
                .multipleChoice(
                    id: "basic_solid",
                    title: "Basic Solid Buttons",
                    subtitle: "Simple multiple choice with solid button style",
                    options: [
                        OnbChoiceOption(id: "opt1", content: OnbButtonContentData(text: "Option 1")),
                        OnbChoiceOption(id: "opt2", content: OnbButtonContentData(text: "Option 2")),
                        OnbChoiceOption(id: "opt3", content: OnbButtonContentData(text: "Option 3"))
                    ],
                    selectionBehavior: .single(autoAdvance: false),
                    contentAlignment: .top
                ),
                // Feedback at top
                .multipleChoice(
                    id: "feedback_top",
                    title: "Feedback at Top",
                    subtitle: "Select an option to see feedback above",
                    options: [
                        OnbChoiceOption(
                            id: "opt1",
                            content: OnbButtonContentData(text: "Correct Answer"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.8, green: 0.95, blue: 0.8),
                                borderWidth: 2,
                                borderColor: Color(red: 0.2, green: 0.6, blue: 0.2),
                                cornerRadius: 4,
                                title: "✓ That's right!",
                                titleFont: .headline,
                                subtitle: "Great job selecting the correct answer",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        ),
                        OnbChoiceOption(
                            id: "opt2",
                            content: OnbButtonContentData(text: "Wrong Answer"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.95, green: 0.8, blue: 0.8),
                                borderWidth: 2,
                                borderColor: Color(red: 0.8, green: 0.2, blue: 0.2),
                                cornerRadius: 4,
                                title: "✗ Not quite",
                                titleFont: .headline,
                                subtitle: "Try selecting a different option",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        ),
                        OnbChoiceOption(
                            id: "opt3",
                            content: OnbButtonContentData(text: "Another Wrong Answer"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.95, green: 0.8, blue: 0.8),
                                borderWidth: 2,
                                borderColor: Color(red: 0.8, green: 0.2, blue: 0.2),
                                cornerRadius: 4,
                                title: "✗ Nope",
                                titleFont: .headline,
                                subtitle: "This one isn't right either",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        )
                    ],
                    selectionBehavior: .single(autoAdvance: false),
                    contentAlignment: .top, feedbackStyle: .top()
                ),
                // Feedback at bottom
                .multipleChoice(
                    id: "feedback_bottom",
                    title: "Feedback at Bottom",
                    subtitle: "Select an option to see feedback below",
                    options: [
                        OnbChoiceOption(
                            id: "opt1",
                            content: OnbButtonContentData(text: "Happy Path"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.8, green: 0.9, blue: 0.95),
                                borderWidth: 2,
                                borderColor: Color(red: 0.2, green: 0.4, blue: 0.8),
                                cornerRadius: 4,
                                title: "Excellent choice!",
                                titleFont: .headline,
                                subtitle: "This is the recommended option",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        ),
                        OnbChoiceOption(
                            id: "opt2",
                            content: OnbButtonContentData(text: "Alternative Path"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.95, green: 0.9, blue: 0.8),
                                borderWidth: 2,
                                borderColor: Color(red: 0.8, green: 0.5, blue: 0.2),
                                cornerRadius: 4,
                                title: "That works too",
                                titleFont: .headline,
                                subtitle: "This is an alternative approach",
                                subtitleFont: .subheadline,
                                titleAlignment: .leading
                            )
                        )
                    ],
                    selectionBehavior: .single(autoAdvance: false),
                    contentAlignment: .top, feedbackStyle: .bottom()
                ),
                // Response configuration
                .multipleChoice(
                    id: "response_center",
                    title: "With Response Screen",
                    subtitle: "Select an option to see a full-screen response",
                    options: [
                        OnbChoiceOption(
                            id: "opt1",
                            content: OnbButtonContentData(text: "Show Success Response"),
                            responseConfiguration: OnbResponseConfiguration(
                                style: .center(transition: .slide),
                                backgroundColor: .green,
                                title: "Success!",
                                titleFont: .largeTitle,
                                subtitle: "You made a great choice",
                                subtitleFont: .title3,
                                titleAlignment: .center,
                                ctaText: "Continue",
                                ctaButtonStyle: .solid(backgroundColor: .white, textColor: .green)
                            )
                        ),
                        OnbChoiceOption(
                            id: "opt2",
                            content: OnbButtonContentData(text: "Show Info Response"),
                            responseConfiguration: OnbResponseConfiguration(
                                style: .center(transition: .slide),
                                backgroundColor: .blue,
                                title: "Good to Know",
                                titleFont: .largeTitle,
                                subtitle: "Here's some important information about your selection",
                                subtitleFont: .title3,
                                titleAlignment: .center,
                                ctaText: "Got it",
                                ctaButtonStyle: .solid(backgroundColor: .white, textColor: .blue)
                            )
                        )
                    ],
                    selectionBehavior: .single(autoAdvance: true),
                    contentAlignment: .top
                ),
                // Insert slide next
                .multipleChoice(
                    id: "insert_next",
                    title: "Insert Slide Next",
                    subtitle: "Selecting an option will insert a new slide",
                    options: [
                        OnbChoiceOption(
                            id: "opt1",
                            content: OnbButtonContentData(text: "Insert Info Slide"),
                            insertConfiguration: [
                                InsertSlideData(
                                    placement: .next,
                                    slide: .regular(
                                        id: "inserted_info",
                                        title: "Inserted Information",
                                        subtitle: "This slide was dynamically inserted based on your selection",
                                        media: .systemIcon(named: "info.circle.fill", size: .large),
                                        contentAlignment: .center
                                    )
                                )
                            ]
                        ),
                        OnbChoiceOption(
                            id: "opt2",
                            content: OnbButtonContentData(text: "Insert Question"),
                            insertConfiguration: [
                                InsertSlideData(
                                    placement: .next,
                                    slide: .yesNo(
                                        id: "inserted_question",
                                        title: "Follow-up Question",
                                        subtitle: "Would you like to learn more?",
                                        selectionBehavior: .single(autoAdvance: true)
                                    )
                                )
                            ]
                        ),
                        OnbChoiceOption(
                            id: "opt3",
                            content: OnbButtonContentData(text: "No Insert"),
                            insertConfiguration: nil
                        )
                    ],
                    selectionBehavior: .single(autoAdvance: true),
                    contentAlignment: .top
                ),
                // Multiple inserts
                .multipleChoice(
                    id: "insert_multiple",
                    title: "Multiple Insert Slides",
                    subtitle: "This will insert multiple slides in sequence",
                    options: [
                        OnbChoiceOption(
                            id: "opt1",
                            content: OnbButtonContentData(text: "Insert Two Slides"),
                            insertConfiguration: [
                                InsertSlideData(
                                    placement: .next,
                                    slide: .regular(
                                        id: "insert_1",
                                        title: "First Inserted Slide",
                                        subtitle: "This is the first of two slides",
                                        media: .systemIcon(named: "1.circle.fill", size: .large),
                                        contentAlignment: .center
                                    )
                                ),
                                InsertSlideData(
                                    placement: .afterCount(count: 1),
                                    slide: .regular(
                                        id: "insert_2",
                                        title: "Second Inserted Slide",
                                        subtitle: "This is the second of two slides",
                                        media: .systemIcon(named: "2.circle.fill", size: .large),
                                        contentAlignment: .center
                                    )
                                )
                            ]
                        ),
                        OnbChoiceOption(
                            id: "opt2",
                            content: OnbButtonContentData(text: "Skip Inserts")
                        )
                    ],
                    selectionBehavior: .single(autoAdvance: true),
                    contentAlignment: .top
                ),
                // Feedback + Response combination
                .multipleChoice(
                    id: "feedback_and_response",
                    title: "Feedback + Response",
                    subtitle: "Combines inline feedback with full response screen",
                    options: [
                        OnbChoiceOption(
                            id: "opt1",
                            content: OnbButtonContentData(text: "Perfect Answer"),
                            responseConfiguration: OnbResponseConfiguration(
                                style: .center(transition: .slide),
                                backgroundColor: .green,
                                title: "Perfect Score!",
                                titleFont: .largeTitle,
                                subtitle: "You got it right on the first try",
                                subtitleFont: .title3,
                                titleAlignment: .center,
                                ctaText: "Continue",
                                ctaButtonStyle: .solid(backgroundColor: .white, textColor: .green)
                            ), feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.8, green: 0.95, blue: 0.8),
                                borderWidth: 2,
                                borderColor: Color(red: 0.2, green: 0.6, blue: 0.2),
                                cornerRadius: 4,
                                title: "✓ Correct!",
                                titleFont: .headline,
                                titleAlignment: .leading
                            )
                        ),
                        OnbChoiceOption(
                            id: "opt2",
                            content: OnbButtonContentData(text: "Good Answer"),
                            responseConfiguration: OnbResponseConfiguration(
                                style: .center(transition: .slide),
                                backgroundColor: .blue,
                                title: "Good Job",
                                titleFont: .largeTitle,
                                subtitle: "That's a solid choice",
                                subtitleFont: .title3,
                                titleAlignment: .center,
                                ctaText: "Next",
                                ctaButtonStyle: .solid(backgroundColor: .white, textColor: .blue)
                            ), feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.8, green: 0.9, blue: 0.95),
                                borderWidth: 2,
                                borderColor: Color(red: 0.2, green: 0.4, blue: 0.8),
                                cornerRadius: 4,
                                title: "Not bad",
                                titleFont: .headline,
                                titleAlignment: .leading
                            )
                        )
                    ],
                    selectionBehavior: .single(autoAdvance: true),
                    contentAlignment: .top, feedbackStyle: .top()
                ),
                // Grid layout with feedback
                .multipleChoice(
                    id: "grid_feedback",
                    title: "Grid with Feedback",
                    subtitle: "Grid layout showing feedback for each choice",
                    options: [
                        OnbChoiceOption(
                            id: "opt1",
                            content: OnbButtonContentData(text: "Option A"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.95, green: 0.8, blue: 0.8),
                                cornerRadius: 4,
                                title: "Option A selected",
                                titleAlignment: .center
                            )
                        ),
                        OnbChoiceOption(
                            id: "opt2",
                            content: OnbButtonContentData(text: "Option B"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.8, green: 0.95, blue: 0.8),
                                cornerRadius: 4,
                                title: "Option B selected",
                                titleAlignment: .center
                            )
                        ),
                        OnbChoiceOption(
                            id: "opt3",
                            content: OnbButtonContentData(text: "Option C"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.8, green: 0.9, blue: 0.95),
                                cornerRadius: 4,
                                title: "Option C selected",
                                titleAlignment: .center
                            )
                        ),
                        OnbChoiceOption(
                            id: "opt4",
                            content: OnbButtonContentData(text: "Option D"),
                            feedbackConfiguration: OnbFeedbackConfiguration(
                                backgroundColor: Color(red: 0.95, green: 0.9, blue: 0.8),
                                cornerRadius: 4,
                                title: "Option D selected",
                                titleAlignment: .center
                            )
                        )
                    ],
                    selectionBehavior: .single(autoAdvance: false),
                    isGrid: true,
                    contentAlignment: .top, feedbackStyle: .bottom()
                )
            ],
            slideDefaults: OnbSlideDefaults(
                ctaButtonStyle: .solid(backgroundColor: .blue, textColor: .white, selectedBackgroundColor: .blue, selectedTextColor: .white),
                ctaButtonFormatData: OnbButtonFormatData(
                    pressStyle: .press,
                    font: .headline,
                    height: .verticalPadding(16),
                    cornerRadius: 12
                ),
                optionsButtonStyle: .solid(
                    backgroundColor: Color(red: 0.95, green: 0.95, blue: 0.95),
                    textColor: .black,
                    selectedBackgroundColor: .blue,
                    selectedTextColor: .white
                ),
                optionsButtonFormatData: OnbButtonFormatData(
                    pressStyle: .press,
                    font: .headline,
                    height: .verticalPadding(16),
                    cornerRadius: 12
                )
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

#Preview("Multiple Choice Slides") {
    SwiftfulOnboardingView(
        configuration: PreviewFlows.multipleChoiceSlidesFlow
    )
}

#Preview("Multiple Choice Feedback") {
    SwiftfulOnboardingView(
        configuration: PreviewFlows.multipleChoiceFeedbackFlow
    )
}
