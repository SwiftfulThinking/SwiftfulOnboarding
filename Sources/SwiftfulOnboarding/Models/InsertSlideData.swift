//
//  InsertSlideData.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

enum InsertSlidePlacement {
    case next
    case after(slideId: String)
    case after(slideCount: Int)
}

struct InsertSlideData {
    var placement: InsertSlidePlacement
    var slide: OnbSlideType
}
