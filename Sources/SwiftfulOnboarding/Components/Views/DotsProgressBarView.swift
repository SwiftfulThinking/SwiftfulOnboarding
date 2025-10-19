//
//  DotsProgressBarView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

struct DotsProgressBarView: View {

    let currentPage: Int
    let totalPages: Int
    var backgroundColor: Color = Color.gray.opacity(0.3)
    var accentColor: Color = .blue
    var borderWidth: CGFloat = 0
    var borderColor: Color = .clear
    var height: CGFloat = 8
    var spacing: CGFloat = 8

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<totalPages, id: \.self) { index in
                Circle()
                    .fill(index < currentPage ? accentColor : backgroundColor)
                    .frame(width: height, height: height)
                    .overlay(
                        Circle()
                            .stroke(borderColor, lineWidth: borderWidth)
                    )
            }
        }
    }
}

#Preview {
    VStack(spacing: 24) {
        DotsProgressBarView(
            currentPage: 3,
            totalPages: 5
        )

        DotsProgressBarView(
            currentPage: 2,
            totalPages: 7,
            backgroundColor: .gray.opacity(0.2),
            accentColor: .green
        )

        DotsProgressBarView(
            currentPage: 5,
            totalPages: 8,
            backgroundColor: .yellow.opacity(0.2),
            accentColor: .orange,
            borderWidth: 2,
            borderColor: .orange
        )

        DotsProgressBarView(
            currentPage: 6,
            totalPages: 10,
            backgroundColor: .blue.opacity(0.2),
            accentColor: .blue,
            height: 12,
            spacing: 12
        )
    }
    .padding(16)
}
