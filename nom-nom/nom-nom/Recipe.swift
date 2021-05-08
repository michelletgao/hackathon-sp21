//
//  Recipe.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/5/21.
//

import UIKit

class Recipe {
    var image: UIImage
    var title: String
    var ingredients: [Ingredient]
    var description: String
    var restrictions: [Filter]
    var favorited: Bool

    init(image: UIImage, title: String, ingredients: [Ingredient], description: String, restrictions: [Filter], favorited: Bool) {
        self.image = image
        self.title = title
        self.ingredients = ingredients
        self.description = description
        self.restrictions = restrictions
        self.favorited = favorited
    }

}
