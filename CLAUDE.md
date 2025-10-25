# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

```bash
# Build the package
swift build

# Run tests
swift test

# Clean build artifacts
swift package clean

# Generate Xcode project
swift package generate-xcodeproj
```

## Architecture

This is a Swift Package for creating reusable onboarding views in SwiftUI. The package follows a clean MVVM architecture.

### Project Intent
Creating a reusable SwiftfulOnboardingView component with:
- Main View with ViewModel
- Sub-views for different components
- Header component
- Different question type components (to be implemented)

### Core Components

- **SwiftfulOnboardingView**: Main container view for the onboarding flow
  - Uses @StateObject for ViewModel
  - Will contain header and question components

- **SwiftfulOnboardingViewModel**: ViewModel managing onboarding state
  - Must use @MainActor
  - ObservableObject class
  - Start simple, no logic initially

- **OnboardingHeaderView**: Configurable header with back button and progress indicator
  - Back button always on the left (chevron.left icon, size 24)
  - Progress indicator in middle or right based on alignment
  - Supports three styles: `.progressBar`, `.count`, `.none`
  - Supports two alignments: `.center`, `.right`

- **ProgressBarView**: Reusable progress bar component
  - Customizable: backgroundColor, accentColor, borderWidth, borderColor, height, cornerRadius
  - Default values provided for all properties
  - Used within OnboardingHeaderView

### Project Structure

```
Sources/SwiftfulOnboarding/
├── Views/                    # Main views
├── ViewModels/              # View models
└── Components/              # Reusable UI components
```

## Design Guidelines

### Spacing Standards
All spacing values must use these specific increments: 4, 8, 12, 16, 24, 32, 40, 64 pixels
- Always be explicit with spacings and paddings
- Never use arbitrary values or rely on defaults

### Access Modifiers
- **NEVER** add `public` modifiers during development
- All types and members should be internal by default
- Access levels will be set at project completion only
- Remove any existing public modifiers when found

### Component Properties
When creating views with customizable properties:
- Use `var` with default values instead of `let` to enable memberwise initialization
- This allows both default usage and customized initialization without writing custom init
- Do NOT create custom init methods unless absolutely necessary
- Example: `var backgroundColor: Color = .gray.opacity(0.3)` not `let backgroundColor: Color`

### Previews
- **MANDATORY**: Every View must include a #Preview block
- Previews should demonstrate different configurations and states
- Include multiple examples showing various parameter combinations

### View Creation Guidelines
- Start with minimal/blank components first
- Do not add logic or implementation details until explicitly requested
- Keep ViewModels simple - start with just `@MainActor class ViewModel: ObservableObject {}`
- Build up complexity incrementally based on specific requirements

### Layout Guidelines
- **Prefer `.frame(maxWidth: .infinity)` over `Spacer()`** for layout
- Use `.frame(maxWidth: .infinity, alignment: .leading)` for left alignment
- Use `.frame(maxWidth: .infinity, alignment: .trailing)` for right alignment
- Only use `Spacer()` when specifically needed for flexible spacing between elements

### Header Component Specifications
The OnboardingHeaderView has specific requirements:
- **Styles**: `.progressBar`, `.dots`, `.count`, `.none`
- **Alignments**: `.center`, `.right`
- Progress bar shows current progress
- Dots show individual page indicators
- Count shows format like "5/10"
- None shows no progress indicator

---

## Configuration System

### Main Entry Point: OnbConfiguration
The root configuration object containing all onboarding setup:
```swift
struct OnbConfiguration {
    var headerConfiguration: OnbHeaderConfiguration = .default
    var slides: [OnbSlideType] = []
    var slideDefaults: OnbSlideDefaults = .default
    var onSlideComplete: ((OnbSlideData) -> Void)? = nil
    var onFlowComplete: ((OnbFlowData) -> Void)? = nil
}
```

