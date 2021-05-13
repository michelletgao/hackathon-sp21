//
//  Recipe.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/5/21.
//

import UIKit

class Recipe : Codable {
//    var image: String
    var title: String
    var ingredients: String
    var description: String
//    var restrictions: [Filter]
    var favorited: Bool

    init(image: String, title: String, ingredients: String, description: String, favorited: Bool) {
//        self.image = image
        self.title = title
        self.ingredients = ingredients
        self.description = description
//        self.restrictions = restrictions
        self.favorited = favorited
    }
}

struct RecipesResponse : Codable {
    let success: Bool
    let data: [Recipe]
}

struct RecipeResponse : Codable {
    let success: Bool
    let data: Recipe
}
