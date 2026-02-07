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

#endif