### Header Configuration
```swift
struct OnbHeaderConfiguration {
    var headerStyle: HeaderStyle = .progressBar  // .progressBar, .dots, .count, .none
    var headerAlignment: HeaderAlignment = .center  // .center, .right
    var showBackButton: OnbBackButtonBehavior = .afterFirstSlide  // .always, .afterFirstSlide, .never
    var backButtonColor: Color = .primary
}
```

### Slide Defaults (OnbSlideDefaults)
Centralized defaults applied to all slides unless overridden per-slide:

**Title & Subtitle:**
- `titleFont: Font = .largeTitle`
- `subtitleFont: Font = .body`
- `titleSubtitleSpacing: CGFloat = 8`
- `titleAlignment: OnbTextAlignment = .center` (.leading, .center, .trailing)

**Content:**
- `contentAlignment: OnbContentAlignment = .center` (.top, .center, .bottom)
- `paddingTop: CGFloat = 40`
- `paddingBottom: CGFloat = 0`
- `horizontalPaddingContent: CGFloat = 0`
- `horizontalPaddingTitle: CGFloat = 40`
- `contentSpacing: CGFloat = 24`

**Footer:**
- `footerData: OnbFooterData = .default`
  - `leading: 24, trailing: 24, bottom: 24, top: 24, cornerRadius: 12`
- `ctaText: String = "Continue"`
- `ctaButtonStyle: OnbButtonStyleType = .solid(...)`
- `ctaButtonFormatData: OnbButtonFormatData = .default`
  - `pressStyle: .press` (.press, .opacity, .tap)
  - `font: .headline`
  - `height: .verticalPadding(12)` or `.fixed(CGFloat)`
  - `cornerRadius: 12`

**Media:**
- `mediaPosition: OnbMediaPosition = .top` (.top, .bottom)

**Feedback:**
- `feedbackStyle: AnyFeedbackViewStyle = .top()` (.top, .bottom with transitions)

**Selection:**
- `selectionBehavior: OnbSelectionBehavior = .single()` (.single(autoAdvance: Bool), .multi)

**Multiple Choice Options:**
- `optionsSpacing: CGFloat = 12`
- `optionsButtonStyle: OnbButtonStyleType = .solidOutline(...)`
- `optionsButtonFormatData: OnbButtonFormatData = .default`
- `isGrid: Bool = false`

**Secondary Button (primaryAction slide):**
- `secondaryButtonStyle: OnbButtonStyleType = .outline(...)`
- `secondaryButtonFormatData: OnbButtonFormatData = .default`
- `secondaryButtonSpacing: CGFloat = 12`

**Background & Transitions:**
- `background: OnbBackgroundType = .solidColor(.clear)`
  - `.solidColor(Color)`
  - `.gradient(Gradient, startPoint: UnitPoint, endPoint: UnitPoint)`
  - `.image(urlString: String)`
- `transitionStyle: OnbTransitionStyle = .slide` (.none, .opacity, .slide, .fade)

---

## Slide Types

### 1. Regular Slide (`.regular`)
Basic slide with title, subtitle, media, and CTA button.

**Parameters:**
- `id: String` - Required unique identifier
- `title, subtitle, titleFont, subtitleFont, titleSubtitleSpacing, titleAlignment`
- `media: OnbMediaType?` - See Media Types section
- `mediaPosition: OnbMediaPosition?` - .top or .bottom
- `contentAlignment, paddingTop, paddingBottom, horizontalPaddingContent, horizontalPaddingTitle, contentSpacing`
- `footerData, ctaText, ctaButtonStyle, ctaButtonFormatData`
- `background: OnbBackgroundType?`
- `showBackButton: Bool?` - Per-slide override
- `backButtonColor: Color?`

### 2. Multiple Choice Slide (`.multipleChoice`)
Slide with selectable options in vertical list or grid.

