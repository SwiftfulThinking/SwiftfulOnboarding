//
//  AnyFeedbackView.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

enum AnyFeedbackViewTransition: Equatable {
    case slide
    case scale
    case fade
    case opacity
    case none
}

enum AnyFeedbackViewStyle: Equatable {
    case top(transition: AnyFeedbackViewTransition = .slide)
    case bottom(transition: AnyFeedbackViewTransition = .slide)
}

struct AnyFeedbackView: View {

    var style: AnyFeedbackViewStyle = .top()
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
    var paddingTop: CGFloat = 16
    var paddingBottom: CGFloat = 16
    var paddingHorizontal: CGFloat = 24

    var body: some View {
        VStack(spacing: 0) {
            OnbTitleContent(
                title: title,
                titleFont: titleFont,
                subtitle: subtitle,
                subtitleFont: subtitleFont,
                spacing: titleSubtitleSpacing,
                alignment: titleAlignment
            )
            .padding(.top, paddingTop)
            .padding(.bottom, paddingBottom)
            .padding(.horizontal, paddingHorizontal)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: borderWidth)
                )
        )
        .padding(.horizontal, horizontalPadding)
    }
}

#Preview {
    VStack(spacing: 24) {
        VStack {
            AnyFeedbackView(
                style: .top(),
                backgroundColor: Color(red: 0.8, green: 0.95, blue: 0.8),
                borderWidth: 2,
                borderColor: Color(red: 0.2, green: 0.6, blue: 0.2),
                horizontalPadding: 24,
                title: "Great job!",
                titleFont: .headline,
                subtitle: "You're doing amazing",
                subtitleFont: .subheadline,
                titleAlignment: .leading
            )

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))

        VStack {
            Spacer()

            AnyFeedbackView(
                style: .bottom(),
                backgroundColor: Color(red: 0.8, green: 0.95, blue: 0.8),
                borderWidth: 2,
                borderColor: Color(red: 0.2, green: 0.6, blue: 0.2),
                horizontalPadding: 24,
                title: "Oops!",
                titleFont: .headline,
                subtitle: "Let's try that again",
                subtitleFont: .subheadline,
                titleAlignment: .leading
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}
