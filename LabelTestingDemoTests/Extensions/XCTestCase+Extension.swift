//
//  XCTestCase+Extension.swift
//  LabelTestingDemoTests
//
//  Created by Adrian Bolinger on 10/10/21.
//

import UIKit
import XCTest

extension XCTestCase {
    func widestElement(for possibleStrings: [String],
                       in label: UILabel) -> Dictionary<String, CGFloat>.Element? {
        Dictionary(uniqueKeysWithValues: zip(
            possibleStrings, possibleStrings.map { $0.cgSize(in: label).width })
        )
            .max { $0.1 < $1.1 }
    }
    
    func narrowestElement(for possibleStrings: [String],
                          in label: UILabel) -> Dictionary<String, CGFloat>.Element? {
        Dictionary(uniqueKeysWithValues: zip(
            possibleStrings, possibleStrings.map { $0.cgSize(in: label).width })
        )
            .min { $0.1 < $1.1 }
    }
}
