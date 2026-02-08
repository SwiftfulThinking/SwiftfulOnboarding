### 🚀 Learn how to build and use this package: https://www.swiftful-thinking.com/offers/REyNLwwH

# SwiftfulOnboarding 👋

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FSwiftfulThinking%2FSwiftfulOnboarding%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/SwiftfulThinking/SwiftfulOnboarding) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FSwiftfulThinking%2FSwiftfulOnboarding%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/SwiftfulThinking/SwiftfulOnboarding)

### Beautiful, customizable onboarding flows for SwiftUI applications.
- ✅ Multiple slide types (Regular, Multiple Choice, Yes/No, Rating, Text Input, Date Picker, Picker, Primary Action)
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

- iOS 15.0+
- Swift 6.0+
- Xcode 16.0+

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
            content: OnbButtonContentData(
                text: "Technology",
                secondaryContent: .media(media: .systemIcon(named: "laptopcomputer", size: .small))
            )
        ),
        OnbChoiceOption(
            id: "design",
            content: OnbButtonContentData(
                text: "Design",
                secondaryContent: .media(media: .systemIcon(named: "paintbrush", size: .small))
            )
        ),
        OnbChoiceOption(
            id: "business",
            content: OnbButtonContentData(
                text: "Business",
                secondaryContent: .media(media: .systemIcon(named: "briefcase", size: .small))
            )
        )
    ],
    selectionBehavior: .multi(max: 3),
    contentAlignment: .top
)
```

Multiple choice slides support:
- **Single selection**: `.single(autoAdvance: Bool)` - Select one option
- **Multi selection**: `.multi(max: Int?)` - Select multiple options with optional maximum limit
  - `max: nil` (default) - Unlimited selections
  - `max: 3` - Limit to maximum 3 selections
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
    yesOption: OnbChoiceOption(id: "yes", content: OnbButtonContentData(text: "Yes, please")),
    noOption: OnbChoiceOption(id: "no", content: OnbButtonContentData(text: "Maybe later")),
    selectionBehavior: .single(autoAdvance: true)
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
    textFieldKeyboardType: .default
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
    contentAlignment: .center,
    ctaText: "Get Started",
    secondaryButtonText: "Skip for now"
)
```

### Date Picker Slide

Collect a date or time from the user:

```swift
.datePicker(
    id: "birthday",
    title: "When is your birthday?",
    subtitle: "We'll celebrate with you!",
    datePickerPosition: .auto,       // .auto or .bottom
    datePickerStyle: .graphical,     // .graphical, .wheel, or .compact
    datePickerComponents: .date,     // .date, .dateTime, or .time
    datePickerStartDate: Date(),
    datePickerMinimumDate: nil,
    datePickerMaximumDate: Date()
)
```

### Picker Slide

Present a list of string options in a picker:

```swift
.picker(
    id: "language",
    title: "What's your preferred language?",
    pickerPosition: .auto,     // .auto or .bottom
    pickerStyle: .wheel,       // .wheel, .menu, or .segmented
    pickerOptions: ["English", "Spanish", "French", "German", "Japanese"]
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
                    placement: .next,
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
                    placement: .next,
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

Insert placements:
- `.next` - Insert immediately after current slide
- `.afterSlide(id: String)` - Insert after a specific slide ID
- `.afterCount(count: Int)` - Insert N slides after the current slide

### Dynamic Rating Configuration

The rating slide supports closures that return different configurations per rating value:

```swift
.rating(
    id: "satisfaction",
    title: "How satisfied are you?",
    ratingButtonOption: .number,
    getResponseConfiguration: { rating in
        if rating >= 4 {
            return OnbResponseConfiguration(
                backgroundColor: .green,
                title: "Glad you love it!",
                ctaText: "Continue"
            )
        }
        return nil
    },
    getFeedbackConfiguration: { rating in
        if rating <= 2 {
            return OnbFeedbackConfiguration(
                backgroundColor: .red.opacity(0.2),
                title: "We're sorry to hear that"
            )
        }
        return nil
    },
    getInsertConfiguration: { rating in
        if rating <= 2 {
            return [
                InsertSlideData(
                    placement: .next,
                    slide: .textInput(
                        id: "improvement",
                        title: "How can we improve?"
                    )
                )
            ]
        }
        return nil
    }
)
```

### Primary Action with Async Work

Use `onDidPressPrimaryButton` to perform async work (e.g. requesting permissions) before the slide advances:

```swift
.primaryAction(
    id: "notifications",
    title: "Stay in the Loop",
    subtitle: "Get notified about important updates",
    media: .systemIcon(named: "bell.fill"),
    ctaText: "Enable Notifications",
    secondaryButtonText: "Not now",
    onDidPressPrimaryButton: { completion in
        // Request notification permission, then call completion to advance
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
)
```

### Progress Callbacks

Track user progress through the flow:

```swift
let config = OnbConfiguration(
    slides: slides,
    onSlideComplete: { slideData in
        print("Completed slide: \(slideData.slideId)")
        print("Selections: \(slideData.selections)")
    },
    onFlowComplete: { flowData in
        print("Onboarding complete!")
        print("Total slides: \(flowData.slides.count)")
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
    headerStyle: .progressBar,  // .progressBar, .dots, .count, or .none
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
    selectedBorderColor: .blue
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

// Duolingo style (3D button with shadow)
.duolingo(
    backgroundColor: .green,
    textColor: .white,
    shadowColor: .green.opacity(0.6),
    selectedBackgroundColor: .green.opacity(0.8),
    selectedTextColor: .white,
    selectedShadowColor: .green.opacity(0.4)
)
```

### Button Format

Customize button appearance:

```swift
OnbButtonFormatData(
    pressStyle: .press,  // .press, .opacity, or .tap
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
.image(urlString: "https://example.com/image.jpg", size: .medium)

// Video
.video(urlString: "https://example.com/video.mp4", size: .large, loop: true)

// Lottie animation
.lottie(urlString: "https://example.com/animation.json", size: .medium, loopMode: .loop)
```

Media sizes: `.auto`, `.small`, `.medium`, `.large`, `.fixed(width:height:)`

Aspect ratios (image, video, lottie): `.auto`, `.square`, `.portrait`, `.landscape`

Image, video, and lottie types also support border options:

```swift
.image(
    urlString: "https://example.com/image.jpg",
    size: .medium,
    aspectRatio: .square,
    cornerRadius: 12,
    borderColor: .gray,
    borderWidth: 2,
    selectedBorderColor: .blue,
    selectedBorderWidth: 3
)
```

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
            selectionBehavior: .multi(max: 3)
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
            textFieldKeyboardType: .default
        )
    ],
    onFlowComplete: { flowData in
        print("Survey complete: \(flowData.slides.count) slides")
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
                        placement: .next,
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

## Tracking User Progress

<details>
<summary> Details (Click to expand) </summary>
<br>

Track user progress and collect data using callback functions:

### onSlideComplete

Called each time a user completes a slide (by clicking Continue or auto-advancing):

```swift
OnbConfiguration(
    slides: slides,
    onSlideComplete: { slideData in
        print("User completed slide: \(slideData.slideId)")
        print("Slide type: \(slideData.slideType)")
        print("Selections: \(slideData.selections)")

        // Example: Save progress to UserDefaults
        UserDefaults.standard.set(slideData.slideId, forKey: "lastCompletedSlide")

        // Example: Send analytics event
        analytics.track("slide_completed", properties: slideData.eventParameters)
    }
)
```

**Parameters:**
- `slideData: OnbSlideData` - Contains slide info and user selections:
  - `.slideId: String` - The ID of the slide that was just completed
  - `.slideTitle: String?` - The title of the slide
  - `.slideType: String` - The type of slide (e.g. "regular", "multipleChoice")
  - `.selections: [OnbSelectionData]` - User selections for this slide
  - `.eventParameters: [String: Any]` - Pre-formatted dictionary for analytics

**Use cases:**
- Track user progress through the flow
- Save partial completion state
- Send analytics events per slide
- Update UI outside the onboarding flow

### onFlowComplete

Called when the user completes the entire onboarding flow (reaches the last slide and clicks Continue):

```swift
OnbConfiguration(
    slides: slides,
    onFlowComplete: { flowData in
        print("Onboarding complete!")
        print("Total slides: \(flowData.slides.count)")

        // Example: Process each slide's data
        for slide in flowData.slides {
            print("\(slide.slideId): \(slide.selections.map { $0.id })")
        }

        // Example: Navigate to main app
        isOnboardingComplete = true

        // Example: Send completion event
        analytics.track("onboarding_completed", properties: flowData.eventParameters)
    }
)
```

**Parameters:**
- `flowData: OnbFlowData` - Contains data from the entire flow:
  - `.slides: [OnbSlideData]` - Array of all slide data in completion order
  - `.eventParameters: [String: Any]` - Pre-formatted dictionary for analytics

**Use cases:**
- Save all user preferences at once
- Navigate to the main app
- Create user profile from collected data
- Send completion analytics
- Trigger welcome emails or notifications

### Accessing Selection Data

Each `OnbSelectionData` in the selections contains:

```swift
struct OnbSelectionData {
    var id: String          // Option identifier
    var text: String?       // Option text
    var value: Any?         // Custom value you can attach
}
```

**Example: Processing selections**

```swift
onFlowComplete: { flowData in
    for slide in flowData.slides {
        switch slide.slideId {
        case "interests":
            let interestIds = slide.selections.map { $0.id }
            let interestTexts = slide.selections.compactMap { $0.text }
            print("User interests: \(interestTexts)")

        case "satisfaction":
            if let rating = slide.selections.first?.value as? Int {
                print("User rated: \(rating)/5")
            }

        case "name":
            if let name = slide.selections.first?.text {
                print("User name: \(name)")
            }

        case "notifications":
            let enabled = slide.selections.first?.id == "yes"
            print("Notifications enabled: \(enabled)")

        default:
            break
        }
    }
}
```

### Complete Example

```swift
struct OnboardingCoordinator: View {
    @State private var showOnboarding = true
    @State private var userProfile: UserProfile?

    var body: some View {
        if showOnboarding {
            SwiftfulOnboardingView(
                configuration: OnbConfiguration(
                    slides: onboardingSlides,
                    onSlideComplete: { slideData in
                        // Track progress
                        print("Completed: \(slideData.slideId)")
                    },
                    onFlowComplete: { flowData in
                        // Process all data
                        userProfile = UserProfile(from: flowData)

                        // Dismiss onboarding
                        showOnboarding = false
                    }
                )
            )
        } else {
            MainAppView(userProfile: userProfile)
        }
    }
}
```

</details>

## Contributing

Community contributions are encouraged! Please ensure that your code adheres to the project's existing coding style and structure.

- [Open an issue](https://github.com/SwiftfulThinking/SwiftfulOnboarding/issues) for issues with the existing codebase.
- [Open a discussion](https://github.com/SwiftfulThinking/SwiftfulOnboarding/discussions) for new feature requests.
- [Submit a pull request](https://github.com/SwiftfulThinking/SwiftfulOnboarding/pulls) when the feature is ready.

## License

MIT License. See LICENSE file for details.
