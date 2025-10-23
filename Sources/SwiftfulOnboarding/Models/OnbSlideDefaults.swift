//
//  OnbSlideDefaults.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

/// Centralized default values for common slide parameters.
///
/// Use this to customize default styling across all slides in your onboarding flow.
/// Set `slideDefaults` in `OnbConfiguration` to apply these defaults.
///
/// Example:
/// ```swift
/// OnbConfiguration(
///     slideDefaults: OnbSlideDefaults(
///         titleFont: .system(.title, weight: .bold),
///         ctaButtonStyle: .solid(backgroundColor: .purple, textColor: .white),
///         contentSpacing: 32
///     ),
///     slides: [...]
/// )
/// ```
///
/// Note: Individual slide parameters will override these defaults when specified.
struct OnbSlideDefaults {
    // Title & Subtitle
    var titleFont: Font = .largeTitle
    var subtitleFont: Font = .body
    var titleSubtitleSpacing: CGFloat = 8
    var titleAlignment: OnbTextAlignment = .center

    // Content
    var contentAlignment: OnbContentAlignment = .center
    var paddingTop: CGFloat = 40
    var paddingBottom: CGFloat = 0
    var horizontalPaddingContent: CGFloat = 0
    var horizontalPaddingTitle: CGFloat = 40
    var contentSpacing: CGFloat = 24

    // Footer
    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var ctaButtonFormatData: OnbButtonFormatData = .default

    // Media (for slides that support it)
    var mediaPosition: OnbMediaPosition = .top

    // Feedback (for slides that support it)
    var feedbackStyle: AnyFeedbackViewStyle = .top()

    // Selection (for slides that support it)
    var selectionBehavior: OnbSelectionBehavior = .single()

    // Multiple Choice Options (for multipleChoice and yesNo slides)
    var optionsSpacing: CGFloat = 12
    var optionsButtonStyle: OnbButtonStyleType = .solidOutline(backgroundColor: .clear, textColor: .blue, borderColor: .blue, selectedBackgroundColor: .blue, selectedTextColor: .white, selectedBorderColor: .blue)
    var optionsButtonFormatData: OnbButtonFormatData = .default
    var isGrid: Bool = false

    // Secondary Button (for primaryAction slide)
    var secondaryButtonStyle: OnbButtonStyleType = .outline(textColor: .blue, borderColor: .blue)
    var secondaryButtonFormatData: OnbButtonFormatData = .default
    var secondaryButtonSpacing: CGFloat = 12

    // Background & Transitions
    var backgroundColor: Color = .clear
    var transitionStyle: OnbTransitionStyle = .slide

    static let `default` = OnbSlideDefaults()
}
