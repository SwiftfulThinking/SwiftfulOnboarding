//
//  OnboardingHeaderView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

enum HeaderStyle {
    case progressBar
    case count
    case none
}

enum HeaderAlignment {
    case center
    case right
}

struct OnboardingHeaderView: View {

    var style: HeaderStyle = .progressBar
    var alignment: HeaderAlignment = .center
    var currentPage: Int = 1
    var totalPages: Int = 10
    var showBackButton: Bool = true

    var body: some View {
        ZStack {
            // Back button on the left
            Button(action: {
                // Back action
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.primary)
                    .frame(width: 40, height: 40)
            }
            .opacity(showBackButton ? 1 : 0)
            .frame(maxWidth: .infinity, alignment: .leading)

            // Progress indicator based on style and alignment
            switch style {
            case .progressBar:
                if alignment == .center {
                    ProgressBarView(
                        progress: Double(currentPage) / Double(totalPages),
                        backgroundColor: Color.gray.opacity(0.3),
                        accentColor: .blue,
                        borderWidth: 0,
                        borderColor: .clear,
                        height: 8,
                        cornerRadius: 4
                    )
                    .padding(.horizontal, 64) // Leave space for back button
                } else {
                    ProgressBarView(
                        progress: Double(currentPage) / Double(totalPages),
                        backgroundColor: Color.gray.opacity(0.3),
                        accentColor: .blue,
                        borderWidth: 0,
                        borderColor: .clear,
                        height: 8,
                        cornerRadius: 4
                    )
                    .frame(maxWidth: 120)
                    .padding(.leading, 120)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 8)
                }

            case .count:
                Text("\(currentPage)/\(totalPages)")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: alignment == .center ? .center : .trailing)
                    .padding(.horizontal, alignment == .center ? 64 : 8)

            case .none:
                EmptyView()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

#Preview {
    VStack(spacing: 40) {
        // Progress bar centered
        OnboardingHeaderView(
            style: .progressBar,
            alignment: .center,
            currentPage: 3,
            totalPages: 10
        )
        .background(Color.gray.opacity(0.1))

        // Progress bar right aligned
        OnboardingHeaderView(
            style: .progressBar,
            alignment: .right,
            currentPage: 5,
            totalPages: 10
        )
        .background(Color.gray.opacity(0.1))

        // Count centered
        OnboardingHeaderView(
            style: .count,
            alignment: .center,
            currentPage: 2,
            totalPages: 8
        )
        .background(Color.gray.opacity(0.1))

        // Count right aligned
        OnboardingHeaderView(
            style: .count,
            alignment: .right,
            currentPage: 7,
            totalPages: 12
        )
        .background(Color.gray.opacity(0.1))

        // None style
        OnboardingHeaderView(
            style: .none,
            alignment: .center,
            currentPage: 1,
            totalPages: 5
        )
        .background(Color.gray.opacity(0.1))

        // Progress bar with no back button
        OnboardingHeaderView(
            style: .progressBar,
            alignment: .center,
            currentPage: 1,
            totalPages: 10,
            showBackButton: false
        )
        .background(Color.gray.opacity(0.1))
    }
}
