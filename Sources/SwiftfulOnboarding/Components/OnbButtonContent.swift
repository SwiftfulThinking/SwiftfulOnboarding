//
//  OnbButtonContent.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

enum OnbCheckboxStyle {
    case circle
    case square
}

enum OnbButtonSecondaryContent {
    case emoji(String)
    case checkbox(style: OnbCheckboxStyle, isChecked: Bool = false, borderColor: Color = .gray, fillColor: Color = .blue)
    case media(media: OnbMediaType)
}

enum OnbButtonSecondaryContentPlacement {
    case leading
    case centerLeading
    case centerTrailing
    case trailing
}

enum OnbButtonTextPlacement {
    case center
    case leading
}

enum OnbMediaContentPlacement {
    case top
    case bottom
}

extension TextAlignment {
    
    var asAlignment: Alignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}

struct OnbButtonContentData {
    var text: String
    var subtitle: String?
    var textPlacement: OnbButtonTextPlacement
    var secondaryContent: OnbButtonSecondaryContent?
    var secondaryContentPlacement: OnbButtonSecondaryContentPlacement
    var mediaContent: OnbMediaType?
    var mediaContentPlacement: OnbMediaContentPlacement
    var value: Any?

    init(
        text: String,
        subtitle: String? = nil,
        textPlacement: OnbButtonTextPlacement = .center,
        secondaryContent: OnbButtonSecondaryContent? = nil,
        secondaryContentPlacement: OnbButtonSecondaryContentPlacement = .trailing,
        mediaContent: OnbMediaType? = nil,
        mediaContentPlacement: OnbMediaContentPlacement = .top,
        value: Any? = nil
    ) {
        self.text = text
        self.subtitle = subtitle
        self.textPlacement = textPlacement
        self.secondaryContent = secondaryContent
        self.secondaryContentPlacement = secondaryContentPlacement
        self.mediaContent = mediaContent
        self.mediaContentPlacement = mediaContentPlacement
        self.value = value
    }
}

struct OnbButtonContent: View {

    var data: OnbButtonContentData
    var isSelected: Bool = false
    var horizontalPadding: CGFloat = 12
    var textColor: Color = .primary

    var multilineTextAlignment: TextAlignment {
        data.textPlacement == .center ? .center : .leading
    }

    var body: some View {
        if let mediaContent = data.mediaContent {
            VStack(spacing: 8) {
                if data.mediaContentPlacement == .top {
                    mediaContentView(mediaContent)
                }

                mainContent

                if data.mediaContentPlacement == .bottom {
                    mediaContentView(mediaContent)
                }
            }
            .padding(.horizontal, horizontalPadding)
        } else {
            mainContent
                .padding(.horizontal, horizontalPadding)
        }
    }

    @ViewBuilder
    private var mainContent: some View {
        if let secondaryContent = data.secondaryContent {
            switch data.secondaryContentPlacement {
            case .leading:
                leadingView(secondaryContent: secondaryContent)
            case .centerLeading:
                centerLeadingView(secondaryContent: secondaryContent)
            case .centerTrailing:
                centerTrailingView(secondaryContent: secondaryContent)
            case .trailing:
                trailingView(secondaryContent: secondaryContent)
            }
        } else {
            switch data.textPlacement {
            case .center:
                textWithSubtitle
            case .leading:
                HStack {
                    textWithSubtitle
                    Spacer()
                }
            }
        }
    }

    @ViewBuilder
    private var textWithSubtitle: some View {
        if let subtitle = data.subtitle {
            VStack(spacing: 4) {
                Text(data.text)
                    .multilineTextAlignment(multilineTextAlignment)
                Text(subtitle)
                    .font(.caption)
                    .multilineTextAlignment(multilineTextAlignment)
                    .opacity(0.7)
            }
            .frame(maxWidth: .infinity, alignment: multilineTextAlignment.asAlignment)
        } else {
            Text(data.text)
                .frame(maxWidth: .infinity, alignment: multilineTextAlignment.asAlignment)
                .frame(maxWidth: .infinity)
        }
    }

    @ViewBuilder
    private func mediaContentView(_ media: OnbMediaType) -> some View {
        let frameSize = media.size.frame
        AnyMediaView(media: media, isSelected: isSelected)
            .frame(width: frameSize.width, height: frameSize.height)
    }

