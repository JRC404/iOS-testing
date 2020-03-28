//
//  CalculatorTest.swift
//  Unit-testingTests
//
//  Created by Jacob on 27/03/2020.
//  Copyright © 2020 Jacob Reilly-Cooper. All rights reserved.
//

import XCTest
@testable import Unit_testing

class CalculatorTest: XCTestCase {
    
    var calculator: Calculator!

    override func setUp() {
        calculator = Calculator()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        calculator = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdd() {
        let result = calculator.add(1, 2);
        XCTAssertEqual(result, 3)
    }
    
    func testSubtract() {
        let result = calculator.subtract(3, 2)
        XCTAssertEqual(result, 1, "Expected 1, but got \(result)")
    }
}
