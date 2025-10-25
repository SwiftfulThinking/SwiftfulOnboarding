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

    public var eventParameters: [String: Any] {
        var params: [String: Any] = [
            "onbslide_id": slideId,
            "onbslide_type": slideType
        ]

        if let slideTitle {
            params["onbslide_title"] = slideTitle
        }

        if !selections.isEmpty {
            params["onbslide_selection_count"] = selections.count

            let sortedIds = selections.map { $0.id }.sorted()
            params["onbslide_selection_ids"] = sortedIds

            let sortedTexts = selections.compactMap { $0.text }.sorted()
            if !sortedTexts.isEmpty {
                params["onbslide_selection_texts"] = sortedTexts
            }
        }

        return params
    }
}

/// Data passed to onFlowComplete callback containing all slide data from the entire flow
public struct OnbFlowData {
    public var slides: [OnbSlideData]

    public init(slides: [OnbSlideData]) {
        self.slides = slides
    }

    public var eventParameters: [String: Any] {
        var params: [String: Any] = [
            "onbflow_total_slides": slides.count
        ]

        // Add all unique slide IDs in order
        let slideIds = slides.map { $0.slideId }
        params["onbflow_slide_ids"] = slideIds

        // Add all unique slide types
        let slideTypes = slides.map { $0.slideType }
        params["onbflow_slide_types"] = slideTypes

        return params
    }
}
