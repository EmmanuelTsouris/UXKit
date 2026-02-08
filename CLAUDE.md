# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## ⚠️ IMPORTANT: Public Repository

**This is a PUBLIC open-source repository.** Never include references to private projects, proprietary code, internal tooling, credentials, or any non-public information.

## Project Overview

UXKit provides cross-platform type bridging for UIKit and AppKit with these requirements:

- **Zero overhead**: Pure typealiases on Apple platforms
- **Cross-platform**: Must work on iOS, macOS, tvOS, visionOS, AND Linux
- **Platform bridging**: Uses conditional compilation (`#if canImport(UIKit)`, `#if canImport(AppKit)`)
- **Zero dependencies**: No external packages
- **Sendable-safe**: All types must be Sendable (Swift 6.2 strict concurrency)
- **Inspired by ZeeZide/UXKit**: Credit attribution maintained in file headers

## Building and Testing

```bash
# Build and run all tests
swift build -v
swift test -v

# Run specific tests
swift test --filter ColorBridgeTests
swift test --filter testColorCreation
```

Tests use swift-testing framework (`@Test`, `#expect`) not XCTest. Must pass on both macOS and Linux.

## Architecture

### Conditional Compilation Pattern

The core design uses platform-specific type bridging:

**On Apple platforms:**
```swift
#if canImport(UIKit)
public typealias UXColor = UIColor  // iOS, tvOS, visionOS, Mac Catalyst
#elseif canImport(AppKit)
public typealias UXColor = NSColor  // macOS
#else
public struct UXColor { ... }       // Linux - simple struct
#endif
```

This provides:
- **Zero overhead** on Apple platforms (typealiases compile away)
- **Type safety** with full autocomplete and compiler support
- **Linux compatibility** with minimal struct implementations
- **No #if in user code** - users write `UXColor.red` everywhere

### Module Organization

Each bridge file handles one type:

- **Color+Bridge.swift**: `UXColor` → `UIColor` / `NSColor` / custom struct
- **Image+Bridge.swift**: `UXImage` → `UIImage` / `NSImage` / stub struct
- **Font+Bridge.swift**: `UXFont` → `UIFont` / `NSFont` / custom struct

## File Size Rules

Maximum 200 lines per Swift file. If a file approaches 200 lines, split it.

Split strategy:
- Extensions go in separate files
- One type per file. One protocol per file
- Tests mirror source

Why: Every file in this repo will be read by AI agents. A 1000-line file
burns context window on code irrelevant to the current task. Five 200-line
files let the agent load only what it needs.

Hard rule: If `wc -l` on any Swift file exceeds 250, the PR is rejected.

### Platform-Specific Behavior

**Apple platforms:** Direct passthrough to native types (UIKit/AppKit)
**Linux:** Minimal structs providing:
- Common initializers (e.g., `UXColor(red:green:blue:alpha:)`)
- Common constants (e.g., `.red`, `.blue`, `.systemBlue`)
- Basic functionality (no rendering or advanced features)

## Key Guidelines

- **Use conditional compilation**: Always use `#if canImport(UIKit)` / `#if canImport(AppKit)` / `#else`
- **Never use** `#if os(iOS)` or `#if os(macOS)` - they break Mac Catalyst support
- **Credit ZeeZide/UXKit**: Maintain attribution in file headers
- **Keep Linux structs simple**: Only implement common APIs, not every UIKit/AppKit feature
- **Test cross-platform**: Tests must verify typealiases on Apple platforms AND struct behavior on Linux
- **Document platform differences**: Note when features are unavailable on Linux
- Use conventional commit prefixes: `feat:`, `fix:`, `docs:`, `test:`, `refactor:`, `perf:`

## Common Patterns

**Adding a new bridged type:**
1. Create `TypeName+Bridge.swift` in Sources/UXKit/
2. Use `#if canImport(UIKit)` → typealias to UIKit type
3. Use `#elseif canImport(AppKit)` → typealias to AppKit type
4. Use `#else` → implement minimal struct for Linux
5. Add common initializers and properties
6. Create `TypeNameBridgeTests.swift` with platform-specific tests

**Testing platform-specific code:**
```swift
@Test("UXColor is UIColor on iOS")
func testColorTypeIOS() {
    #if canImport(UIKit)
    #expect(UXColor.self == UIColor.self)
    #endif
}
```

## What to Add / Not Add

**Appropriate additions:**
- New bridged types (UXView, UXViewController, UXBezierPath, etc.)
- Additional common colors, fonts, or helpers
- Cross-platform utility extensions
- Better Linux implementations

**Not appropriate:**
- Platform-specific features that can't work cross-platform
- Heavy dependencies
- Advanced rendering or complex UI logic

## Deferred Features

### Target/Action Normalization

**Status:** DEFERRED until pattern discovery shows UIKit control usage in an active project

**Reversal condition:** If pattern discovery finds significant programmatic UIKit/AppKit control creation with target/action wiring in Garage 2 Galaxy or other active projects, revisit this decision and implement the pattern.

**Current findings (2026-02-07):** Zero `UIButton.addTarget` or `NSButton.action =` patterns found across 558 game files.

**Why deferred:**
- Apps are SwiftUI-first (SwiftUI views + SpriteKit scenes)
- SwiftUI's `Button(action:)` already provides superior closure-based API
- AppKit implementation would require `objc_setAssociatedObject` trampolines (fighting the framework)
- UXKit P0 is type bridging (Color, Image, Font) - types that leak into SwiftUI code

**What NOT to implement:**
- `onClick()` / `onChange()` methods for UIButton/NSButton/UITextField/NSTextField
- Target/Action semantic wrappers
- Control event bridging

**Where the pattern lives:** Full implementation details in `ZEEZIDE_UXKIT_PATTERNS.md` (swift-package-ecosystem repo, Section 2: Target/Action Normalization)

**How to check the gate:** Run pattern discovery on active project codebases looking for:
```bash
# Check for UIKit target/action patterns
rg "addTarget.*action.*for:" --type swift
rg "\.target\s*=.*\.action\s*=" --type swift

# If significant usage found → implement pattern
# If zero usage found → keep deferred
```
- SwiftUI components (this is UIKit/AppKit bridging only)
