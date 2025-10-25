### 🚀 Learn how to build and use this package: https://www.swiftful-thinking.com/offers/REyNLwwH

# SwiftfulOnboarding 👋

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FSwiftfulThinking%2FSwiftfulOnboarding%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/SwiftfulThinking/SwiftfulOnboarding) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FSwiftfulThinking%2FSwiftfulOnboarding%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/SwiftfulThinking/SwiftfulOnboarding)

### Beautiful, customizable onboarding flows for SwiftUI applications.
- ✅ Multiple slide types (Regular, Multiple Choice, Yes/No, Rating, Text Input, Primary Action)
- ✅ Real-time feedback & response screens
- ✅ Dynamic slide insertion based on user responses
- ✅ Fully customizable styling and layouts
- ✅ Built-in support for images, Lottie animations, and system icons
- ✅ Progress tracking with callbacks

## Quick Start (TLDR)

<details>
<summary> Details (Click to expand) </summary>
<br>

Create a simple onboarding flow:

```swift
import SwiftfulOnboarding

struct ContentView: View {
    var body: some View {
        SwiftfulOnboardingView(
            configuration: OnbConfiguration(
                slides: [
                    .regular(
                        id: "welcome",
                        title: "Welcome!",
                        subtitle: "Get started with our amazing app",
                        media: .systemIcon(named: "star.fill")
                    ),
                    .multipleChoice(
                        id: "interests",
                        title: "What are you interested in?",
                        options: [
                            OnbChoiceOption(id: "tech", content: OnbButtonContentData(text: "Technology")),
                            OnbChoiceOption(id: "design", content: OnbButtonContentData(text: "Design")),
                            OnbChoiceOption(id: "business", content: OnbButtonContentData(text: "Business"))
                        ]
                    ),
                    .rating(
                        id: "rate",
                        title: "How excited are you?",
                        contentAlignment: .top,
                        ratingButtonOption: .number
                    )
                ]
            )
        )
    }
}
```

</details>

## Requirements

