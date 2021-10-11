//
//  String+Extension.swift
//  LabelTestingDemoTests
//
//  Created by Adrian Bolinger on 10/10/21.
//

import UIKit

extension String {
    func cgSize(in label: UILabel) -> CGSize {
        label.text = self
        
        return label.intrinsicContentSize
    }
}
