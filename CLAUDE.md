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
- **Styles**: `.progressBar`, `.count`, `.none`
- **Alignments**: `.center`, `.right`
- Progress bar shows current progress
- Count shows format like "5/10"
- None shows no progress indicator

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