- iOS 15.0+ / macOS 12.0+
- Swift 5.5+
- Xcode 13.0+

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/SwiftfulThinking/SwiftfulOnboarding.git", branch: "main")
]
```

## Setup

<details>
<summary> Details (Click to expand) </summary>
<br>

Import the package:

```swift
import SwiftfulOnboarding
```

Create an onboarding configuration:

```swift
let config = OnbConfiguration(
    headerConfiguration: OnbHeaderConfiguration(
        headerStyle: .progressBar,
        headerAlignment: .center,
        showBackButton: .afterFirstSlide
    ),
    slides: [
        // Your slides here
    ]
)
```

Display the onboarding view:

```swift
SwiftfulOnboardingView(configuration: config)
```

</details>

## Slide Types

<details>
<summary> Details (Click to expand) </summary>
<br>

### Regular Slide

Simple informational slide with optional media:

```swift
.regular(
    id: "welcome",
    title: "Welcome to Our App",
    subtitle: "Discover amazing features",
    media: .systemIcon(named: "star.fill"),
    mediaPosition: .top,
    contentAlignment: .center
)
```

### Multiple Choice Slide

Present users with multiple options:

```swift
.multipleChoice(
    id: "interests",
    title: "Select your interests",
    subtitle: "Choose all that apply",
    options: [
        OnbChoiceOption(
            id: "tech",
            content: OnbButtonContentData(text: "Technology", icon: .systemIcon(named: "laptopcomputer"))
        ),
        OnbChoiceOption(
            id: "design",
            content: OnbButtonContentData(text: "Design", icon: .systemIcon(named: "paintbrush"))
        ),
        OnbChoiceOption(
            id: "business",
            content: OnbButtonContentData(text: "Business", icon: .systemIcon(named: "briefcase"))
        )
    ],
    selectionBehavior: .multi(min: 1),
    contentAlignment: .top
)
```

Multiple choice slides support:
- **Single selection**: `.single(autoAdvance: Bool)` - Select one option
- **Multi selection**: `.multi(min: Int?, max: Int?)` - Select multiple options with optional constraints
- **Grid layout**: Display options in a grid
- **Custom button styles**: Duolingo-style, solid, outline, solidOutline
- **Checkboxes**: Circle or square checkboxes for multi-select

### Yes/No Slide

Binary choice with custom labels:

```swift
.yesNo(
    id: "notifications",
    title: "Enable Notifications?",
    subtitle: "Stay updated with the latest news",
    yesText: "Yes, please",
    noText: "Maybe later",
    contentAlignment: .top
)
```

### Rating Slide

Collect user ratings:

```swift
.rating(
    id: "satisfaction",
    title: "How satisfied are you?",
    subtitle: "Your feedback helps us improve",
    contentAlignment: .top,
    ratingButtonOption: .number,  // or .thumbs
    ratingLabels: RatingFooterLabels(
        left: "Poor",
        right: "Excellent"
    ),
    selectionBehavior: .single(autoAdvance: false)
)
```

Rating options:
- **Number rating**: 1-5 scale with numbers
- **Thumbs rating**: Thumbs up/down (2-point scale)
- **Custom labels**: Add context to rating endpoints
- **Label placement**: Top or bottom of rating buttons

### Text Input Slide

Collect user text input:

```swift
.textInput(
    id: "name",
    title: "What's your name?",
    subtitle: "We'd love to get to know you",
    textfieldPlaceholder: "Enter your name",
    textfieldIcon: .systemIcon(named: "person"),
    contentAlignment: .top
)
```

### Primary Action Slide

Call-to-action with optional secondary button:

```swift
.primaryAction(
    id: "get-started",
    title: "You're All Set!",
    subtitle: "Ready to begin your journey?",
    media: .systemIcon(named: "checkmark.circle.fill"),
    ctaText: "Get Started",
    secondaryButtonText: "Skip for now",
    contentAlignment: .center
)
```

</details>

## Advanced Features

<details>
<summary> Details (Click to expand) </summary>
<br>

### Feedback Configuration

Show inline feedback based on user selections:

```swift
.multipleChoice(
    id: "quiz",
    title: "What is 2 + 2?",
    options: [
        OnbChoiceOption(
            id: "correct",
            content: OnbButtonContentData(text: "4"),
            feedbackConfiguration: OnbFeedbackConfiguration(
                backgroundColor: .green.opacity(0.2),
                cornerRadius: 4,
                title: "Correct!",
                subtitle: "Great job"
            )
        ),
        OnbChoiceOption(
            id: "incorrect",
            content: OnbButtonContentData(text: "5"),
            feedbackConfiguration: OnbFeedbackConfiguration(
                backgroundColor: .red.opacity(0.2),
                cornerRadius: 4,
                title: "Oops!",
                subtitle: "Try again"
            )
        )
    ],
    feedbackStyle: .top()  // or .bottom()
)
```

Feedback styles:
- `.top(transition: .none/.slide/.opacity)` - Appears above content
- `.bottom(transition: .none/.slide/.opacity)` - Appears above rating/options

### Response Configuration

Show full-screen response screens:

```swift
.multipleChoice(
    id: "subscribe",
    title: "Choose your plan",
    options: [
        OnbChoiceOption(
            id: "premium",
            content: OnbButtonContentData(text: "Premium Plan"),
            responseConfiguration: OnbResponseConfiguration(
                style: .center(transition: .slide),
                backgroundColor: .blue,
                horizontalPadding: 24,
                title: "Welcome to Premium!",
                titleFont: .largeTitle,
                subtitle: "You've made an excellent choice",
                ctaText: "Continue",
                ctaButtonStyle: .solid(backgroundColor: .white, textColor: .blue)
            )
        )
    ],
    selectionBehavior: .single(autoAdvance: true)
)
```

Response styles:
- `.center(transition: .slide/.opacity/.fade/.scale)` - Centered full-screen
- `.bottom(transition: .bottom)` - Bottom sheet style

### Dynamic Slide Insertion

Insert slides based on user responses:

```swift
.multipleChoice(
    id: "experience",
    title: "How experienced are you?",
    options: [
        OnbChoiceOption(
            id: "beginner",
            content: OnbButtonContentData(text: "Beginner"),
            insertConfiguration: [
                InsertSlideData(
                    location: .next,
                    slide: .regular(
                        id: "beginner-tip",
                        title: "Tips for Beginners",
                        subtitle: "Here's what you need to know"
                    )
                )
            ]
        ),
        OnbChoiceOption(
            id: "expert",
            content: OnbButtonContentData(text: "Expert"),
            insertConfiguration: [
                InsertSlideData(
                    location: .next,
                    slide: .regular(
                        id: "expert-features",
                        title: "Advanced Features",
                        subtitle: "Unlock your full potential"
                    )
                )
            ]
        )
    ]
)
```

Insert locations:
- `.next` - Insert immediately after current slide
- `.afterId(String)` - Insert after specific slide ID
- `.atEnd` - Append to end of flow

### Progress Callbacks

Track user progress through the flow:

```swift
let config = OnbConfiguration(
    slides: slides,
    onSlideComplete: { slideId, userSelections in
        print("Completed slide: \(slideId)")
        print("User selections: \(userSelections)")
    },
    onFlowComplete: { allSelections in
        print("Onboarding complete!")
        print("All user data: \(allSelections)")
        // Save user preferences, navigate to main app, etc.
    }
)
```

</details>

## Customization

<details>
<summary> Details (Click to expand) </summary>
<br>

### Slide Defaults

Set default styling for all slides:

```swift
OnbConfiguration(
    slideDefaults: OnbSlideDefaults(
        titleFont: .system(.title, weight: .bold),
        subtitleFont: .body,
        titleAlignment: .center,
        contentAlignment: .center,
        paddingTop: 40,
        paddingBottom: 0,
        horizontalPaddingContent: 24,
        contentSpacing: 12,
        ctaButtonStyle: .solid(backgroundColor: .blue, textColor: .white),
        ctaButtonFormatData: OnbButtonFormatData(
            pressStyle: .press,
            font: .headline,
            height: .verticalPadding(16),
            cornerRadius: 12
        ),
        background: .solidColor(.clear),
        transitionStyle: .slide
    ),
    slides: slides
)
```

### Header Configuration

Customize the header:

```swift
OnbHeaderConfiguration(
    headerStyle: .progressBar,  // .progressBar, .count, or .none
    headerAlignment: .center,   // .center or .right
    showBackButton: .afterFirstSlide,  // .always, .afterFirstSlide, or .never
    backButtonColor: .blue,
    progressBarAccentColor: .blue
)
```

### Button Styles

Multiple button style options:

```swift
// Solid style
.solid(
    backgroundColor: Color(uiColor: .systemGray5),
    textColor: .black,
    selectedBackgroundColor: .blue,
    selectedTextColor: .white
)

