//
//  ProgressBarView.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

struct ProgressBarView: View {

    let progress: Double
    var backgroundColor: Color = Color.gray.opacity(0.3)
    var accentColor: Color = .blue
    var borderWidth: CGFloat = 0
    var borderColor: Color = .clear
    var height: CGFloat = 8
    var cornerRadius: CGFloat = 4

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .frame(height: height)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(borderColor, lineWidth: borderWidth)
                    )

                // Progress
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(accentColor)
                    .frame(width: geometry.size.width * progress, height: height)
            }
        }
        .frame(height: height)
    }
}

#Preview {
    VStack(spacing: 24) {
        ProgressBarView(progress: 0.25)

        ProgressBarView(
            progress: 0.5,
            backgroundColor: .gray.opacity(0.2),
            accentColor: .green
        )

        ProgressBarView(
            progress: 0.75,
            backgroundColor: .yellow.opacity(0.2),
            accentColor: .orange,
            borderWidth: 2,
            borderColor: .orange
        )

        ProgressBarView(
            progress: 1.0,
            backgroundColor: .blue.opacity(0.2),
            accentColor: .blue,
            height: 24,
            cornerRadius: 12
        )
    }
    .padding(16)
}