    @ViewBuilder
    private func leadingView(secondaryContent: OnbButtonSecondaryContent) -> some View {
        switch data.textPlacement {
        case .center:
            ZStack {
                textWithSubtitle

                secondaryContentView(secondaryContent)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        case .leading:
            HStack(spacing: 8) {
                secondaryContentView(secondaryContent)
                textWithSubtitle
                Spacer()
            }
        }
    }

    @ViewBuilder
    private func centerLeadingView(secondaryContent: OnbButtonSecondaryContent) -> some View {
        HStack(spacing: 8) {
            secondaryContentView(secondaryContent)
            textWithSubtitle
        }
    }

    @ViewBuilder
    private func centerTrailingView(secondaryContent: OnbButtonSecondaryContent) -> some View {
        HStack(spacing: 8) {
            textWithSubtitle
            secondaryContentView(secondaryContent)
        }
    }

    @ViewBuilder
    private func trailingView(secondaryContent: OnbButtonSecondaryContent) -> some View {
        switch data.textPlacement {
        case .center:
            ZStack {
                textWithSubtitle

                secondaryContentView(secondaryContent)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        case .leading:
            HStack(spacing: 8) {
                textWithSubtitle
                secondaryContentView(secondaryContent)
                Spacer()
            }
        }
    }

    @ViewBuilder
    private func secondaryContentView(_ content: OnbButtonSecondaryContent) -> some View {
        switch content {
        case .emoji(let emoji):
            Text(emoji)
        case .checkbox(let style, let isChecked, let borderColor, let fillColor):
            checkboxView(style: style, isChecked: isChecked, borderColor: borderColor, fillColor: fillColor)
        case .media(let media):
            let frameSize = media.size.frameSecondary
            AnyMediaView(media: media, isSelected: isSelected)
                .frame(width: frameSize.width, height: frameSize.height)
        }
    }

    @ViewBuilder
    private func checkboxView(style: OnbCheckboxStyle, isChecked: Bool, borderColor: Color, fillColor: Color) -> some View {
        ZStack {
            switch style {
            case .circle:
                Circle()
                    .stroke(textColor, lineWidth: 2)
                    .frame(width: 24, height: 24)

                if isSelected {
                    Circle()
                        .fill(textColor)
                        .frame(width: 18, height: 18)
                }

            case .square:
                RoundedRectangle(cornerRadius: 4)
                    .stroke(textColor, lineWidth: 2)
                    .frame(width: 24, height: 24)

                if isSelected {
                    Image(systemName: "checkmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(textColor)
                }
            }
        }
        .frame(width: 24, height: 24)
    }
}

#Preview {
    struct PreviewContent: View {
        @State private var isTermsAccepted: Bool = false
        @State private var isOptionSelected: Bool = false

        var body: some View {
            ScrollView {
                VStack(spacing: 32) {
        // Basic text examples
        OnbButtonContent(data: OnbButtonContentData(text: "Continue"))

        OnbButtonContent(data: OnbButtonContentData(text: "Get Started"))

        OnbButtonContent(data: OnbButtonContentData(text: "Sign Up"))

        // With emoji
        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Continue",
                secondaryContent: .emoji("→")
            )
        )

        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Get Started",
                secondaryContent: .emoji("🚀")
            )
        )

        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Sign Up",
                secondaryContent: .emoji("✨")
            )
        )