// Outline style
.outline(
    textColor: .blue,
    borderColor: .blue,
    borderWidth: 2,
    selectedTextColor: .white,
    selectedBackgroundColor: .blue
)

// Solid with outline
.solidOutline(
    backgroundColor: .white,
    textColor: .black,
    borderColor: .gray,
    borderWidth: 1,
    selectedBackgroundColor: .blue,
    selectedTextColor: .white,
    selectedBorderColor: .blue
)

// Duolingo style (checkbox-based)
.duolingo(
    backgroundColor: .white,
    textColor: .black,
    borderColor: .gray,
    checkboxStyle: .circle,  // or .square
    selectedTextColor: .blue,
    selectedBorderColor: .blue
)
```

### Button Format

Customize button appearance:

```swift
OnbButtonFormatData(
    pressStyle: .press,  // .press, .opacity, or .none
    font: .headline,
    height: .verticalPadding(16),  // or .fixed(50)
    cornerRadius: 12
)
```

### Background Types

Set slide backgrounds:

```swift
// Solid color
.solidColor(.blue)

// Gradient
.gradient(
    Gradient(colors: [.purple, .blue]),
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)

// Image
.image(urlString: "https://example.com/background.jpg")
```

### Media Types

Support for various media types:

```swift
// System icon
.systemIcon(named: "star.fill", size: .large)

// Image URL
.image(urlString: "https://example.com/image.jpg")

