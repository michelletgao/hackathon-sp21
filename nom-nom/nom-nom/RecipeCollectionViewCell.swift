//
//  RecipeCollectionViewCell.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/5/21.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView = UIImageView()
    private var recipeLabel: UILabel = UILabel()
    private var favoritedButton: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
//        contentView.layer.borderWidth = 1
//        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 6
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowOpacity = 0.25
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        recipeLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        recipeLabel.textColor = .black
        recipeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(recipeLabel)
        
        favoritedButton.setImage(UIImage(named: "staroutline"), for: .normal)
        favoritedButton.addTarget(self, action: #selector(favoriteRecipe), for: .touchUpInside)
        favoritedButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favoritedButton)
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageView.heightAnchor.constraint(equalToConstant: 90),
            imageView.widthAnchor.constraint(equalToConstant: 172)
        ])
        NSLayoutConstraint.activate([
            recipeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            recipeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            recipeLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
        NSLayoutConstraint.activate([
            favoritedButton.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            favoritedButton.topAnchor.constraint(equalTo: recipeLabel.topAnchor),
            favoritedButton.widthAnchor.constraint(equalToConstant: 20),
            favoritedButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc func favoriteRecipe() {
        favoritedButton.isSelected.toggle()
        if favoritedButton.isSelected {
            favoritedButton.setImage(UIImage(named: "star"), for: .normal)
        }
        else {
            favoritedButton.setImage(UIImage(named: "staroutline"), for: .normal)
        }
    }
    
    func configure(for recipeObject: Recipe, image: String ) {
        imageView.image = UIImage(named: image)
        recipeLabel.text = recipeObject.title
        favoritedButton.isSelected = recipeObject.favorited
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
