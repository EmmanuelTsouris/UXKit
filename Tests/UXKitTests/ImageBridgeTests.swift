//
//  ImageBridgeTests.swift
//  UXKit
//

import Testing
@testable import UXKit

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

@Test("UXImage is UIImage on iOS/tvOS/visionOS")
func testImageTypeIOS() {
    #if canImport(UIKit)
    #expect(UXImage.self == UIImage.self)
    #endif
}

@Test("UXImage is NSImage on macOS")
func testImageTypeMacOS() {
    #if canImport(AppKit)
    #expect(UXImage.self == NSImage.self)
    #endif
}
