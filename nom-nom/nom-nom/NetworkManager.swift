//
//  NetworkManager.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/11/21.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let host = "https://appdevnomnom.herokuapp.com/api/"
    
    static func getAllRecipes(completion: @escaping ([Recipe]) -> Void) {
        let endpoint = "\(host)recipes/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let recipesResponse = try? jsonDecoder.decode(RecipesResponse.self, from: data) {
                    completion(recipesResponse.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getSpecificRecipe(id: Int, completion: @escaping (Recipe) -> Void) {
        let endpoint = "\(host)"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let recipeResponse = try? jsonDecoder.decode(RecipeResponse.self, from: data) {
                    completion(recipeResponse.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getFavoritedRecipes(completion: @escaping ([Recipe]) -> Void) {
        let endpoint = "\(host)"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()

                if let favRecipesResponse = try? jsonDecoder.decode(RecipesResponse.self, from: data) {
                    completion(favRecipesResponse.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createRecipe(title: String, description: String, ingredients: String, completion: @escaping (Recipe) -> Void) {
        let endpoint = "\(host)recipes/"
        let parameters : [String:Any] = [
            "title": title,
            "description": description,
            "ingredients": ingredients
        ]
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let recipeResponse = try? jsonDecoder.decode(RecipeResponse.self, from: data) {
                    completion(recipeResponse.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getAllMeals(completion: @escaping ([Meal]) -> Void) {
        let endpoint = "\(host)plans/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                
                if let mealsResponse = try? jsonDecoder.decode(MealsResponse.self, from: data) {
                    completion(mealsResponse.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
