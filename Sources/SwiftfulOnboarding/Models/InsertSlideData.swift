//
//  InsertSlideData.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

enum InsertSlidePlacement {
    case next
    case afterSlide(id: String)
    case afterCount(count: Int)
}

struct InsertSlideData {
    var placement: InsertSlidePlacement
    var slide: OnbSlideType
}
