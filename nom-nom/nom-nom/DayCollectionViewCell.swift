//
//  DayCollectionViewCell.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/8/21.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
    
    private var dayLabel: UILabel = UILabel()
    private var breakfastLabel: UILabel = UILabel()
    private var breakfastTextView : UITextView = UITextView()
    private var lunchLabel: UILabel = UILabel()
    private var lunchTextView : UITextView = UITextView()
    private var dinnerLabel: UILabel = UILabel()
    private var dinnerTextView : UITextView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        dayLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        dayLabel.textColor = .black
        dayLabel.text = "Day"
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dayLabel)
        
        breakfastLabel.text = "Breakfast"
        breakfastLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        breakfastLabel.textColor = .black
        breakfastLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(breakfastLabel)
        
        breakfastTextView.text = "dummy breakfast"
        breakfastTextView.font = UIFont(name: "HelveticaNeue", size: 12)
        breakfastTextView.isEditable = false
        breakfastTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(breakfastTextView)
        
        lunchLabel.text = "Lunch"
        lunchLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        lunchLabel.textColor = .black
        lunchLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lunchLabel)
        
        lunchTextView.text = "dummy lunch"
        lunchTextView.font = UIFont(name: "HelveticaNeue", size: 12)
        lunchTextView.isEditable = false
        lunchTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lunchTextView)
        
        dinnerLabel.text = "Dinner"
        dinnerLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        dinnerLabel.textColor = .black
        dinnerLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dinnerLabel)
        
        dinnerTextView.text = "dummy dinner"
        dinnerTextView.font = UIFont(name: "HelveticaNeue", size: 12)
        dinnerTextView.isEditable = false
        dinnerTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dinnerTextView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        NSLayoutConstraint.activate([
            breakfastLabel.topAnchor.constraint(equalTo: dayLabel.topAnchor, constant: 30),
            breakfastLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        ])
        NSLayoutConstraint.activate([
            breakfastTextView.topAnchor.constraint(equalTo: breakfastLabel.bottomAnchor, constant: 5),
            breakfastTextView.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor),
            breakfastTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            breakfastTextView.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            lunchLabel.topAnchor.constraint(equalTo: breakfastTextView.bottomAnchor, constant: 15),
            lunchLabel.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor),
        ])
        NSLayoutConstraint.activate([
            lunchTextView.topAnchor.constraint(equalTo: lunchLabel.bottomAnchor, constant: 5),
            lunchTextView.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor),
            lunchTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            lunchTextView.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            dinnerLabel.topAnchor.constraint(equalTo: lunchTextView.bottomAnchor, constant: 15),
            dinnerLabel.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor),
        ])
        NSLayoutConstraint.activate([
            dinnerTextView.topAnchor.constraint(equalTo: dinnerLabel.bottomAnchor, constant: 5),
            dinnerTextView.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor),
            dinnerTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dinnerTextView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
