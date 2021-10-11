//
//  LabelTestingDemoTests.swift
//  LabelTestingDemoTests
//
//  Created by Adrian Bolinger on 10/10/21.
//

import XCTest
@testable import LabelTestingDemo

class LabelTestingDemoTests: XCTestCase {
    
    /*
     This code will give us an array of strings representing the currency string for values of 100 to 999 for all currencies defined in the CurrencyCode enum.
     */
    private lazy var currencyStringsToTest: [String] = {
        let formatter = CurrencyFormatter()
        // empty array to store all the values for the next step
        var possibilities: [String] = []
        
        CurrencyCode.allCases.forEach { currencyCode in
            // get all values between 100 and 999
            let currencyPossibilities = stride(from: 100, to: 999, by: 1)
            // run each number from the stride through formatter
                .compactMap { formatter.formatAsCurrency(amount: $0,
                                                         currencyCode: currencyCode) }
            // and when we're done, dump the contents of the currencyPossibilities into the possibilities a rray
            possibilities.append(contentsOf: currencyPossibilities)
        }
        
        
        return possibilities
    }()
    
    func testFitsInFrame() throws {
        print("currencyStringsToTest.count = \(currencyStringsToTest.count)")
        let currencyLabel = UILabel()
        let mockVC = MockViewController(label: currencyLabel)
        let sut = mockVC.sutLabel
        
        XCTAssertEqual(currencyStringsToTest.count, 150133)
        let narrowestElement = try XCTUnwrap(narrowestElement(for: currencyStringsToTest,
                                                                 in: mockVC.sutLabel))
        let widestElement = try XCTUnwrap(widestElement(for: currencyStringsToTest,
                                                           in: mockVC.sutLabel))
        sut.text = narrowestElement.key
        XCTAssertLessThanOrEqual(narrowestElement.value, sut.bounds.width)
        XCTAssertFalse(sut.isClipped)
        XCTAssertFalse(sut.isTruncated)
        print(mockVC.sutLabel.text)
        sut.text = widestElement.key
        XCTAssertLessThanOrEqual(widestElement.value, sut.bounds.width)
        print(mockVC.sutLabel.text)
        XCTAssertFalse(sut.isClipped)
        XCTAssertFalse(sut.isTruncated)
        print("🚨 narrowestElement is \(narrowestElement.key) which is \(narrowestElement.value) wide")
        print("🚨 widestElement is \(widestElement.key) which is \(widestElement.value) wide")
        
    }
}

/// MockViewController is used to instantiate a view controller and lay it out
private class MockViewController: UIViewController {
    let sutLabel: UILabel
    
    init(label: UILabel) {
        let sutLabelFrame = CGRect(origin: .zero,
                                   size: CGSize(width: 102.0,
                                                height: 21))
        self.sutLabel = UILabel(frame: sutLabelFrame)
        super.init(nibName: nil,
                   bundle: nil)
        view.addSubview(label)
        label.center = view.center
        
    }
    
    required init?(coder: NSCoder) {
        // not implementing, just quelling compiler
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("✅ MockViewController viewDidLoad() fired")
    }
}
