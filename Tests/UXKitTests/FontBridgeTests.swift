//
//  FontBridgeTests.swift
//  UXKit
//

import Testing
@testable import UXKit

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

@Test("UXFont creates system font")
func testFontCreation() {
    let font = UXFont.systemFont(ofSize: 14)
    // Font was created successfully (non-optional type)
    _ = font
}

@Test("UXFont is UIFont on iOS/tvOS/visionOS")
func testFontTypeIOS() {
    #if canImport(UIKit)
    #expect(UXFont.self == UIFont.self)
    #endif
}

@Test("UXFont is NSFont on macOS")
func testFontTypeMacOS() {
    #if canImport(AppKit)
    #expect(UXFont.self == NSFont.self)
    #endif
}
