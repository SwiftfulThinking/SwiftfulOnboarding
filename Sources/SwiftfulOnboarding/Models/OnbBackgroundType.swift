//
//  OnbBackgroundType.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

enum OnbBackgroundType {
    case solidColor(Color)
    case gradient(Gradient, startPoint: UnitPoint = .top, endPoint: UnitPoint = .bottom)
    case image(urlString: String)
}
