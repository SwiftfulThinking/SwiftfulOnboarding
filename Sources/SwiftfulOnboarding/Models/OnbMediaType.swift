//
//  OnbMediaType.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI
import Lottie

enum OnbMediaType {
    case image(urlString: String)
    case systemIcon(named: String)
    case video(urlString: String, loop: Bool = true)
    case lottie(urlString: String, loopMode: LottieLoopMode = .loop)
}