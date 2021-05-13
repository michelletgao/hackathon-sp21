//
//  FeatureCollectionViewCell.swift
//  nom-nom
//
//  Created by Michelle Gao on 4/29/21.
//

import UIKit

class FeatureCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView = UIImageView()
    private var titleLabel: UILabel = UILabel()
    private var descriptionLabel: UILabel = UILabel()
    private var presentButton: UIButton = UIButton()
    let lightGreen = UIColor(red: 112/255, green: 144/255, blue: 83/255, alpha: 1)

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1).cgColor
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowOpacity = 0.25
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        contentView.clipsToBounds = false
        contentView.layer.masksToBounds = false
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        descriptionLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        descriptionLabel.textColor = .black
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        
//        presentButton.setTitle(">>>", for: .normal)
//        presentButton.setTitleColor(.black, for: .normal)
//        presentButton.backgroundColor = .white
//        presentButton.layer.cornerRadius = 6
//        presentButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
//        presentButton.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(presentButton)
        
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
        ])
        
    }
    
    func configure(for featureObject: Feature) {
        imageView.image = featureObject.image
        titleLabel.text = featureObject.title
        descriptionLabel.text = featureObject.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
