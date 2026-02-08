# SwiftfulOnboarding

Configurable onboarding flow library for SwiftUI. 8 slide types, inline feedback, full-screen responses, dynamic slide insertion, and progress tracking. iOS 15+.

## Setup

```swift
import SwiftfulOnboarding

SwiftfulOnboardingView(
    configuration: OnbConfiguration(
        headerConfiguration: OnbHeaderConfiguration(...),
        slides: [...],
        slideDefaults: OnbSlideDefaults(...),
        onSlideComplete: { slideData in ... },
        onFlowComplete: { flowData in ... }
    )
)
```

- `SwiftfulOnboardingView` is the single entry point — it manages all state internally via `SwiftfulOnboardingViewModel`
- `OnbConfiguration` holds header config, slides array, defaults, and callbacks
- All slide parameters are optional except `id` — unset values fall back to `OnbSlideDefaults`

## Slide Types

### OnbSlideType — 8 cases

```swift
.regular(id:, title:, subtitle:, media:, mediaPosition:, contentAlignment:, ctaText:, ...)
.multipleChoice(id:, title:, options:, selectionBehavior:, isGrid:, feedbackStyle:, ...)
.yesNo(id:, title:, yesOption:, noOption:, selectionBehavior:, feedbackStyle:, ...)
.rating(id:, title:, ratingButtonOption:, ratingLabels:, getResponseConfiguration:, getFeedbackConfiguration:, getInsertConfiguration:, ...)
.textInput(id:, title:, textFieldKeyboardType:, ...)
.datePicker(id:, title:, datePickerStyle:, datePickerComponents:, datePickerStartDate:, datePickerMinimumDate:, datePickerMaximumDate:, ...)
.picker(id:, title:, pickerStyle:, pickerOptions:, ...)
.primaryAction(id:, title:, ctaText:, secondaryButtonText:, onDidPressPrimaryButton:, ...)
```

### OnbChoiceOption — selection option for multipleChoice, yesNo, rating

```swift
OnbChoiceOption(
    id: String,
    content: OnbButtonContentData,
    responseConfiguration: OnbResponseConfiguration?,    // full-screen response overlay
    feedbackConfiguration: OnbFeedbackConfiguration?,    // inline feedback banner
    insertConfiguration: [InsertSlideData]?              // dynamic slide insertion
)
```

### OnbButtonContentData — button label content

```swift
OnbButtonContentData(
    text: String,
    subtitle: String?,
    textPlacement: OnbButtonTextPlacement,                // .center, .leading
    secondaryContent: OnbButtonSecondaryContent?,         // .emoji(String), .checkbox(...), .media(media:)
    secondaryContentPlacement: OnbButtonSecondaryContentPlacement,  // .leading, .centerLeading, .centerTrailing, .trailing
    mediaContent: OnbMediaType?,                          // top/bottom media within button
    mediaContentPlacement: OnbMediaContentPlacement,      // .top, .bottom
    value: Any?                                           // custom data passed through to callbacks
)
```

### OnbSelectionBehavior

- `.single(autoAdvance: Bool)` — one selection; `autoAdvance: true` skips the CTA button
- `.multi(max: Int?)` — multiple selections; `max: nil` is unlimited, `max: 3` caps at 3

## Media

```swift
.systemIcon(named: String, size: OnbMediaSize)
.image(urlString: String, size:, aspectRatio:, cornerRadius:, borderColor:, borderWidth:, selectedBorderColor:, selectedBorderWidth:)
.video(urlString: String, size:, aspectRatio:, useSwiftUIVideoPlayer:, loop:, cornerRadius:, borderColor:, borderWidth:, selectedBorderColor:, selectedBorderWidth:)
.lottie(urlString: String, size:, aspectRatio:, loopMode:, cornerRadius:, borderColor:, borderWidth:, selectedBorderColor:, selectedBorderWidth:)
```

- **OnbMediaSize:** `.auto`, `.small`, `.medium`, `.large`, `.fixed(width:height:)`
- **OnbMediaAspectRatio:** `.auto`, `.square`, `.portrait`, `.landscape`
- Image loading uses SDWebImageSwiftUI; Lottie uses the Lottie package

## Customization

### OnbSlideDefaults — centralized defaults for all slides

Every slide parameter has a corresponding default in `OnbSlideDefaults`. Individual slide values override defaults when set. Key properties:

