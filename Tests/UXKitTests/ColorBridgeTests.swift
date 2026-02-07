//
//  ColorBridgeTests.swift
//  UXKit
//

import Testing
@testable import UXKit

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

@Test("UXColor creates red color")
func testColorCreation() {
    let red = UXColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    // Color was created successfully (non-optional type)
    _ = red
}

@Test("UXColor system colors are accessible")
func testSystemColors() {
    let blue = UXColor.systemBlue
    // System color is accessible (non-optional type)
    _ = blue
}

@Test("UXColor is UIColor on iOS/tvOS/visionOS")
func testColorTypeIOS() {
    #if canImport(UIKit)
    #expect(UXColor.self == UIColor.self)
    #endif
}

@Test("UXColor is NSColor on macOS")
func testColorTypeMacOS() {
    #if canImport(AppKit)
    #expect(UXColor.self == NSColor.self)
    #endif
}