**Parameters:**
- All regular slide parameters EXCEPT `media`
- `options: [OnbChoiceOption]` - Required
- `optionsSpacing, optionsButtonStyle, optionsButtonFormatData`
- `selectionBehavior: OnbSelectionBehavior?` - .single or .multi
- `isGrid: Bool?` - Display options in 2-column grid
- `feedbackStyle: AnyFeedbackViewStyle?` - Show feedback on selection

**OnbChoiceOption:**
```swift
struct OnbChoiceOption {
    var id: String
    var content: OnbButtonContentData
    var responseConfiguration: OnbResponseConfiguration?
    var feedbackConfiguration: OnbFeedbackConfiguration?
    var insertConfiguration: [InsertSlideData]?
}
```

### 3. Yes/No Slide (`.yesNo`)
Special multiple choice with two options (yes/no).

**Parameters:**
- All regular slide parameters
- `optionsSpacing, yesOption, noOption, optionsButtonStyle, optionsButtonFormatData`
- `selectionBehavior, feedbackStyle`

### 4. Rating Slide (`.rating`)
Slide with 1-5 rating scale.

**Parameters:**
- All regular slide parameters
- `optionsButtonStyle`
- `ratingCornerRadius: CGFloat = 32`
- `ratingButtonOption: OnbRatingButtonOption = .thumbs` (.number, .thumbs)
- `ratingFont: Font = .title.weight(.medium)`
- `ratingLabels: RatingFooterLabels?`
  - `leadingLabel, trailingLabel, labelPlacement (.top, .bottom), labelFont, labelColor`
- `selectionBehavior, feedbackStyle`
- `getResponseConfiguration: ((Int) -> OnbResponseConfiguration?)?`
- `getFeedbackConfiguration: ((Int) -> OnbFeedbackConfiguration?)?`
- `getInsertConfiguration: ((Int) -> [InsertSlideData]?)?`

### 5. Text Input Slide (`.textInput`)
Slide with text field input.

**Parameters:**
- Basic title/subtitle parameters
- `contentAlignment, paddingTop, paddingBottom, horizontalPaddingTitle, contentSpacing`
- `textFieldKeyboardType: UIKeyboardType = .default`
- `footerData, ctaText, ctaButtonStyle, ctaButtonFormatData`
- `background, showBackButton, backButtonColor`

### 6. Date Picker Slide (`.datePicker`)
Slide with native date/time picker.

**Parameters:**
- Basic title/subtitle parameters
- `contentAlignment, paddingTop, paddingBottom, horizontalPaddingTitle, contentSpacing`
- `datePickerPosition: OnbDatePickerPosition = .auto` (.auto, .bottom)
- `datePickerStyle: OnbDatePickerStyle = .graphical` (.graphical, .wheel, .compact)
- `datePickerComponents: OnbDatePickerComponents = .date` (.date, .dateTime, .time)
- `datePickerStartDate, datePickerMinimumDate, datePickerMaximumDate: Date?`
- `horizontalPaddingContent, footerData, ctaText, ctaButtonStyle, ctaButtonFormatData`
- `background, showBackButton, backButtonColor`

### 7. Picker Slide (`.picker`)
Slide with custom picker options.

**Parameters:**
- Basic title/subtitle parameters
- `contentAlignment, paddingTop, paddingBottom, horizontalPaddingTitle, contentSpacing`
- `pickerPosition: OnbPickerPosition = .auto` (.auto, .bottom)
- `pickerStyle: OnbPickerStyle = .wheel` (.wheel, .menu, .inline, .segmented)
- `pickerOptions: [String]` - Required
- `horizontalPaddingContent, footerData, ctaText, ctaButtonStyle, ctaButtonFormatData`
- `background, showBackButton, backButtonColor`

### 8. Primary Action Slide (`.primaryAction`)
Slide with primary and optional secondary button.

**Parameters:**
- All regular slide parameters
- `secondaryButtonText: String?`
- `secondaryButtonStyle, secondaryButtonFormatData, secondaryButtonSpacing`
- `onDidPressPrimaryButton: ((@escaping () -> Void) -> Void)?` - Callback with completion handler

