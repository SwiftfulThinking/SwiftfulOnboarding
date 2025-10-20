//
//  AnyResponseViewContainer.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

struct AnyResponseViewContainer: View {

    let config: OnbResponseConfiguration
    let isShowing: Bool
    let onButtonClick: (() -> Void)?

    private var screenWidth: CGFloat {
        #if os(iOS)
        return UIScreen.main.bounds.width
        #else
        return NSScreen.main?.frame.width ?? 800
        #endif
    }

    private var transition: AnyResponseViewTransition {
        switch config.style {
        case .bottom(let t):
            return t
        case .center(let t):
            return t
        }
    }

    private func responseViewOpacity() -> Double {
        switch transition {
        case .none:
            return isShowing ? 1 : 0
        case .slide, .bottom:
            return 1
        case .opacity, .scale, .fade:
            return isShowing ? 1 : 0
        }
    }

    private func responseViewOffset() -> CGSize {
        if isShowing {
            return .zero
        }

        switch transition {
        case .none, .opacity, .scale:
            return .zero
        case .slide:
            return CGSize(width: screenWidth, height: 0)
        case .fade:
            return CGSize(width: 24, height: 0)
        case .bottom:
            // Slide from bottom
            #if os(iOS)
            return CGSize(width: 0, height: UIScreen.main.bounds.height)
            #else
            return CGSize(width: 0, height: NSScreen.main?.frame.height ?? 800)
            #endif
        }
    }

    private func responseViewScale() -> CGFloat {
        switch transition {
        case .scale:
            return isShowing ? 1 : 0.8
        case .none, .opacity, .slide, .fade, .bottom:
            return 1
        }
    }

    private var shouldAnimateTransition: Bool {
        switch transition {
        case .none:
            return false
        case .opacity, .slide, .scale, .fade, .bottom:
            return true
        }
    }

    private var alignment: Alignment {
        config.style == .bottom() ? .bottom : .center
    }

    var body: some View {
        AnyResponseView(
            style: config.style,
            backgroundColor: config.backgroundColor,
            borderWidth: config.borderWidth,
            borderColor: config.borderColor,
            cornerRadius: config.cornerRadius,
            horizontalPadding: config.horizontalPadding,
            title: config.title,
            titleFont: config.titleFont,
            subtitle: config.subtitle,
            subtitleFont: config.subtitleFont,
            titleSubtitleSpacing: config.titleSubtitleSpacing,
            titleAlignment: config.titleAlignment,
            paddingTop: config.paddingTop,
            paddingBottom: config.paddingBottom,
            footerData: config.footerData,
            ctaText: config.ctaText,
            ctaButtonStyle: config.ctaButtonStyle,
            ctaButtonFormatData: config.ctaButtonFormatData,
            onButtonClick: onButtonClick
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
        .offset(responseViewOffset())
        .opacity(responseViewOpacity())
        .scaleEffect(responseViewScale())
        .animation(shouldAnimateTransition ? .easeInOut(duration: 0.3) : nil, value: isShowing)
    }
}
