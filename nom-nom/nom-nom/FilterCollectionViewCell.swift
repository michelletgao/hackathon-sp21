//
//  FilterCollectionViewCell.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/5/21.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    private var filterLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.font = UIFont.systemFont(ofSize: 16)
        filterLabel.textColor = UIColor(red: 111/255, green: 177/255, blue: 238/255, alpha: 1)
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(red: 111/255, green: 177/255, blue: 238/255, alpha: 1).cgColor
        contentView.layer.cornerRadius = 6
        contentView.addSubview(filterLabel)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            filterLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            filterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(for filter: Filter) {
        filterLabel.text = filter.label
        if filter.selected {
            filterLabel.textColor = .white
            contentView.layer.backgroundColor = UIColor(red: 111/255, green: 177/255, blue: 238/255, alpha: 1).cgColor
        }
        else {
            filterLabel.textColor = UIColor(red: 111/255, green: 177/255, blue: 238/255, alpha: 1)
            contentView.backgroundColor = .white
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