---

## Media Types (OnbMediaType)

### Image
```swift
.image(
    urlString: String,
    size: OnbMediaSize = .auto,
    aspectRatio: OnbMediaAspectRatio = .auto,
    cornerRadius: CGFloat = 0,
    borderColor: Color? = nil,
    borderWidth: CGFloat = 0,
    selectedBorderColor: Color? = nil,
    selectedBorderWidth: CGFloat? = nil
)
```

### System Icon
```swift
.systemIcon(named: String, size: OnbMediaSize = .auto)
```

### Video
```swift
.video(
    urlString: String,
    size: OnbMediaSize = .auto,
    aspectRatio: OnbMediaAspectRatio = .auto,
    useSwiftUIVideoPlayer: Bool = false,
    loop: Bool = true,
    cornerRadius: CGFloat = 0,
    borderColor: Color? = nil,
    borderWidth: CGFloat = 0,
    selectedBorderColor: Color? = nil,
    selectedBorderWidth: CGFloat? = nil
)
```

### Lottie Animation
```swift
.lottie(
    urlString: String,
    size: OnbMediaSize = .auto,
    aspectRatio: OnbMediaAspectRatio = .auto,
    loopMode: LottieLoopMode = .loop,
    cornerRadius: CGFloat = 0,
    borderColor: Color? = nil,
    borderWidth: CGFloat = 0,
    selectedBorderColor: Color? = nil,
    selectedBorderWidth: CGFloat? = nil
)
```

**OnbMediaSize:**
- `.auto` - Flexible sizing
- `.small` - iPad: 120x120, iPhone: 64x64
- `.medium` - iPad: 300x300, iPhone: 180x180
- `.large` - iPad: 450x450, iPhone: 300x300
- `.fixed(width: CGFloat, height: CGFloat)`

**OnbMediaAspectRatio:** `.auto`, `.square`, `.portrait`, `.landscape`

---

## Button Styles (OnbButtonStyleType)

### Solid
```swift
.solid(
    backgroundColor: Color,
    textColor: Color,
    selectedBackgroundColor: Color? = nil,
    selectedTextColor: Color? = nil
)
```

### Outline
```swift
.outline(
    textColor: Color,
    borderColor: Color,
    borderWidth: CGFloat = 2,
    selectedTextColor: Color? = nil,
    selectedBorderColor: Color? = nil
)
```

### Solid Outline
```swift
.solidOutline(
    backgroundColor: Color,
    textColor: Color,
    borderColor: Color,
    borderWidth: CGFloat = 2,
    selectedBackgroundColor: Color? = nil,
    selectedTextColor: Color? = nil,
    selectedBorderColor: Color? = nil
)
```

### Duolingo Style (3D effect)
```swift
.duolingo(
    backgroundColor: Color,
    textColor: Color,
    shadowColor: Color,
    selectedBackgroundColor: Color? = nil,
    selectedTextColor: Color? = nil,
    selectedShadowColor: Color? = nil
)
```

---

## Button Content (OnbButtonContentData)

Defines content within buttons for multipleChoice/yesNo slides:

```swift
struct OnbButtonContentData {
    var text: String
    var subtitle: String? = nil
    var textPlacement: OnbButtonTextPlacement = .center  // .center, .leading
    var secondaryContent: OnbButtonSecondaryContent? = nil
    var secondaryContentPlacement: OnbButtonSecondaryContentPlacement = .trailing
    var mediaContent: OnbMediaType? = nil
    var mediaContentPlacement: OnbMediaContentPlacement = .top  // .top, .bottom
    var value: Any? = nil
}
```

**OnbButtonSecondaryContent:**
- `.emoji(String)`
- `.checkbox(style: OnbCheckboxStyle, isChecked: Bool, borderColor: Color, fillColor: Color)`
  - OnbCheckboxStyle: `.circle`, `.square`
