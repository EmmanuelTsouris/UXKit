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

#endif