// Lottie animation
.lottie(urlString: "https://example.com/animation.json", loopMode: .loop)
```

Media sizes: `.small`, `.medium`, `.large`, `.extraLarge`, `.custom(CGFloat)`

### Transition Styles

Animate between slides:

```swift
.slide   // Horizontal slide (default)
.opacity // Fade in/out
.fade    // Fade with subtle offset
.none    // No animation
```

</details>

## Example Flows

<details>
<summary> Details (Click to expand) </summary>
<br>

### Simple Informational Flow

```swift
OnbConfiguration(
    slides: [
        .regular(
            id: "welcome",
            title: "Welcome",
            subtitle: "Get started with our app"
        ),
        .regular(
            id: "features",
            title: "Key Features",
            subtitle: "Discover what you can do"
        ),
        .regular(
            id: "ready",
            title: "Ready to Go!",
            subtitle: "Let's dive in"
        )
    ]
)
```

### Interactive Survey Flow

```swift
OnbConfiguration(
    slides: [
        .multipleChoice(
            id: "interests",
            title: "What interests you?",
            options: [
                OnbChoiceOption(id: "tech", content: OnbButtonContentData(text: "Technology")),
                OnbChoiceOption(id: "design", content: OnbButtonContentData(text: "Design")),
                OnbChoiceOption(id: "business", content: OnbButtonContentData(text: "Business"))
            ],
            selectionBehavior: .multi(min: 1, max: 3)
        ),
        .rating(
            id: "satisfaction",
            title: "How likely are you to recommend us?",
            contentAlignment: .top,
            ratingButtonOption: .number
        ),
        .textInput(
            id: "feedback",
            title: "Any additional feedback?",
            textfieldPlaceholder: "Share your thoughts..."
        )
    ],
    onFlowComplete: { selections in
        print("Survey complete: \(selections)")
    }
)
```

### Conditional Flow with Dynamic Slides

```swift
OnbConfiguration(
    slides: [
        .yesNo(
            id: "notifications",
            title: "Enable Notifications?",
            yesOption: OnbChoiceOption(
                id: "yes",
                content: OnbButtonContentData(text: "Yes"),
                insertConfiguration: [
                    InsertSlideData(
                        location: .next,
                        slide: .multipleChoice(
                            id: "notification-types",
                            title: "What notifications?",
                            options: [
                                OnbChoiceOption(id: "all", content: OnbButtonContentData(text: "All")),
                                OnbChoiceOption(id: "important", content: OnbButtonContentData(text: "Important Only"))
                            ]
                        )
                    )
                ]
            ),
            noOption: OnbChoiceOption(id: "no", content: OnbButtonContentData(text: "No"))
        ),
        .primaryAction(
            id: "complete",
            title: "All Set!",
            ctaText: "Get Started"
        )
    ]
)
```

</details>

## Best Practices

<details>
<summary> Details (Click to expand) </summary>
<br>

1. **Use unique IDs**: Each slide must have a unique identifier
2. **Keep titles concise**: Short, clear titles work best
3. **Leverage defaults**: Set `slideDefaults` for consistent styling
4. **Test flows**: Use PreviewFlows.swift patterns for testing different configurations
5. **Handle completion**: Always implement `onFlowComplete` to process user data
6. **Optimize images**: Use appropriately sized images to avoid performance issues
7. **Consider accessibility**: Ensure sufficient color contrast and text sizes
8. **Use auto-advance wisely**: Only use for simple, obvious choices
9. **Provide feedback**: Use feedback/response screens for important selections
10. **Test navigation**: Ensure back button behavior works as expected

</details>

## Architecture

<details>
<summary> Details (Click to expand) </summary>
<br>

SwiftfulOnboarding follows clean MVVM architecture:

### Core Components

- **SwiftfulOnboardingView**: Main container view
- **SwiftfulOnboardingViewModel**: Manages state and navigation (`@MainActor`, `ObservableObject`)
- **OnbConfiguration**: Configuration object for the entire flow
- **OnbSlideType**: Enum representing all slide types
- **Slide Views**: Individual view components for each slide type

### Key Features

- **Type-safe**: Enum-based slide types prevent configuration errors
- **Modular**: Each slide type is self-contained
- **Customizable**: Extensive configuration options
- **Reactive**: SwiftUI-native with Combine support
- **Performant**: Efficient rendering with only current/adjacent slides in memory

### View Hierarchy

```
SwiftfulOnboardingView
├── OnboardingHeaderView
│   ├── Back Button (conditional)
│   └── Progress Indicator (.progressBar, .count, or .none)
├── Slide Content (ZStack with transitions)
│   ├── AnyOnboardingSlideView
│   │   ├── RegularSlideView
│   │   ├── MultipleChoiceSlideView
│   │   ├── YesNoSlideView
│   │   ├── RatingSlideView
│   │   ├── TextInputSlideView
│   │   └── PrimaryActionSlideView
│   └── Feedback/Response layers
└── Response View (overlay, conditional)
```

</details>

## Related Packages

- [SwiftfulRouting](https://github.com/SwiftfulThinking/SwiftfulRouting) - Navigation framework
- [SwiftfulLogging](https://github.com/SwiftfulThinking/SwiftfulLogging) - Analytics logging
- [SwiftfulStarterProject](https://github.com/SwiftfulThinking/SwiftfulStarterProject) - Full integration example

## Contributing

Community contributions are encouraged! Please ensure that your code adheres to the project's existing coding style and structure.

- [Open an issue](https://github.com/SwiftfulThinking/SwiftfulOnboarding/issues) for issues with the existing codebase.
- [Open a discussion](https://github.com/SwiftfulThinking/SwiftfulOnboarding/discussions) for new feature requests.
- [Submit a pull request](https://github.com/SwiftfulThinking/SwiftfulOnboarding/pulls) when the feature is ready.

## License

MIT License. See LICENSE file for details.
