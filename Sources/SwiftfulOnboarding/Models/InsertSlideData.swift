//
//  InsertSlideData.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

public enum InsertSlidePlacement {
    case next
    case afterSlide(id: String)
    case afterCount(count: Int)
}

public struct InsertSlideData {
    public var placement: InsertSlidePlacement
    public var slide: OnbSlideType

    public init(placement: InsertSlidePlacement, slide: OnbSlideType) {
        self.placement = placement
        self.slide = slide
    }
}
