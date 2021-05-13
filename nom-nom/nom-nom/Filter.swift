//
//  Filter.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/5/21.
//

import UIKit

class Filter: Equatable, Codable {
    var label: String
    var selected: Bool

    init(label: String) {
        self.label = label
        self.selected = false
    }
    
    static func ==(obj1 : Filter, obj2: Filter) -> Bool {
        return obj1.label == obj2.label && obj1.selected == obj2.selected
    }
}