        // Different placement options
        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Leading",
                secondaryContent: .emoji("←"),
                secondaryContentPlacement: .leading
            )
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .blue, textColor: .white)
        ) {
            print("Leading tapped")
        }

        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Center Leading",
                secondaryContent: .emoji("💫"),
                secondaryContentPlacement: .centerLeading
            )
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .purple, textColor: .white)
        ) {
            print("Center Leading tapped")
        }

        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Center Trailing",
                secondaryContent: .emoji("✨"),
                secondaryContentPlacement: .centerTrailing
            )
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .orange, textColor: .white)
        ) {
            print("Center Trailing tapped")
        }

        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Trailing",
                secondaryContent: .emoji("→"),
                secondaryContentPlacement: .trailing
            )
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .green, textColor: .white)
        ) {
            print("Trailing tapped")
        }

        // Leading text placement examples
        Divider()

        Text("Leading Text Placement")
            .font(.headline)

        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Back",
                textPlacement: .leading,
                secondaryContent: .emoji("⬅️"),
                secondaryContentPlacement: .leading
            )
        )
        .onbButtonStyle(
            style: .outline(textColor: .blue, borderColor: .blue)
        ) {
            print("Back with leading text tapped")
        }

        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Continue",
                textPlacement: .leading,
                secondaryContent: .emoji("→"),
                secondaryContentPlacement: .trailing
            )
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .blue, textColor: .white)
        ) {
            print("Continue with leading text tapped")
        }

        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Settings",
                textPlacement: .leading
            )
        )
        .onbButtonStyle(
            style: .outline(textColor: .gray, borderColor: .gray)
        ) {
            print("Settings tapped")
        }

                    // With checkboxes (interactive)
                    Divider()

                    Text("Interactive Checkboxes")
                        .font(.headline)

                    OnbButtonContent(
                        data: OnbButtonContentData(
                            text: "Accept Terms",
                            secondaryContent: .checkbox(style: .square, isChecked: isTermsAccepted, borderColor: .gray, fillColor: .green),
                            secondaryContentPlacement: .leading
                        )
                    )
                    .onbButtonStyle(
                        style: .outline(textColor: .black, borderColor: .gray),
                        isSelected: isTermsAccepted
                    ) {
                        isTermsAccepted.toggle()
                        print("Accept Terms toggled: \(isTermsAccepted)")
                    }

                    OnbButtonContent(
                        data: OnbButtonContentData(
                            text: "Select Option",
                            secondaryContent: .checkbox(style: .circle, isChecked: isOptionSelected, borderColor: .blue, fillColor: .blue),
                            secondaryContentPlacement: .leading
                        )
                    )
                    .onbButtonStyle(
                        style: .outline(textColor: .blue, borderColor: .blue, selectedTextColor: .blue, selectedBorderColor: .blue),
                        isSelected: isOptionSelected
                    ) {
                        isOptionSelected.toggle()
                        print("Select Option toggled: \(isOptionSelected)")
                    }

                    // With media
                    Divider()

                    Text("With Media")
                        .font(.headline)

                    OnbButtonContent(
                        data: OnbButtonContentData(
                            text: "Settings",
                            textPlacement: .leading,
                            mediaContent: .image(urlString: "https://picsum.photos/600/600"),
                            mediaContentPlacement: .top
                        )
                    )
                    .onbButtonStyle(
                        style: .outline(textColor: .gray, borderColor: .gray)
                    ) {
                        print("Settings with icon tapped")
                    }

                    OnbButtonContent(
                        data: OnbButtonContentData(
                            text: "Profile",
                            mediaContent: .systemIcon(named: "person.circle.fill"),
                            mediaContentPlacement: .top
                        )
                    )
                    .onbButtonStyle(
                        style: .solid(backgroundColor: .blue, textColor: .white)
                    ) {
                        print("Profile with icon tapped")
                    }

                    OnbButtonContent(
                        data: OnbButtonContentData(
                            text: "Share",
                            mediaContent: .systemIcon(named: "square.and.arrow.up"),
                            mediaContentPlacement: .bottom
                        )
                    )
                    .onbButtonStyle(
                        style: .outline(textColor: .blue, borderColor: .blue)
                    ) {
                        print("Share with icon tapped")
                    }

                    // Static examples
                    Text("Static Examples")
                        .font(.caption)
                        .foregroundColor(.gray)

                    OnbButtonContent(
                        data: OnbButtonContentData(
                            text: "Custom Colors",
                            secondaryContent: .checkbox(style: .square, isChecked: false, borderColor: .purple, fillColor: .purple),
                            secondaryContentPlacement: .leading
                        )
                    )
                    .onbButtonStyle(
                        style: .outline(textColor: .purple, borderColor: .purple)
                    ) {
                        print("Custom colors square tapped")
                    }

                    OnbButtonContent(
                        data: OnbButtonContentData(
                            text: "Orange Circle",
                            secondaryContent: .checkbox(style: .circle, isChecked: true, borderColor: .orange, fillColor: .orange),
                            secondaryContentPlacement: .leading
                        )
                    )
                    .onbButtonStyle(
                        style: .solid(backgroundColor: .orange, textColor: .white)
                    ) {
                        print("Orange circle tapped")
                    }

        // With horizontal padding
        Divider()

        Text("With Horizontal Padding")
            .font(.headline)

        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Padded Button",
                secondaryContent: .emoji("🔲"),
                secondaryContentPlacement: .trailing
            ),
            horizontalPadding: 16
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .purple, textColor: .white)
        ) {
            print("Padded button tapped")
        }

        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Menu Item",
                textPlacement: .leading,
                secondaryContent: .emoji("›"),
                secondaryContentPlacement: .trailing
            ),
            horizontalPadding: 20
        )
        .onbButtonStyle(
            style: .outline(textColor: .blue, borderColor: .blue)
        ) {
            print("Menu item tapped")
        }

        // Large height with large secondary content
        Divider()

        Text("Large Button with Large Media")
            .font(.headline)

        OnbButtonContent(
            data: OnbButtonContentData(
                text: "Large Button",
                textPlacement: .center,
                mediaContent: .image(urlString: "https://picsum.photos/600/600", size: .large),
                mediaContentPlacement: .top
            )
        )
        .onbButtonStyle(
            style: .solid(backgroundColor: .purple, textColor: .white),
            height: .verticalPadding(16)
        ) {
            print("Large button with large media tapped")
        }
                }
                .padding()
            }
        }
    }

    return PreviewContent()
}
