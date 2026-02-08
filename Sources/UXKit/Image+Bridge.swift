//
//  Image+Bridge.swift
//  UXKit
//
//  Cross-platform image type bridging.
//
//  Pattern inspired by ZeeZide/UXKit
//  https://github.com/ZeeZide/UXKit
//  MIT License, Copyright © 2016-2023 ZeeZide GmbH
//

#if canImport(UIKit)
import UIKit

/// Cross-platform image type.
///
/// On iOS, tvOS, visionOS, and Mac Catalyst: `UIImage`
/// On macOS (when canImport AppKit): `NSImage`
///
/// ## Usage
///
/// ```swift
/// import UXKit
///
/// let image = UXImage(named: "icon")
/// let size = image?.size
/// ```
///
/// Uses `#if canImport(UIKit)` to automatically support Mac Catalyst.
public typealias UXImage = UIImage

#elseif canImport(AppKit)
import AppKit

/// Cross-platform image type.
///
/// On iOS, tvOS, visionOS, and Mac Catalyst: `UIImage`
/// On macOS (when canImport AppKit): `NSImage`
///
/// ## Usage
///
/// ```swift
/// import UXKit
///
/// let image = UXImage(named: "icon")
/// let size = image?.size
/// ```
///
/// Uses `#if canImport(UIKit)` to automatically support Mac Catalyst.
public typealias UXImage = NSImage

#else
// Linux and other platforms - provide a minimal stub

/// Cross-platform image type.
///
/// On Linux and non-Apple platforms, provides a minimal image representation.
/// Note: Image loading is not supported on Linux.
public struct UXImage: Sendable {
    public let name: String?

    public init?(named name: String) {
        self.name = name
        // On Linux, we can't actually load images
        // This is just a stub for compilation
    }
}

#endif
