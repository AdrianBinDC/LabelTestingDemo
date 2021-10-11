//
//  UILabel+Extension.swift
//  LabelTestingDemoTests
//
//  Created by Adrian Bolinger on 10/10/21.
//

import UIKit

extension UILabel {
    var isTruncated: Bool {
        bounds.width < intrinsicContentSize.width
    }
    
    var isClipped: Bool {
        bounds.height < intrinsicContentSize.height
    }
}
