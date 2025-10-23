//
//  OnbSlideData.swift
//  SwiftfulOnboarding
//
//  Created on 10/22/25.
//

import SwiftUI

/// Simplified selection data returned in slide completion callback
struct OnbSelectionData {
    var id: String
    var text: String?
    var value: Any?
}

/// Data passed to onSlideComplete callback containing slide info and user selections
struct OnbSlideData {
    var slideId: String
    var slideTitle: String?
    var slideType: String
    var selections: [OnbSelectionData]
}

/// Data passed to onFlowComplete callback containing all slide data from the entire flow
struct OnbFlowData {
    var slides: [OnbSlideData]
}
