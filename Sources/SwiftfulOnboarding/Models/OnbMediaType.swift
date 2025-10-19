//
//  OnbMediaType.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI
import Lottie

enum OnbMediaType {
    case image(urlString: String, cornerRadius: CGFloat = 0)
    case systemIcon(named: String)
    case video(urlString: String, loop: Bool = true, cornerRadius: CGFloat = 0)
    case lottie(urlString: String, loopMode: LottieLoopMode = .loop, cornerRadius: CGFloat = 0)

    var cornerRadius: CGFloat {
        switch self {
        case .image(_, let cornerRadius):
            return cornerRadius
        case .systemIcon:
            return 0
        case .video(_, _, let cornerRadius):
            return cornerRadius
        case .lottie(_, _, let cornerRadius):
            return cornerRadius
        }
    }
}