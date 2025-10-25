//
//  OnbSlideData.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

/// Simplified selection data returned in slide completion callback
public struct OnbSelectionData {
    public var id: String
    public var text: String?
    public var value: Any?

    public init(id: String, text: String? = nil, value: Any? = nil) {
        self.id = id
        self.text = text
        self.value = value
    }
}

/// Data passed to onSlideComplete callback containing slide info and user selections
public struct OnbSlideData {
    public var slideId: String
    public var slideTitle: String?
    public var slideType: String
    public var selections: [OnbSelectionData]

    public init(slideId: String, slideTitle: String? = nil, slideType: String, selections: [OnbSelectionData]) {
        self.slideId = slideId
        self.slideTitle = slideTitle
        self.slideType = slideType
        self.selections = selections
    }
}

/// Data passed to onFlowComplete callback containing all slide data from the entire flow
public struct OnbFlowData {
    public var slides: [OnbSlideData]

    public init(slides: [OnbSlideData]) {
        self.slides = slides
    }
}