- `.media(media: OnbMediaType)`

**OnbButtonSecondaryContentPlacement:** `.leading`, `.centerLeading`, `.centerTrailing`, `.trailing`

---

## Response & Feedback

### Response Configuration (OnbResponseConfiguration)
Shows full-screen response after selection (e.g., quiz answer feedback).

```swift
struct OnbResponseConfiguration {
    var style: AnyResponseViewStyle = .center(transition: .slide)
    var backgroundColor: Color = .blue
    var borderWidth: CGFloat = 0
    var borderColor: Color = .clear
    var cornerRadius: CGFloat = 24
    var horizontalPadding: CGFloat = 0
    var title, subtitle, titleFont, subtitleFont, titleSubtitleSpacing, titleAlignment
    var paddingTop: CGFloat = 40
    var paddingBottom: CGFloat = 0
    var footerData: OnbFooterData = .default
    var ctaText, ctaButtonStyle, ctaButtonFormatData
}
```

**AnyResponseViewStyle:**
- `.bottom(transition: AnyResponseViewTransition)` - Slides from bottom
- `.center(transition: AnyResponseViewTransition)` - Appears in center

**AnyResponseViewTransition:** `.slide`, `.scale`, `.fade`, `.opacity`, `.bottom`, `.none`

### Feedback Configuration (OnbFeedbackConfiguration)
Shows inline feedback banner after selection.

```swift
struct OnbFeedbackConfiguration {
    var backgroundColor: Color = .green
    var borderWidth, borderColor, cornerRadius, horizontalPadding
    var title, subtitle, titleFont, subtitleFont, titleSubtitleSpacing, titleAlignment
    var paddingTop, paddingBottom, paddingHorizontal
}
```

**AnyFeedbackViewStyle:**
- `.top(transition: AnyFeedbackViewTransition)` - Top of slide
- `.bottom(transition: AnyFeedbackViewTransition)` - Bottom of slide

**AnyFeedbackViewTransition:** `.slide`, `.scale`, `.fade`, `.opacity`, `.none`

---

## Dynamic Slide Insertion

Insert slides dynamically based on user selections:

```swift
struct InsertSlideData {
    var placement: InsertSlidePlacement
    var slide: OnbSlideType
}
```

**InsertSlidePlacement:**
- `.next` - Insert immediately after current slide
- `.afterSlide(id: String)` - Insert after specific slide ID
- `.afterCount(count: Int)` - Insert N slides from current

Add to `OnbChoiceOption.insertConfiguration: [InsertSlideData]?`

---

## Callbacks

### onSlideComplete
Called when user advances from a slide:

```swift
var onSlideComplete: ((OnbSlideData) -> Void)? = nil
```

**OnbSlideData:**
```swift
struct OnbSlideData {
    var slideId: String
    var slideTitle: String?
    var slideType: String
    var selections: [OnbSelectionData]
}

struct OnbSelectionData {
    var id: String
    var text: String?
    var value: Any?
}
```

### onFlowComplete
Called when entire onboarding flow completes:

```swift
var onFlowComplete: ((OnbFlowData) -> Void)? = nil
```

**OnbFlowData:**
```swift
struct OnbFlowData {
    var slides: [OnbSlideData]
}
```

---

## Development Approach

### Key Principles from Initial Development
1. **No implied logic** - Don't assume implementation details
2. **Start with base/blank components** - Create minimal structures first
3. **Remove unnecessary boilerplate** - No custom inits when defaults work
4. **Explicit values only** - Especially for spacing (4, 8, 12, 16, 24, 32, 40, 64)
5. **Build incrementally** - Add complexity only when requested

### Important Reminders
- The package must compile at all times
- Use `var` properties with default values to avoid needing custom initializers
- All Views need Preview blocks for testing
- Keep components reusable and configurable
- Focus on clean, simple APIs

## Platform Support

- iOS 15.0+
- macOS 12.0+