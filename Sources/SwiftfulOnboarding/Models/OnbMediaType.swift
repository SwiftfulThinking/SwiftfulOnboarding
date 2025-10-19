//
//  OnbMediaType.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI
import Lottie

enum OnbMediaType {
    case image(urlString: String, size: OnbMediaSize = .auto, cornerRadius: CGFloat = 0)
    case systemIcon(named: String, size: OnbMediaSize = .auto)
    case video(urlString: String, size: OnbMediaSize = .auto, loop: Bool = true, cornerRadius: CGFloat = 0)
    case lottie(urlString: String, size: OnbMediaSize = .auto, loopMode: LottieLoopMode = .loop, cornerRadius: CGFloat = 0)

    var size: OnbMediaSize {
        switch self {
        case .image(_, let size, _):
            return size
        case .systemIcon(_, let size):
            return size
        case .video(_, let size, _, _):
            return size
        case .lottie(_, let size, _, _):
            return size
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .image(_, _, let cornerRadius):
            return cornerRadius
        case .systemIcon:
            return 0
        case .video(_, _, _, let cornerRadius):
            return cornerRadius
        case .lottie(_, _, _, let cornerRadius):
            return cornerRadius
        }
    }
}