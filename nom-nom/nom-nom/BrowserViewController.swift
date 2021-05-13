//
//  BrowserViewController.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/5/21.
//

import UIKit

protocol RecipeDelegate: AnyObject {
    func addRecipe(newTitle: String, newIngredients: String, newDescription: String)
}

class BrowserViewController: UIViewController {
    
    let recipeButton = UIButton()
    
//    private var filterCollectionView: UICollectionView!
    private var recipeCollectionView: UICollectionView!
    
//    private var filterLabel: UILabel = UILabel()
    private var recipeLabel: UILabel = UILabel()
    
//    private var filters: [Filter] = []
    var recipes: [Recipe] = []
    let images = ["food", "mac&", "overnight", "salad", "bananapancakes", "food", "food"]
    
//    private let filterCellReuseIdentifier = "filterCellReuseIdentifier"
    private let recipeCellReuseIdentifier = "recipeCellReuseIdentifier"
//    private let filterCellPadding: CGFloat = 8
    private let recipeCellPadding: CGFloat = 16
    
    let refreshControl = UIRefreshControl()
    private let backButton = UIButton()
    
//    let vegan = Filter(label: "Vegan")
//    let vegetarian = Filter(label: "Vegetarian")
//    let glutenfree = Filter(label: "Gluten-Free")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "try")!)
        title = "Recipe Browser"
        refreshData()
        
        
//        let recipe1 = Recipe(image: "food", title: "burrito bowl", ingredients: "rice, beans, peppers, onions, corn, lettuce", description: "a tasty bowl of love", favorited: false)
//        let recipe2 = Recipe(image: "food", title: "rice and beans", ingredients: "rice, beans", description: "a simple dish",  favorited: false)
//        let recipe3 = Recipe(image: "food", title: "fried rice", ingredients: "rice, peppers, onions, tofu, egg", description: "basic fried rice", favorited: false)
        
//        filters = [vegan, vegetarian, glutenfree]
//        recipes = [recipe1, recipe2, recipe3]

        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
                backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
                navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
//        let filterLayout = UICollectionViewFlowLayout()
//        filterLayout.scrollDirection = .horizontal
//        filterLayout.minimumInteritemSpacing = filterCellPadding
//        filterLayout.minimumLineSpacing = filterCellPadding
        
        let recipeLayout = UICollectionViewFlowLayout()
        recipeLayout.scrollDirection = .vertical
        recipeLayout.minimumInteritemSpacing = recipeCellPadding
        recipeLayout.minimumLineSpacing = recipeCellPadding
        
//        filterLabel.text = "FILTER BY"
//        filterLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
//        filterLabel.textColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
//        filterLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(filterLabel)
//
//        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
//        filterCollectionView.backgroundColor = .clear
//        filterCollectionView.showsHorizontalScrollIndicator = false
//        filterCollectionView.allowsMultipleSelection = true
//        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(filterCollectionView)
        
        recipeLabel.text = "Recipes"
        recipeLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 24)
        recipeLabel.textColor = .black
        recipeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recipeLabel)
        
        recipeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: recipeLayout)
        recipeCollectionView.backgroundColor = .clear
        recipeCollectionView.showsVerticalScrollIndicator = false
        recipeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recipeCollectionView)
        
        recipeButton.setTitle("ADD NEW >>", for: .normal)
        recipeButton.setTitleColor(.black, for: .normal)
//        recipeButton.backgroundColor = t
        recipeButton.layer.masksToBounds = true
        recipeButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        recipeButton.addTarget(self, action: #selector(addNewRecipe), for: .touchUpInside)
        recipeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recipeButton)
        
//        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterCellReuseIdentifier)
//        filterCollectionView.dataSource = self
//        filterCollectionView.delegate = self
        
        recipeCollectionView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: recipeCellReuseIdentifier)
        recipeCollectionView.dataSource = self
        recipeCollectionView.delegate = self
        
        if #available(iOS 10.0, *) {
            recipeCollectionView.refreshControl = refreshControl
        } else {
            recipeCollectionView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
    }
    
    func setUpConstraints() {
//        NSLayoutConstraint.activate([
//            filterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            filterLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23)
//        ])
//        NSLayoutConstraint.activate([
//            filterCollectionView.topAnchor.constraint(equalTo: filterLabel.bottomAnchor, constant: 5),
//            filterCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            filterCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            filterCollectionView.heightAnchor.constraint(equalToConstant: 40)
//        ])
        NSLayoutConstraint.activate([
           recipeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            recipeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23)
        ])
        NSLayoutConstraint.activate([
            recipeButton.bottomAnchor.constraint(equalTo: recipeLabel.bottomAnchor),
            recipeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            recipeButton.heightAnchor.constraint(equalToConstant: 12),
        ])
        NSLayoutConstraint.activate([
            recipeCollectionView.topAnchor.constraint(equalTo: recipeLabel.bottomAnchor, constant: 10),
            recipeCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            recipeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            recipeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    @objc func addNewRecipe() {
        let addRecipeViewController = AddRecipeViewController(delegate: self)
        navigationController?.present(addRecipeViewController, animated: true)
    }
    
    @objc func refreshData() {
        NetworkManager.getAllRecipes { recipesList in
            self.recipes = recipesList
            self.recipeCollectionView.reloadData()
            self.recipeCollectionView.refreshControl?.endRefreshing()
        }
    }
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension BrowserViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == filterCollectionView {
//            let filterCell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: filterCellReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
//            filterCell.configure(for: filters[indexPath.item])
//            return filterCell
//        }
        let recipeCell = recipeCollectionView.dequeueReusableCell(withReuseIdentifier: recipeCellReuseIdentifier, for: indexPath) as! RecipeCollectionViewCell
        recipeCell.configure(for: recipes[indexPath.item], image: images[indexPath.item])
        return recipeCell
    }
}

extension BrowserViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == filterCollectionView {
//            return CGSize(width: 100, height: 30)
//        }
        let size = (collectionView.frame.width - recipeCellPadding) / 2.0
        return CGSize(width: size, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let groceryViewController = RecipeViewController(recipe: recipes[indexPath.item])
        navigationController?.present(groceryViewController, animated: true)
    }
}

extension BrowserViewController: RecipeDelegate {
    func addRecipe(newTitle: String, newIngredients: String, newDescription: String) {
        NetworkManager.createRecipe(title: newTitle, description: newDescription, ingredients: newIngredients) { recipe in
            self.recipes.append(recipe)
            self.recipeCollectionView.reloadData()
        }
    }
}
