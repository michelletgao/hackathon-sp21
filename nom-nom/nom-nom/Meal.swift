//
//  Meal.swift
//  nom-nom
//
//  Created by Arianna Curillo on 5/9/21.
//

import Foundation

class Meal : Codable {
    var day: String
    var breakfast: String
    var lunch: String
    var dinner: String
    
    init(day: String, breakfast: String, lunch: String, dinner: String) {
        self.day = day
        self.breakfast = breakfast
        self.lunch = lunch
        self.dinner = dinner
    }
}

struct MealsResponse : Codable {
    let success: Bool
    let data: [Meal]
}
