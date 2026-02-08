# UXKit

Cross-platform type bridging for UIKit and AppKit.

[![Swift](https://github.com/EmmanuelTsouris/UXKit/actions/workflows/swift.yml/badge.svg)](https://github.com/EmmanuelTsouris/UXKit/actions/workflows/swift.yml)
[![Swift](https://img.shields.io/badge/Swift-6.2-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%20|%20macOS%20|%20tvOS%20|%20visionOS%20|%20Linux-lightgray.svg)](https://swift.org)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Features

- ✅ **UXColor** - Unified color type across iOS (UIColor), macOS (NSColor), and Linux (custom struct)
- ✅ **UXImage** - Unified image type across iOS (UIImage), macOS (NSImage), and Linux (stub)
- ✅ **UXFont** - Unified font type across iOS (UIFont), macOS (NSFont), and Linux (custom struct)
- ✅ **Zero overhead** - Typealiases on Apple platforms, minimal structs on Linux
- ✅ **Swift 6.2 strict concurrency** - All types are Sendable-safe
- ✅ **Cross-platform** - Write once, run on iOS, macOS, tvOS, visionOS, and Linux

## Installation

### Swift Package Manager

Add UXKit to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/EmmanuelTsouris/UXKit.git", from: "1.0.0")
]
```

Or in Xcode:
1. File → Add Package Dependencies
2. Enter: `https://github.com/EmmanuelTsouris/UXKit.git`

## Quick Start

```swift
import UXKit

// Write cross-platform code without #if conditionals
func createRedView() -> UXColor {
    return UXColor.red  // Works on iOS (UIColor) and macOS (NSColor)
}

func loadAsset() -> UXImage? {
    return UXImage(named: "logo")  // Works on iOS and macOS
}

func makeTitle() -> UXFont {
    return UXFont.systemFont(ofSize: 24, weight: .bold)
}
```

## Documentation

### UXColor

Cross-platform color type that maps to:
- **iOS/tvOS/visionOS**: `UIColor`
- **macOS**: `NSColor`

```swift
// All UIColor/NSColor APIs work through UXColor
let red = UXColor.red
let custom = UXColor(red: 0.5, green: 0.2, blue: 0.8, alpha: 1.0)
let named = UXColor(named: "AccentColor")
```

### UXImage

Cross-platform image type that maps to:
- **iOS/tvOS/visionOS**: `UIImage`
- **macOS**: `NSImage`

```swift
// Load images the same way on all platforms
let icon = UXImage(named: "app-icon")
let symbol = UXImage(systemName: "star.fill")

// Access platform-specific properties when needed
#if os(iOS)
let size = icon?.size
#elseif os(macOS)
let size = icon?.size
#endif
```

### UXFont

Cross-platform font type that maps to:
- **iOS/tvOS/visionOS**: `UIFont`
- **macOS**: `NSFont`

```swift
// System fonts work everywhere
let body = UXFont.systemFont(ofSize: 16)
let title = UXFont.boldSystemFont(ofSize: 24)
let mono = UXFont.monospacedSystemFont(ofSize: 14, weight: .regular)

// Custom fonts
let custom = UXFont(name: "Helvetica-Bold", size: 18)
```

## Requirements

- Swift 6.2+
- iOS 26.2+ / macOS 26.2+ / tvOS 26.2+ / visionOS 26.2+ / Linux (Ubuntu 22.04+)
- Xcode 26.3+ (for Apple platforms)

**Note:** On Linux, UXColor and UXFont provide basic structs. UXImage is a stub (image loading not supported).

## Why UXKit?

- **No conditionals**: Write `UXColor.red` instead of `#if os(iOS) UIColor.red #else NSColor.red #endif`
- **Zero overhead**: Pure typealiases compile to native types
- **Type-safe**: Full compiler support and autocomplete
- **Maintainable**: Less code duplication in cross-platform projects
- **SwiftUI-friendly**: Easily bridge between SwiftUI and UIKit/AppKit
- **Sendable-safe**: Full Swift 6.2 concurrency support

## Contributing

UXKit is open-source! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

**Important**: This is a public open-source package. Do not reference private projects or proprietary code in contributions.

## License

MIT License - See [LICENSE](LICENSE) for details.

## Related Packages

UXKit works great with other open-source Swift packages:

- **[GameMath](https://github.com/EmmanuelTsouris/GameMath)** - Pure Swift math library for game development

---

**Made with ❤️ for cross-platform Swift developers**
