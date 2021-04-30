//
//  Feature.swift
//  nom-nom
//
//  Created by Michelle Gao on 4/29/21.
//

import UIKit

class Feature {
    var image: UIImage
    var title: String
    var description: String
    
    init(image: UIImage, title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
}
