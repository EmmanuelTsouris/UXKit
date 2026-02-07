//
//  Font+Bridge.swift
//  UXKit
//
//  Cross-platform font type bridging.
//
//  Pattern inspired by ZeeZide/UXKit
//  https://github.com/ZeeZide/UXKit
//  MIT License, Copyright © 2016-2023 ZeeZide GmbH
//

#if canImport(UIKit)
import UIKit

/// Cross-platform font type.
///
/// On iOS, tvOS, visionOS, and Mac Catalyst: `UIFont`
/// On macOS (when canImport AppKit): `NSFont`
///
/// ## Usage
///
/// ```swift
/// import UXKit
///
/// let systemFont = UXFont.systemFont(ofSize: 14)
/// let boldFont = UXFont.boldSystemFont(ofSize: 16)
/// ```
///
/// Uses `#if canImport(UIKit)` to automatically support Mac Catalyst.
public typealias UXFont = UIFont

#elseif canImport(AppKit)
import AppKit

/// Cross-platform font type.
///
/// On iOS, tvOS, visionOS, and Mac Catalyst: `UIFont`
/// On macOS (when canImport AppKit): `NSFont`
///
/// ## Usage
///
/// ```swift
/// import UXKit
///
/// let systemFont = UXFont.systemFont(ofSize: 14)
/// let boldFont = UXFont.boldSystemFont(ofSize: 16)
/// ```
///
/// Uses `#if canImport(UIKit)` to automatically support Mac Catalyst.
public typealias UXFont = NSFont

#endif
