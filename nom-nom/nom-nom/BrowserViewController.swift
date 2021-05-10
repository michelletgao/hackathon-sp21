//
//  BrowserViewController.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/5/21.
//

import UIKit

class BrowserViewController: UIViewController {
    
    private var filterCollectionView: UICollectionView!
    private var recipeCollectionView: UICollectionView!
    
    private var filterLabel: UILabel = UILabel()
    private var recipeLabel: UILabel = UILabel()
    
    private var filters: [Filter] = []
    private var recipes: [Recipe] = [] 
    
    private let filterCellReuseIdentifier = "filterCellReuseIdentifier"
    private let recipeCellReuseIdentifier = "recipeCellReuseIdentifier"
    private let filterCellPadding: CGFloat = 8
    private let recipeCellPadding: CGFloat = 16
    
    let vegan = Filter(label: "Vegan")
    let vegetarian = Filter(label: "Vegetarian")
    let glutenfree = Filter(label: "Gluten-Free")
    let rice = Ingredient(name: "rice")
    let beans = Ingredient(name: "beans")
    let peppers = Ingredient(name: "peppers")
    let onions = Ingredient(name: "onions")
    let corn = Ingredient(name: "corn")
    let lettuce = Ingredient(name: "lettuce")
    let tofu = Ingredient(name: "tofu")
    let egg = Ingredient(name: "egg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Recipe Browser"
        
        let recipe1 = Recipe(image: UIImage(named: "food")! , title: "burrito bowl", ingredients: [rice, beans, peppers, onions, corn, lettuce], description: "a tasty bowl of love", restrictions: [vegan, vegetarian, glutenfree], favorited: false)
        let recipe2 = Recipe(image: UIImage(named: "grocerybag")!, title: "rice and beans", ingredients: [rice, beans], description: "a simple dish", restrictions: [vegan, vegetarian, glutenfree], favorited: false)
        let recipe3 = Recipe(image: UIImage(named: "grocerybag")!, title: "fried rice", ingredients: [rice, peppers, onions, tofu, egg ], description: "basic fried rice", restrictions: [vegetarian, glutenfree], favorited: false)
        
        filters = [vegan, vegetarian, glutenfree]
        recipes = [recipe1, recipe2, recipe3]

        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        let filterLayout = UICollectionViewFlowLayout()
        filterLayout.scrollDirection = .horizontal
        filterLayout.minimumInteritemSpacing = filterCellPadding
        filterLayout.minimumLineSpacing = filterCellPadding
        
        let recipeLayout = UICollectionViewFlowLayout()
        recipeLayout.scrollDirection = .vertical
        recipeLayout.minimumInteritemSpacing = recipeCellPadding
        recipeLayout.minimumLineSpacing = recipeCellPadding
        
        filterLabel.text = "FILTER BY"
        filterLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        filterLabel.textColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterLabel)
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
        filterCollectionView.backgroundColor = .clear
        filterCollectionView.showsHorizontalScrollIndicator = false
        filterCollectionView.allowsMultipleSelection = true
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterCollectionView)
        
        recipeLabel.text = "RECIPES"
        recipeLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        recipeLabel.textColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        recipeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recipeLabel)
        
        recipeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: recipeLayout)
        recipeCollectionView.backgroundColor = .clear
        recipeCollectionView.showsVerticalScrollIndicator = false
        recipeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recipeCollectionView)
        
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterCellReuseIdentifier)
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        
        recipeCollectionView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: recipeCellReuseIdentifier)
        recipeCollectionView.dataSource = self
        recipeCollectionView.delegate = self
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            filterLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23)
        ])
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: filterLabel.bottomAnchor, constant: 5),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            filterCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
           recipeLabel.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: 20),
            recipeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23)
        ])
        NSLayoutConstraint.activate([
            recipeCollectionView.topAnchor.constraint(equalTo: recipeLabel.bottomAnchor, constant: 10),
            recipeCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            recipeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            recipeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
}

extension BrowserViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == filterCollectionView {
            return filters.count
        }
        else {
            return recipes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == filterCollectionView {
            let filterCell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: filterCellReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
            filterCell.configure(for: filters[indexPath.item])
            return filterCell
        }
        else {
            let filterCell = recipeCollectionView.dequeueReusableCell(withReuseIdentifier: recipeCellReuseIdentifier, for: indexPath) as! RecipeCollectionViewCell
            filterCell.configure(for: recipes[indexPath.item])
            return filterCell
        }
    }
}

extension BrowserViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == filterCollectionView {
            return CGSize(width: 100, height: 30)
        }
        else {
            let size = (collectionView.frame.width - recipeCellPadding) / 2.0
            return CGSize(width: size, height: 130)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let groceryViewController = RecipeViewController(recipe: recipes[indexPath.item])
        navigationController?.present(groceryViewController, animated: true)
    }
}
