//
//  AnyResponseView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

#if canImport(UIKit)
import UIKit
#endif
import SwiftUI

enum AnyResponseViewTransition: Equatable {
    case slide
    case scale
    case fade
    case opacity
    case bottom
    case none
}

enum AnyResponseViewStyle: Equatable {
    case bottom(transition: AnyResponseViewTransition = .bottom)
    case center(transition: AnyResponseViewTransition = .slide)
}

struct AnyResponseView: View {

    var style: AnyResponseViewStyle = .bottom()
    var backgroundColor: Color = .blue
    var borderWidth: CGFloat = 0
    var borderColor: Color = .clear
    var cornerRadius: CGFloat = 24
    var horizontalPadding: CGFloat = 0
    var title: String? = nil
    var titleFont: Font = .title
    var subtitle: String? = nil
    var subtitleFont: Font = .body
    var titleSubtitleSpacing: CGFloat = 8
    var titleAlignment: OnbTextAlignment = .center
    var paddingTop: CGFloat = 40
    var paddingBottom: CGFloat = 0
    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .white, textColor: .blue)
    var ctaButtonFormatData: OnbButtonFormatData = .default
    var onButtonClick: (() -> Void)? = nil

    private var corners: UIRectCorner {
        switch style {
        case .bottom:
            return [.topLeft, .topRight]
        case .center:
            return .allCorners
        }
    }

    private var shouldIgnoreSafeArea: Bool {
        switch style {
        case .bottom:
            return true
        case .center:
            return false
        }
    }

    private var alignment: Alignment {
        switch style {
        case .bottom:
            return .bottom
        case .center:
            return .center
        }
    }

    var body: some View {
        VStack(spacing: 12) {
            OnbTitleContent(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                spacing: titleSubtitleSpacing,
                alignment: titleAlignment
            )
            .foregroundColor(.white)
            .padding(.top, paddingTop)
            .padding(.bottom, paddingBottom)

            Text(ctaText)
                .onbButtonStyle(
                    style: ctaButtonStyle,
                    isSelected: false,
                    format: ctaButtonFormatData
                ) {
                    onButtonClick?()
                }
                .padding(.top, footerData.top)
                .padding(.leading, footerData.leading)
                .padding(.trailing, footerData.trailing)
                .padding(.bottom, footerData.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(
            backgroundColor
                .overlay(
                    RoundedCorner(radius: cornerRadius, corners: corners)
                        .stroke(borderColor, lineWidth: borderWidth)
                )
                .cornerRadius(cornerRadius, corners: corners)
                .ifSatisfiesCondition(shouldIgnoreSafeArea) { content in
                    content.ignoresSafeArea(edges: .bottom)
                }
        )
        .padding(.horizontal, horizontalPadding)
    }
}

#Preview {
    VStack(spacing: 24) {
        VStack {
            Spacer()

            AnyResponseView(
                backgroundColor: .blue,
                borderWidth: 2,
                borderColor: .red,
                title: "Ready to continue?",
                subtitle: "Let's move forward",
                ctaText: "Continue"
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))

        VStack {
            Spacer()

            AnyResponseView(
                style: .center(transition: .slide),
                backgroundColor: .blue,
                borderWidth: 2,
                borderColor: .red,
                horizontalPadding: 24,
                title: "Ready to continue?",
                subtitle: "Let's move forward",
                ctaText: "Continue"
            )

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}