- `titleFont`, `subtitleFont`, `titleAlignment`, `titleSubtitleSpacing`
- `contentAlignment`, `paddingTop`, `paddingBottom`, `horizontalPaddingContent`, `horizontalPaddingTitle`, `contentSpacing`
- `ctaText`, `ctaButtonStyle`, `ctaButtonFormatData`, `footerData`
- `optionsButtonStyle`, `optionsButtonFormatData`, `optionsSpacing`, `isGrid`
- `selectionBehavior`, `feedbackStyle`, `feedbackConfiguration`, `responseConfiguration`
- `secondaryButtonStyle`, `secondaryButtonFormatData`, `secondaryButtonSpacing`
- `background: OnbBackgroundType`, `transitionStyle: OnbTransitionStyle`
- `mediaPosition: OnbMediaPosition`

### OnbHeaderConfiguration

```swift
OnbHeaderConfiguration(
    headerStyle: HeaderStyle,                  // .progressBar, .dots, .count, .none
    headerAlignment: HeaderAlignment,          // .center, .right
    showBackButton: OnbBackButtonBehavior,     // .always, .afterFirstSlide, .never
    backButtonColor: Color,
    progressBarAccentColor: Color
)
```

### Button Styles — OnbButtonStyleType

```swift
.solid(backgroundColor:, textColor:, selectedBackgroundColor:, selectedTextColor:)
.outline(textColor:, borderColor:, borderWidth:, selectedTextColor:, selectedBorderColor:)
.solidOutline(backgroundColor:, textColor:, borderColor:, borderWidth:, selectedBackgroundColor:, selectedTextColor:, selectedBorderColor:)
.duolingo(backgroundColor:, textColor:, shadowColor:, selectedBackgroundColor:, selectedTextColor:, selectedShadowColor:)
```

### Button Format — OnbButtonFormatData

```swift
OnbButtonFormatData(
    pressStyle: OnbButtonPressStyle,  // .press, .opacity, .tap
    font: Font,
    height: OnbButtonHeight,          // .verticalPadding(CGFloat), .fixed(CGFloat)
    cornerRadius: CGFloat
)
```

### Backgrounds — OnbBackgroundType

- `.solidColor(Color)`
- `.gradient(Gradient, startPoint:, endPoint:)`
- `.image(urlString: String)`

### Transitions — OnbTransitionStyle

- `.slide`, `.opacity`, `.fade`, `.none`

## Advanced Features

### Feedback — inline banner after selection

Set per-option via `OnbChoiceOption.feedbackConfiguration`:

```swift
OnbFeedbackConfiguration(backgroundColor:, cornerRadius:, title:, subtitle:, ...)
```

Controlled by `feedbackStyle` on the slide: `.top(transition:)` or `.bottom(transition:)`

### Response — full-screen overlay after selection

Set per-option via `OnbChoiceOption.responseConfiguration`:

```swift
OnbResponseConfiguration(style:, backgroundColor:, title:, subtitle:, ctaText:, ctaButtonStyle:, ...)
```

Styles: `.center(transition:)`, `.bottom(transition:)` with transitions `.slide`, `.scale`, `.fade`, `.opacity`, `.bottom`, `.none`

### Dynamic Slide Insertion

Set per-option via `OnbChoiceOption.insertConfiguration`:

```swift
InsertSlideData(placement: InsertSlidePlacement, slide: OnbSlideType)
```

- `.next` — immediately after current slide
- `.afterSlide(id: String)` — after a specific slide
- `.afterCount(count: Int)` — N slides after current

### Rating Dynamic Closures

The `.rating` slide accepts closures that return different configurations per rating value (1-5):

- `getResponseConfiguration: ((Int) -> OnbResponseConfiguration?)?`
- `getFeedbackConfiguration: ((Int) -> OnbFeedbackConfiguration?)?`
- `getInsertConfiguration: ((Int) -> [InsertSlideData]?)?`

### Primary Action Async Work

`onDidPressPrimaryButton: ((@escaping () -> Void) -> Void)?` — perform async work (e.g. request permissions) before the slide advances. Call the completion closure when done.

## Callbacks

### onSlideComplete: ((OnbSlideData) -> Void)?

Fires each time a user completes a slide.

