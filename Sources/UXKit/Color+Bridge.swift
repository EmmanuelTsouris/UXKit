//
//  Color+Bridge.swift
//  UXKit
//
//  Cross-platform color type bridging.
//
//  Pattern inspired by ZeeZide/UXKit
//  https://github.com/ZeeZide/UXKit
//  MIT License, Copyright © 2016-2023 ZeeZide GmbH
//

#if canImport(UIKit)
import UIKit

/// Cross-platform color type.
///
/// On iOS, tvOS, visionOS, and Mac Catalyst: `UIColor`
/// On macOS (when canImport AppKit): `NSColor`
///
/// ## Usage
///
/// ```swift
/// import UXKit
///
/// let red = UXColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
/// let systemBlue = UXColor.systemBlue
/// ```
///
/// Uses `#if canImport(UIKit)` to automatically support Mac Catalyst.
public typealias UXColor = UIColor

#elseif canImport(AppKit)
import AppKit

/// Cross-platform color type.
///
/// On iOS, tvOS, visionOS, and Mac Catalyst: `UIColor`
/// On macOS (when canImport AppKit): `NSColor`
///
/// ## Usage
///
/// ```swift
/// import UXKit
///
/// let red = UXColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
/// let systemBlue = UXColor.systemBlue
/// ```
///
/// Uses `#if canImport(UIKit)` to automatically support Mac Catalyst.
public typealias UXColor = NSColor

#else
// Linux and other platforms - provide a simple color struct

/// Cross-platform color type.
///
/// On Linux and non-Apple platforms, provides a simple RGBA color representation.
public struct UXColor: Sendable, Hashable {
    public let red: Double
    public let green: Double
    public let blue: Double
    public let alpha: Double

    public init(red: Double, green: Double, blue: Double, alpha: Double = 1.0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    // Common colors
    public static let clear = UXColor(red: 0, green: 0, blue: 0, alpha: 0)
    public static let black = UXColor(red: 0, green: 0, blue: 0, alpha: 1)
    public static let white = UXColor(red: 1, green: 1, blue: 1, alpha: 1)
    public static let red = UXColor(red: 1, green: 0, blue: 0, alpha: 1)
    public static let green = UXColor(red: 0, green: 1, blue: 0, alpha: 1)
    public static let blue = UXColor(red: 0, green: 0, blue: 1, alpha: 1)
    public static let yellow = UXColor(red: 1, green: 1, blue: 0, alpha: 1)
    public static let orange = UXColor(red: 1, green: 0.5, blue: 0, alpha: 1)
    public static let purple = UXColor(red: 0.5, green: 0, blue: 0.5, alpha: 1)
    public static let cyan = UXColor(red: 0, green: 1, blue: 1, alpha: 1)
    public static let magenta = UXColor(red: 1, green: 0, blue: 1, alpha: 1)
    public static let gray = UXColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)

    // System colors (approximating Apple's system colors)
    public static let systemBlue = UXColor(red: 0.0, green: 0.478, blue: 1.0, alpha: 1)
    public static let systemGreen = UXColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
    public static let systemIndigo = UXColor(red: 0.345, green: 0.337, blue: 0.839, alpha: 1)
    public static let systemOrange = UXColor(red: 1.0, green: 0.584, blue: 0.0, alpha: 1)
    public static let systemPink = UXColor(red: 1.0, green: 0.176, blue: 0.333, alpha: 1)
    public static let systemPurple = UXColor(red: 0.686, green: 0.322, blue: 0.871, alpha: 1)
    public static let systemRed = UXColor(red: 1.0, green: 0.231, blue: 0.188, alpha: 1)
    public static let systemTeal = UXColor(red: 0.188, green: 0.69, blue: 0.78, alpha: 1)
    public static let systemYellow = UXColor(red: 1.0, green: 0.8, blue: 0.0, alpha: 1)
    public static let systemGray = UXColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
}

#endif
