//
//  OnbMediaType.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

enum OnbMediaType {
    case image(urlString: String)
    case systemIcon(named: String)
    case video(urlString: String)
    case lottie(urlString: String)
}