```swift
OnbSlideData {
    var slideId: String
    var slideTitle: String?
    var slideType: String           // "regular", "multipleChoice", "yesNo", "rating", "textInput", "datePicker", "picker", "primaryAction"
    var selections: [OnbSelectionData]
    var eventParameters: [String: Any]  // pre-formatted for analytics
}

OnbSelectionData {
    var id: String
    var text: String?
    var value: Any?
}
```

### onFlowComplete: ((OnbFlowData) -> Void)?

Fires when the user completes the entire flow.

```swift
OnbFlowData {
    var slides: [OnbSlideData]
    var eventParameters: [String: Any]  // pre-formatted for analytics
}
```

IMPORTANT: Use `eventParameters` for analytics — it provides pre-formatted dictionaries with consistent key names (`onbslide_id`, `onbslide_type`, `onbslide_selection_ids`, `onbflow_total_slides`, etc.).

## Usage Guide

### Slide type selection

- **Informational screens (welcome, features, completion):** `.regular`
- **User picks from a list:** `.multipleChoice` (single or multi-select)
- **Binary yes/no question:** `.yesNo`
- **1-5 scale or thumbs up/down:** `.rating`
- **Free-text input (name, feedback):** `.textInput`
- **Date or time selection:** `.datePicker`
- **Selecting from a long string list:** `.picker`
- **Final CTA with optional skip:** `.primaryAction`
- **Requesting permissions before advancing:** `.primaryAction` with `onDidPressPrimaryButton`

### Defaults pattern

IMPORTANT: Always configure shared styling via `OnbSlideDefaults` rather than repeating values on every slide. Only set parameters on individual slides when they need to differ from defaults.

### Button style selection for options

- **Standard multiple choice / yes-no:** `.solid` with `selectedBackgroundColor` — default gray that highlights to color on selection
- **Outlined options:** `.outline` — border-only, lightweight look
- **Checkbox-style selections:** use `OnbButtonSecondaryContent.checkbox(style:)` in the button content, not the button style
- **Gamified / playful apps:** `.duolingo` — 3D raised button with shadow, feels tactile

### When to use feedback vs response

- **Feedback** (inline banner): brief confirmation or correction. Use for quiz answers, quick validation. Stays on the current slide.
- **Response** (full-screen overlay): detailed follow-up. Use for congratulations, plan confirmations, or when the user needs to read more before continuing. Replaces the slide view.

### When to use dynamic insertion

- Use `insertConfiguration` when the next slides depend on what the user selected
- Prefer `.next` placement for immediate follow-up slides
- Use `.afterSlide(id:)` to insert at specific points in the flow
- Inserted slides integrate seamlessly — they appear in the progress bar and receive the same defaults

### Per-slide overrides

Every slide case accepts `background:`, `showBackButton:`, and `backButtonColor:` to override defaults for specific slides. Use for branded screens (e.g. a colored welcome screen) without changing the global defaults.

## VIPER Integration

In a VIPER architecture, the onboarding configuration lives in a constants file, the presenter handles callbacks, and the router handles navigation after completion.

```swift
// Constants — slide definitions
struct OnboardingConstants {
    static let slides: [OnbSlideType] = [
        .regular(id: "welcome", title: "Welcome!", media: .systemIcon(named: "star.fill")),
        .multipleChoice(id: "interests", title: "What interests you?", options: [...])
    ]
}

// View — displays the onboarding flow
struct OnboardingView: View {
    @State var presenter: OnboardingPresenter

    var body: some View {
        SwiftfulOnboardingView(
            configuration: OnbConfiguration(
                slides: OnboardingConstants.slides,
                onSlideComplete: { slideData in
                    presenter.onSlideComplete(slideData: slideData)
                },
                onFlowComplete: { flowData in
                    presenter.onFlowComplete(flowData: flowData)
                }
            )
        )
    }
}

// Presenter — analytics + navigation
@Observable @MainActor
class OnboardingPresenter {
    private let interactor: OnboardingInteractor
    private let router: OnboardingRouter

    func onSlideComplete(slideData: OnbSlideData) {
        interactor.trackEvent(eventName: "onb_slide_complete", parameters: slideData.eventParameters)
    }

    func onFlowComplete(flowData: OnbFlowData) {
        interactor.trackEvent(eventName: "onb_flow_complete", parameters: flowData.eventParameters)
        router.showCompletedView()
    }
}
```
