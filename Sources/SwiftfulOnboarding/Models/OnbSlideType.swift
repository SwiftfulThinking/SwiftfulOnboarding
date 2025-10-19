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
    case regular(id: String, title: String? = nil, subtitle: String? = nil, media: OnbMediaType? = nil)

    var id: String {
        switch self {
        case .regular(let id, _, _, _):
            return id
        }
    }
}