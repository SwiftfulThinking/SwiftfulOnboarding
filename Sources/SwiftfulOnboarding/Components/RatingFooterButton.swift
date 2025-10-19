//
//  RatingFooterButton.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

enum OnbRatingButtonOption {
    case number
    case thumbs

    func text(for rating: Int) -> String {
        switch self {
        case .number:
            return "\(rating)"
        case .thumbs:
            switch rating {
            case 1: return "👎"
            case 2: return "👎"
            case 3: return "🤷"
            case 4: return "👍"
            case 5: return "👍"
            default: return "\(rating)"
            }
        }
    }
}

enum OnbRatingLabelPlacement {
    case top
    case bottom
}

struct RatingFooterLabels {
    var leadingLabel: String
    var trailingLabel: String
    var labelPlacement: OnbRatingLabelPlacement
    var labelFont: Font
    var labelColor: Color
}

struct RatingFooterButton: View {

    var buttonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var cornerRadius: CGFloat = 32
    var buttonOption: OnbRatingButtonOption = .thumbs
    var font: Font = .title.weight(.medium)
    var labels: RatingFooterLabels? = nil
    var selectedRating: Int? = nil
    var onTap: ((Int) -> Void)? = nil

    private func scaleForRating(_ rating: Int) -> CGFloat {
        if buttonOption == .thumbs && (rating == 1 || rating == 5) {
            return 1.3
        }
        return 1.0
    }

    @ViewBuilder
    private var labelsView: some View {
        if let labels = labels {
            HStack {
                Text(labels.leadingLabel)
                    .font(labels.labelFont)
                    .foregroundColor(labels.labelColor)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(labels.trailingLabel)
                    .font(labels.labelFont)
                    .foregroundColor(labels.labelColor)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.horizontal, 16)
        }
    }

    @ViewBuilder
    private var buttonStack: some View {
        HStack(spacing: 2) {
            Text(buttonOption.text(for: 1))
                .scaleEffect(scaleForRating(1))
                .onbButtonStyle(
                    style: buttonStyle,
                    isSelected: selectedRating == 1,
                    font: font,
                    height: .verticalPadding(16),
                    cornerRadius: 0
                ) {
                    onTap?(1)
                }
            Text(buttonOption.text(for: 2))
                .scaleEffect(scaleForRating(2))
                .onbButtonStyle(
                    style: buttonStyle,
                    isSelected: selectedRating == 2,
                    font: font,
                    height: .verticalPadding(16),
                    cornerRadius: 0
                ) {
                    onTap?(2)
                }
            Text(buttonOption.text(for: 3))
                .scaleEffect(scaleForRating(3))
                .onbButtonStyle(
                    style: buttonStyle,
                    isSelected: selectedRating == 3,
                    font: font,
                    height: .verticalPadding(16),
                    cornerRadius: 0
                ) {
                    onTap?(3)
                }
            Text(buttonOption.text(for: 4))
                .scaleEffect(scaleForRating(4))
                .onbButtonStyle(
                    style: buttonStyle,
                    isSelected: selectedRating == 4,
                    font: font,
                    height: .verticalPadding(16),
                    cornerRadius: 0
                ) {
                    onTap?(4)
                }
            Text(buttonOption.text(for: 5))
                .scaleEffect(scaleForRating(5))
                .onbButtonStyle(
                    style: buttonStyle,
                    isSelected: selectedRating == 5,
                    font: font,
                    height: .verticalPadding(16),
                    cornerRadius: 0
                ) {
                    onTap?(5)
                }
        }
        .cornerRadius(cornerRadius)
    }

    var body: some View {
        VStack(spacing: 4) {
            if labels?.labelPlacement == .top {
                labelsView
            }

            buttonStack

            if labels?.labelPlacement == .bottom {
                labelsView
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var selectedRatingNumber: Int? = nil
        @State private var selectedRatingThumbs: Int? = nil
        @State private var selectedRatingWithLabelsTop: Int? = nil
        @State private var selectedRatingWithLabelsBottom: Int? = nil

        var body: some View {
            VStack(spacing: 32) {
                VStack(spacing: 8) {
                    Text("Number Rating")
                        .font(.headline)
                    RatingFooterButton(
                        buttonOption: .number,
                        selectedRating: selectedRatingNumber,
                        onTap: { rating in
                            selectedRatingNumber = rating
                        }
                    )
                }

                VStack(spacing: 8) {
                    Text("Thumbs Rating")
                        .font(.headline)
                    RatingFooterButton(
                        buttonOption: .thumbs,
                        selectedRating: selectedRatingThumbs,
                        onTap: { rating in
                            selectedRatingThumbs = rating
                        }
                    )
                }

                VStack(spacing: 8) {
                    Text("With Labels (Top)")
                        .font(.headline)
                    RatingFooterButton(
                        buttonOption: .number,
                        labels: RatingFooterLabels(
                            leadingLabel: "Poor",
                            trailingLabel: "Excellent",
                            labelPlacement: .top,
                            labelFont: .caption,
                            labelColor: .gray
                        ),
                        selectedRating: selectedRatingWithLabelsTop,
                        onTap: { rating in
                            selectedRatingWithLabelsTop = rating
                        }
                    )
                }

                VStack(spacing: 8) {
                    Text("With Labels (Bottom)")
                        .font(.headline)
                    RatingFooterButton(
                        buttonOption: .thumbs,
                        labels: RatingFooterLabels(
                            leadingLabel: "Disagree",
                            trailingLabel: "Agree",
                            labelPlacement: .bottom,
                            labelFont: .caption,
                            labelColor: .gray
                        ),
                        selectedRating: selectedRatingWithLabelsBottom,
                        onTap: { rating in
                            selectedRatingWithLabelsBottom = rating
                        }
                    )
                }
            }
            .padding()
        }
    }

    return PreviewWrapper()
}
