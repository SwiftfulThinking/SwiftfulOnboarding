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
public struct OnbSlideDefaults {
    // Title & Subtitle
    public var titleFont: Font
    public var subtitleFont: Font
    public var titleSubtitleSpacing: CGFloat
    public var titleAlignment: OnbTextAlignment

    // Content
    public var contentAlignment: OnbContentAlignment
    public var paddingTop: CGFloat
    public var paddingBottom: CGFloat
    public var horizontalPaddingContent: CGFloat
    public var horizontalPaddingTitle: CGFloat
    public var contentSpacing: CGFloat

    // Footer
    public var footerData: OnbFooterData
    public var ctaText: String
    public var ctaButtonStyle: OnbButtonStyleType
    public var ctaButtonFormatData: OnbButtonFormatData

    // Media (for slides that support it)
    public var mediaPosition: OnbMediaPosition

    // Feedback (for slides that support it)
    public var feedbackStyle: AnyFeedbackViewStyle
    public var feedbackConfiguration: OnbFeedbackConfiguration

    // Response (for slides that support it)
    public var responseConfiguration: OnbResponseConfiguration

    // Selection (for slides that support it)
    public var selectionBehavior: OnbSelectionBehavior

    // Multiple Choice Options (for multipleChoice and yesNo slides)
    public var optionsSpacing: CGFloat
    public var optionsButtonStyle: OnbButtonStyleType
    public var optionsButtonFormatData: OnbButtonFormatData
    public var isGrid: Bool

    // Secondary Button (for primaryAction slide)
    public var secondaryButtonStyle: OnbButtonStyleType
    public var secondaryButtonFormatData: OnbButtonFormatData
    public var secondaryButtonSpacing: CGFloat

    // Background & Transitions
    public var background: OnbBackgroundType
    public var transitionStyle: OnbTransitionStyle

    public init(
        titleFont: Font = .title.weight(.semibold),
        subtitleFont: Font = .body,
        titleSubtitleSpacing: CGFloat = 8,
        titleAlignment: OnbTextAlignment = .center,
        contentAlignment: OnbContentAlignment = .center,
        paddingTop: CGFloat = 40,
        paddingBottom: CGFloat = 0,
        horizontalPaddingContent: CGFloat = 24,
        horizontalPaddingTitle: CGFloat = 40,
        contentSpacing: CGFloat = 12,
        footerData: OnbFooterData = .default,
        ctaText: String = "Continue",
        ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: Color.gray.opacity(0.2), textColor: .primary, selectedBackgroundColor: .blue, selectedTextColor: .white),
        ctaButtonFormatData: OnbButtonFormatData = .default,
        mediaPosition: OnbMediaPosition = .top,
        feedbackStyle: AnyFeedbackViewStyle = .bottom(transition: .none),
        feedbackConfiguration: OnbFeedbackConfiguration = .default,
        responseConfiguration: OnbResponseConfiguration = .default,
        selectionBehavior: OnbSelectionBehavior = .single(),
        optionsSpacing: CGFloat = 12,
        optionsButtonStyle: OnbButtonStyleType = .solid(backgroundColor: Color.gray.opacity(0.2), textColor: .primary, selectedBackgroundColor: .blue, selectedTextColor: .white),
        optionsButtonFormatData: OnbButtonFormatData = .default,
        isGrid: Bool = false,
        secondaryButtonStyle: OnbButtonStyleType = .outline(textColor: Color.gray, borderColor: Color.gray),
        secondaryButtonFormatData: OnbButtonFormatData = .default,
        secondaryButtonSpacing: CGFloat = 12,
        background: OnbBackgroundType = .solidColor(.clear),
        transitionStyle: OnbTransitionStyle = .slide
    ) {
        self.titleFont = titleFont
        self.subtitleFont = subtitleFont
        self.titleSubtitleSpacing = titleSubtitleSpacing
        self.titleAlignment = titleAlignment
        self.contentAlignment = contentAlignment
        self.paddingTop = paddingTop
        self.paddingBottom = paddingBottom
        self.horizontalPaddingContent = horizontalPaddingContent
        self.horizontalPaddingTitle = horizontalPaddingTitle
        self.contentSpacing = contentSpacing
        self.footerData = footerData
        self.ctaText = ctaText
        self.ctaButtonStyle = ctaButtonStyle
        self.ctaButtonFormatData = ctaButtonFormatData
        self.mediaPosition = mediaPosition
        self.feedbackStyle = feedbackStyle
        self.feedbackConfiguration = feedbackConfiguration
        self.responseConfiguration = responseConfiguration
        self.selectionBehavior = selectionBehavior
        self.optionsSpacing = optionsSpacing
        self.optionsButtonStyle = optionsButtonStyle
        self.optionsButtonFormatData = optionsButtonFormatData
        self.isGrid = isGrid
        self.secondaryButtonStyle = secondaryButtonStyle
        self.secondaryButtonFormatData = secondaryButtonFormatData
        self.secondaryButtonSpacing = secondaryButtonSpacing
        self.background = background
        self.transitionStyle = transitionStyle
    }

    public static let `default` = OnbSlideDefaults()
}
