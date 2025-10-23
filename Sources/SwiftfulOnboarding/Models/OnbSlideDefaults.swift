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
    var titleFont: Font
    var subtitleFont: Font
    var titleSubtitleSpacing: CGFloat
    var titleAlignment: OnbTextAlignment

    // Content
    var contentAlignment: OnbContentAlignment
    var paddingTop: CGFloat
    var paddingBottom: CGFloat
    var horizontalPaddingContent: CGFloat
    var horizontalPaddingTitle: CGFloat
    var contentSpacing: CGFloat

    // Footer
    var footerData: OnbFooterData
    var ctaText: String
    var ctaButtonStyle: OnbButtonStyleType
    var ctaButtonFormatData: OnbButtonFormatData

    // Media (for slides that support it)
    var mediaPosition: OnbMediaPosition

    // Feedback (for slides that support it)
    var feedbackStyle: AnyFeedbackViewStyle

    // Selection (for slides that support it)
    var selectionBehavior: OnbSelectionBehavior

    // Background & Transitions
    var backgroundColor: Color
    var transitionStyle: OnbTransitionStyle

    static let `default` = OnbSlideDefaults(
        titleFont: .largeTitle,
        subtitleFont: .body,
        titleSubtitleSpacing: 8,
        titleAlignment: .center,
        contentAlignment: .center,
        paddingTop: 40,
        paddingBottom: 0,
        horizontalPaddingContent: 0,
        horizontalPaddingTitle: 40,
        contentSpacing: 24,
        footerData: .default,
        ctaText: "Continue",
        ctaButtonStyle: .solid(backgroundColor: .blue, textColor: .white),
        ctaButtonFormatData: .default,
        mediaPosition: .top,
        feedbackStyle: .top(),
        selectionBehavior: .single(),
        backgroundColor: .clear,
        transitionStyle: .slide
    )
}
