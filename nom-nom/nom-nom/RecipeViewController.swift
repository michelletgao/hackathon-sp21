//
//  RecipeViewController.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/8/21.
//

import UIKit

class RecipeViewController: UIViewController {
    
    var item: RecipeCollectionViewCell!
    var recipe: Recipe
    
    let recipeImage = UIImageView()
    let titleLabel = UILabel()
    let ingredientsLabel = UILabel()
    let ingredientsTextView = UITextView()
    let descriptionLabel = UILabel()
    let descriptionTextView = UITextView()
    let restrictionsLabel = UILabel()
    let restrictionsTextView = UITextView()
    
    init(recipe: Recipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        recipeImage.image = UIImage(named: "grocerybag")
        recipeImage.clipsToBounds = true
        recipeImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recipeImage)
        
        titleLabel.text = recipe.title
        titleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        ingredientsLabel.text = "Ingredients:"
        ingredientsLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ingredientsLabel)
        
        ingredientsTextView.text = recipe.ingredients.map{ "\($0.name)" }.joined(separator: ", ")
        ingredientsTextView.font = UIFont(name: "HelveticaNeue", size: 14)
        ingredientsTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ingredientsTextView)
        
        descriptionLabel.text = "Description:"
        descriptionLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        descriptionTextView.text = recipe.description
        descriptionTextView.font = UIFont(name: "HelveticaNeue", size: 14)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionTextView)
        
        restrictionsLabel.text = "Dietary Restrictions:"
        restrictionsLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        restrictionsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(restrictionsLabel)
        
        restrictionsTextView.text = recipe.restrictions.map{ "\($0.label)" }.joined(separator: ", ")
        restrictionsTextView.font = UIFont(name: "HelveticaNeue", size: 14)
        restrictionsTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(restrictionsTextView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            recipeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recipeImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            recipeImage.widthAnchor.constraint(equalToConstant: 240),
            recipeImage.heightAnchor.constraint(equalToConstant: 180)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        ])
        NSLayoutConstraint.activate([
            ingredientsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            ingredientsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            ingredientsTextView.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 20),
            ingredientsTextView.leadingAnchor.constraint(equalTo: ingredientsLabel.leadingAnchor),
            ingredientsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ingredientsTextView.heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 150),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            descriptionTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: ingredientsTextView.trailingAnchor),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            restrictionsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 100),
            restrictionsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            restrictionsTextView.topAnchor.constraint(equalTo: restrictionsLabel.bottomAnchor, constant: 20),
            restrictionsTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            restrictionsTextView.trailingAnchor.constraint(equalTo: ingredientsTextView.trailingAnchor),
            restrictionsTextView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
