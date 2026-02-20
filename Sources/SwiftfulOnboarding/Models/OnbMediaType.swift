//
//  OnbMediaType.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI
import Lottie

public enum OnbMediaAspectRatio {
    case auto
    case square
    case portrait
    case landscape
}

public enum OnbMediaType {
    case image(urlString: String, size: OnbMediaSize = .auto, aspectRatio: OnbMediaAspectRatio = .auto, cornerRadius: CGFloat = 0, borderColor: Color? = nil, borderWidth: CGFloat = 0, selectedBorderColor: Color? = nil, selectedBorderWidth: CGFloat? = nil)
    case bundleImage(named: String, size: OnbMediaSize = .auto, aspectRatio: OnbMediaAspectRatio = .auto, cornerRadius: CGFloat = 0, borderColor: Color? = nil, borderWidth: CGFloat = 0, selectedBorderColor: Color? = nil, selectedBorderWidth: CGFloat? = nil)
    case systemIcon(named: String, size: OnbMediaSize = .auto)
    case video(urlString: String, size: OnbMediaSize = .auto, aspectRatio: OnbMediaAspectRatio = .auto, useSwiftUIVideoPlayer: Bool = false, loop: Bool = true, cornerRadius: CGFloat = 0, borderColor: Color? = nil, borderWidth: CGFloat = 0, selectedBorderColor: Color? = nil, selectedBorderWidth: CGFloat? = nil)
    case lottie(urlString: String, size: OnbMediaSize = .auto, aspectRatio: OnbMediaAspectRatio = .auto, loopMode: LottieLoopMode = .loop, cornerRadius: CGFloat = 0, borderColor: Color? = nil, borderWidth: CGFloat = 0, selectedBorderColor: Color? = nil, selectedBorderWidth: CGFloat? = nil)

    var size: OnbMediaSize {
        switch self {
        case .image(_, let size, _, _, _, _, _, _):
            return size
        case .bundleImage(_, let size, _, _, _, _, _, _):
            return size
        case .systemIcon(_, let size):
            return size
        case .video(_, let size, _, _, _, _, _, _, _, _):
            return size
        case .lottie(_, let size, _, _, _, _, _, _, _):
            return size
        }
    }

    var aspectRatio: OnbMediaAspectRatio {
        switch self {
        case .image(_, _, let aspectRatio, _, _, _, _, _):
            return aspectRatio
        case .bundleImage(_, _, let aspectRatio, _, _, _, _, _):
            return aspectRatio
        case .systemIcon:
            return .auto
        case .video(_, _, let aspectRatio, _, _, _, _, _, _, _):
            return aspectRatio
        case .lottie(_, _, let aspectRatio, _, _, _, _, _, _):
            return aspectRatio
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .image(_, _, _, let cornerRadius, _, _, _, _):
            return cornerRadius
        case .bundleImage(_, _, _, let cornerRadius, _, _, _, _):
            return cornerRadius
        case .systemIcon:
            return 0
        case .video(_, _, _, _, _, let cornerRadius, _, _, _, _):
            return cornerRadius
        case .lottie(_, _, _, _, let cornerRadius, _, _, _, _):
            return cornerRadius
        }
    }

    var borderColor: Color? {
        switch self {
        case .image(_, _, _, _, let borderColor, _, _, _):
            return borderColor
        case .bundleImage(_, _, _, _, let borderColor, _, _, _):
            return borderColor
        case .systemIcon:
            return nil
        case .video(_, _, _, _, _, _, let borderColor, _, _, _):
            return borderColor
        case .lottie(_, _, _, _, _, let borderColor, _, _, _):
            return borderColor
        }
    }

    var borderWidth: CGFloat {
        switch self {
        case .image(_, _, _, _, _, let borderWidth, _, _):
            return borderWidth
        case .bundleImage(_, _, _, _, _, let borderWidth, _, _):
            return borderWidth
        case .systemIcon:
            return 0
        case .video(_, _, _, _, _, _, _, let borderWidth, _, _):
            return borderWidth
        case .lottie(_, _, _, _, _, _, let borderWidth, _, _):
            return borderWidth
        }
    }

    var selectedBorderColor: Color? {
        switch self {
        case .image(_, _, _, _, _, _, let selectedBorderColor, _):
            return selectedBorderColor
        case .bundleImage(_, _, _, _, _, _, let selectedBorderColor, _):
            return selectedBorderColor
        case .systemIcon:
            return nil
        case .video(_, _, _, _, _, _, _, _, let selectedBorderColor, _):
            return selectedBorderColor
        case .lottie(_, _, _, _, _, _, _, let selectedBorderColor, _):
            return selectedBorderColor
        }
    }

    var selectedBorderWidth: CGFloat? {
        switch self {
        case .image(_, _, _, _, _, _, _, let selectedBorderWidth):
            return selectedBorderWidth
        case .bundleImage(_, _, _, _, _, _, _, let selectedBorderWidth):
            return selectedBorderWidth
        case .systemIcon:
            return nil
        case .video(_, _, _, _, _, _, _, _, _, let selectedBorderWidth):
            return selectedBorderWidth
        case .lottie(_, _, _, _, _, _, _, _, let selectedBorderWidth):
            return selectedBorderWidth
        }
    }
}