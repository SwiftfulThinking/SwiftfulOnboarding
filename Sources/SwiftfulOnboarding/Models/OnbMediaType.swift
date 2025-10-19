//
//  OnbMediaType.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI
import Lottie

enum OnbMediaAspectRatio {
    case auto
    case square
    case portrait
    case landscape
}

enum OnbMediaType {
    case image(urlString: String, size: OnbMediaSize = .auto, aspectRatio: OnbMediaAspectRatio = .auto, cornerRadius: CGFloat = 0)
    case systemIcon(named: String, size: OnbMediaSize = .auto)
    case video(urlString: String, size: OnbMediaSize = .auto, aspectRatio: OnbMediaAspectRatio = .auto, useSwiftUIVideoPlayer: Bool = false, loop: Bool = true, cornerRadius: CGFloat = 0)
    case lottie(urlString: String, size: OnbMediaSize = .auto, aspectRatio: OnbMediaAspectRatio = .auto, loopMode: LottieLoopMode = .loop, cornerRadius: CGFloat = 0)

    var size: OnbMediaSize {
        switch self {
        case .image(_, let size, _, _):
            return size
        case .systemIcon(_, let size):
            return size
        case .video(_, let size, _, _, _, _):
            return size
        case .lottie(_, let size, _, _, _):
            return size
        }
    }

    var aspectRatio: OnbMediaAspectRatio {
        switch self {
        case .image(_, _, let aspectRatio, _):
            return aspectRatio
        case .systemIcon:
            return .auto
        case .video(_, _, let aspectRatio, _, _, _):
            return aspectRatio
        case .lottie(_, _, let aspectRatio, _, _):
            return aspectRatio
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .image(_, _, _, let cornerRadius):
            return cornerRadius
        case .systemIcon:
            return 0
        case .video(_, _, _, _, _, let cornerRadius):
            return cornerRadius
        case .lottie(_, _, _, _, let cornerRadius):
            return cornerRadius
        }
    }
}