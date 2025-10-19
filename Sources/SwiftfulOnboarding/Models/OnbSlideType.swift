//
//  OnbSlideType.swift
//  SwiftfulOnboarding
//
//  Created on 10/18/25.
//

import SwiftUI

protocol OnbSlideProtocol {
    var id: String { get }
}

enum OnbSlideType: OnbSlideProtocol {
    case regular(
        id: String,
        title: String? = nil,
        subtitle: String? = nil,
        media: OnbMediaType? = nil,
        mediaSize: OnbMediaSize = .large,
        mediaPosition: OnbMediaPosition = .top,
        ctaText: String = "Continue",
        ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    )

    var id: String {
        switch self {
        case .regular(let id, _, _, _, _, _, _, _):
            return id
        }
    }
}