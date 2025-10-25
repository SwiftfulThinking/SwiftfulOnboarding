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
    var titleFont: Font = .title.weight(.semibold)
    var subtitleFont: Font = .body
    var titleSubtitleSpacing: CGFloat = 8
    var titleAlignment: OnbTextAlignment = .center

    // Content
    var contentAlignment: OnbContentAlignment = .center
    var paddingTop: CGFloat = 40
    var paddingBottom: CGFloat = 0
    var horizontalPaddingContent: CGFloat = 24
    var horizontalPaddingTitle: CGFloat = 40
    var contentSpacing: CGFloat = 12

    // Footer
    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: Color(uiColor: .systemGray5), textColor: .black, selectedBackgroundColor: .blue, selectedTextColor: .white)
    var ctaButtonFormatData: OnbButtonFormatData = .default

    // Media (for slides that support it)
    var mediaPosition: OnbMediaPosition = .top

    // Feedback (for slides that support it)
    var feedbackStyle: AnyFeedbackViewStyle = .bottom(transition: .none)
    var feedbackConfiguration: OnbFeedbackConfiguration = OnbFeedbackConfiguration()

    // Selection (for slides that support it)
    var selectionBehavior: OnbSelectionBehavior = .single()

    // Multiple Choice Options (for multipleChoice and yesNo slides)
    var optionsSpacing: CGFloat = 12
    var optionsButtonStyle: OnbButtonStyleType = .solid(backgroundColor: Color(uiColor: .systemGray5), textColor: .black, selectedBackgroundColor: .blue, selectedTextColor: .white)
    var optionsButtonFormatData: OnbButtonFormatData = .default
    var isGrid: Bool = false

    // Secondary Button (for primaryAction slide)
    var secondaryButtonStyle: OnbButtonStyleType = .outline(textColor: Color(uiColor: .systemGray4), borderColor: Color(uiColor: .systemGray4))
    var secondaryButtonFormatData: OnbButtonFormatData = .default
    var secondaryButtonSpacing: CGFloat = 12

    // Background & Transitions
    var background: OnbBackgroundType = .solidColor(.clear)
    var transitionStyle: OnbTransitionStyle = .slide

    static let `default` = OnbSlideDefaults()
}
