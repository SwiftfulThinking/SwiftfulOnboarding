//
//  AnyResponseViewContainer.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

struct AnyResponseViewContainer: View {

    let config: OnbResponseConfiguration
    var defaultConfig: OnbResponseConfiguration = OnbResponseConfiguration()
    let isShowing: Bool
    let onButtonClick: (() -> Void)?

    private var screenWidth: CGFloat {
        #if os(iOS)
        return UIScreen.main.bounds.width
        #else
        return NSScreen.main?.frame.width ?? 800
        #endif
    }

    private var currentStyle: AnyResponseViewStyle {
        config.style ?? defaultConfig.style ?? .center(transition: .slide)
    }

    private var transition: AnyResponseViewTransition {
        switch currentStyle {
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
        currentStyle == .bottom() ? .bottom : .center
    }

    var body: some View {
        AnyResponseView(
            style: currentStyle,
            backgroundColor: config.backgroundColor ?? defaultConfig.backgroundColor ?? .blue,
            borderWidth: config.borderWidth ?? defaultConfig.borderWidth ?? 0,
            borderColor: config.borderColor ?? defaultConfig.borderColor ?? .clear,
            cornerRadius: config.cornerRadius ?? defaultConfig.cornerRadius ?? 24,
            horizontalPadding: config.horizontalPadding ?? defaultConfig.horizontalPadding ?? 0,
            title: config.title ?? defaultConfig.title,
            titleFont: config.titleFont ?? defaultConfig.titleFont ?? .title,
            subtitle: config.subtitle ?? defaultConfig.subtitle,
            subtitleFont: config.subtitleFont ?? defaultConfig.subtitleFont ?? .body,
            titleSubtitleSpacing: config.titleSubtitleSpacing ?? defaultConfig.titleSubtitleSpacing ?? 8,
            titleAlignment: config.titleAlignment ?? defaultConfig.titleAlignment ?? .center,
            paddingTop: config.paddingTop ?? defaultConfig.paddingTop ?? 40,
            paddingBottom: config.paddingBottom ?? defaultConfig.paddingBottom ?? 0,
            footerData: config.footerData ?? defaultConfig.footerData ?? .default,
            ctaText: config.ctaText ?? defaultConfig.ctaText ?? "Continue",
            ctaButtonStyle: config.ctaButtonStyle ?? defaultConfig.ctaButtonStyle ?? .solid(backgroundColor: .white, textColor: .blue),
            ctaButtonFormatData: config.ctaButtonFormatData ?? defaultConfig.ctaButtonFormatData ?? .default,
            onButtonClick: onButtonClick
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
        .offset(responseViewOffset())
        .opacity(responseViewOpacity())
        .scaleEffect(responseViewScale())
        .animation(shouldAnimateTransition ? .easeInOut(duration: 0.3) : nil, value: isShowing)
    }
}
