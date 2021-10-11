//
//  Sequence+Extension.swift
//  LabelTestingDemoTests
//
//  Created by Adrian Bolinger on 10/10/21.
//

import Foundation

extension Sequence where Element: Hashable {
    var uniqued: [Element] {
        var seen = Set<Element>()
        
        return self.filter { seen.insert($0).inserted }
    }
}
