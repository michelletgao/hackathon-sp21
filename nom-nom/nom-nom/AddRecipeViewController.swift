//
//  AddRecipeViewController.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/12/21.
//

import UIKit

class AddRecipeViewController: UIViewController {

    weak var delegate: RecipeDelegate?
    
    let recipeImage = UIButton()
    let titleLabel = UILabel()
    let titleTextField = UITextField()
    let titlePadding = UIView(frame: CGRect(x: 0, y: 0, width: 22 , height: 1))
    let ingredientsLabel = UILabel()
    let ingredientsTextField = UITextField()
    let ingredientsPadding = UIView(frame: CGRect(x: 0, y: 0, width: 22 , height: 1))
    let descriptionLabel = UILabel()
    let descriptionTextField = UITextField()
    let descriptionPadding = UIView(frame: CGRect(x: 0, y: 0, width: 22 , height: 1))
//    let restrictionsLabel = UILabel()
//    let restrictionsTextField = UITextField()
//    let restrictionsPadding = UIView(frame: CGRect(x: 0, y: 0, width: 22 , height: 1))
    let saveButton = UIButton()
    
    init(delegate: RecipeDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()

    }
    
    func setUpViews() {
        titleLabel.text = "Recipe Title: "
        titleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        titleTextField.attributedPlaceholder = NSAttributedString(string: "What's the recipe called?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        titleTextField.layer.borderWidth = 1
        titleTextField.layer.cornerRadius = 22
        titleTextField.layer.borderColor = UIColor.gray.cgColor
        titleTextField.leftView = titlePadding
        titleTextField.leftViewMode = .always
        titleTextField.font = UIFont(name: "HelveticaNeue", size: 12)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleTextField)
        
        ingredientsLabel.text = "Ingredients:"
        ingredientsLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ingredientsLabel)
        
        ingredientsTextField.attributedPlaceholder = NSAttributedString(string: "What's going in this?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        ingredientsTextField.layer.borderWidth = 1
        ingredientsTextField.layer.cornerRadius = 22
        ingredientsTextField.layer.borderColor = UIColor.gray.cgColor
        ingredientsTextField.leftView = ingredientsPadding
        ingredientsTextField.leftViewMode = .always
        ingredientsTextField.font = UIFont(name: "HelveticaNeue", size: 12)
        ingredientsTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ingredientsTextField)
        
        descriptionLabel.text = "Description:"
        descriptionLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        descriptionTextField.attributedPlaceholder = NSAttributedString(string: "Give a brief description.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        descriptionTextField.layer.borderWidth = 1
        descriptionTextField.layer.cornerRadius = 22
        descriptionTextField.layer.borderColor = UIColor.gray.cgColor
        descriptionTextField.leftView = descriptionPadding
        descriptionTextField.leftViewMode = .always
        descriptionTextField.font = UIFont(name: "HelveticaNeue", size: 12)
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionTextField)
        
//        restrictionsLabel.text = "Dietary Restrictions:"
//        restrictionsLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
//        restrictionsLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(restrictionsLabel)
//
//        restrictionsTextField.attributedPlaceholder = NSAttributedString(string: "Who can/can't eat this?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
//        restrictionsTextField.layer.borderWidth = 1
//        restrictionsTextField.layer.cornerRadius = 22
//        restrictionsTextField.layer.borderColor = UIColor.gray.cgColor
//        restrictionsTextField.leftView = restrictionsPadding
//        restrictionsTextField.leftViewMode = .always
//        restrictionsTextField.font = UIFont(name: "HelveticaNeue", size: 12)
//        restrictionsTextField.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(restrictionsTextField)
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor = .white
        saveButton.layer.cornerRadius = 14
        saveButton.layer.borderWidth = 1
        saveButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.widthAnchor.constraint(equalToConstant: 350),
            titleTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            ingredientsLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            ingredientsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            ingredientsTextField.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 20),
            ingredientsTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ingredientsTextField.widthAnchor.constraint(equalToConstant: 350),
            ingredientsTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: ingredientsTextField.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            descriptionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTextField.widthAnchor.constraint(equalToConstant: 350),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
//        NSLayoutConstraint.activate([
//            restrictionsLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 20),
//            restrictionsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
//        ])
//        NSLayoutConstraint.activate([
//            restrictionsTextField.topAnchor.constraint(equalTo: restrictionsLabel.bottomAnchor, constant: 20),
//            restrictionsTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            restrictionsTextField.widthAnchor.constraint(equalToConstant: 350),
//            restrictionsTextField.heightAnchor.constraint(equalToConstant: 50)
//        ])
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 20),
            saveButton.widthAnchor.constraint(equalToConstant: 120),
            saveButton.heightAnchor.constraint(equalToConstant: 32),
        ])
    }
    
    @objc func dismissViewController() {
        if let titleText = titleTextField.text, let ingredientsText = ingredientsTextField.text, let descriptionText = descriptionTextField.text {
            if titleText != "" && ingredientsText != "" && descriptionText != "" {
                // call delegate function
                delegate?.addRecipe(newTitle: titleText, newIngredients: ingredientsText, newDescription: descriptionText)
                // dismiss view controller
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
