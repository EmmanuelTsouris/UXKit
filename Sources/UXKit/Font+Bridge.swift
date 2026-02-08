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

#else
// Linux and other platforms - provide a minimal stub

/// Cross-platform font type.
///
/// On Linux and non-Apple platforms, provides a minimal font representation.
public struct UXFont: Sendable, Hashable {
    public let name: String
    public let size: Double

    public init(name: String, size: Double) {
        self.name = name
        self.size = size
    }

    public static func systemFont(ofSize size: Double) -> UXFont {
        UXFont(name: "System", size: size)
    }

    public static func boldSystemFont(ofSize size: Double) -> UXFont {
        UXFont(name: "System-Bold", size: size)
    }
}

#endif
