//
//  UIWindowExtensionsTests.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 6/2/18.
//  Copyright © 2018 SwifterSwift
//

import XCTest
@testable import SwifterSwift

#if canImport(UIKit) && os(iOS)
import UIKit

final class UIWindowExtensionsTests: XCTestCase {

    func testSwitchRootViewController() {
        let viewController = UIViewController()
        let tableViewController = UITableViewController()

        let window = UIWindow()
        window.rootViewController = viewController

        XCTAssertNotNil(window.rootViewController)
        XCTAssertEqual(window.rootViewController!, viewController)

        window.switchRootViewController(to: tableViewController, animated: false)
        XCTAssertNotNil(window.rootViewController)
        XCTAssertEqual(window.rootViewController!, tableViewController)
        ///预期
        let completionExpectation = expectation(description: "Completed")

        window.switchRootViewController(to: viewController, animated: true, duration: 0.75) {
            completionExpectation.fulfill()
            XCTAssertNotNil(window.rootViewController)
            XCTAssertEqual(window.rootViewController!, viewController)
        }
        ///超时时间是1s：注意：这里即使等于0.75也是会报错的
        waitForExpectations(timeout: 1, handler: nil)
    }

}

#endif
