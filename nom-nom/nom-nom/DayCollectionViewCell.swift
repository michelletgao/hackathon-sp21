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
    private var breakfastLine : UIView = UIView()
    private var lunchLine : UIView = UIView()
    private var dinnerLine : UIView = UIView()
    let lightBlue = UIColor(red: 161/255, green: 206/255, blue: 255/255, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.layer.borderWidth = 1
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowOpacity = 0.25
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        dayLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        dayLabel.textColor = lightBlue
        dayLabel.text = "Day"
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dayLabel)
        
        breakfastLabel.text = "Breakfast"
        breakfastLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        breakfastLabel.textColor = .black
        breakfastLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(breakfastLabel)
        
        breakfastLine.backgroundColor = .black
        breakfastLine.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(breakfastLine)
        
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
        
        lunchLine.backgroundColor = .black
        lunchLine.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lunchLine)
        
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
        
        dinnerLine.backgroundColor = .black
        dinnerLine.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dinnerLine)
        
        dinnerTextView.text = "dummy dinner"
        dinnerTextView.font = UIFont(name: "HelveticaNeue", size: 12)
        dinnerTextView.isEditable = false
        dinnerTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dinnerTextView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
        NSLayoutConstraint.activate([
            breakfastLabel.topAnchor.constraint(equalTo: dayLabel.topAnchor, constant: 35),
            breakfastLabel.leadingAnchor.constraint(equalTo: dayLabel.leadingAnchor),
        ])
        NSLayoutConstraint.activate([
            breakfastLine.topAnchor.constraint(equalTo: breakfastLabel.bottomAnchor, constant: 1),
            breakfastLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            breakfastLine.heightAnchor.constraint(equalToConstant: 0.7),
            breakfastLine.widthAnchor.constraint(equalToConstant: 294)
        ])
        NSLayoutConstraint.activate([
            breakfastTextView.topAnchor.constraint(equalTo: breakfastLabel.bottomAnchor, constant: 5),
            breakfastTextView.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor),
            breakfastTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            breakfastTextView.heightAnchor.constraint(equalToConstant: 25)
        ])
        NSLayoutConstraint.activate([
            lunchLabel.topAnchor.constraint(equalTo: breakfastTextView.bottomAnchor, constant: 15),
            lunchLabel.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor),
        ])
        NSLayoutConstraint.activate([
            lunchLine.topAnchor.constraint(equalTo: lunchLabel.bottomAnchor, constant: 1),
            lunchLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lunchLine.heightAnchor.constraint(equalToConstant: 0.7),
            lunchLine.widthAnchor.constraint(equalToConstant: 294)
        ])
        NSLayoutConstraint.activate([
            lunchTextView.topAnchor.constraint(equalTo: lunchLabel.bottomAnchor, constant: 5),
            lunchTextView.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor),
            lunchTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            lunchTextView.heightAnchor.constraint(equalToConstant: 25)
        ])
        NSLayoutConstraint.activate([
            dinnerLabel.topAnchor.constraint(equalTo: lunchTextView.bottomAnchor, constant: 15),
            dinnerLabel.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor),
        ])
        NSLayoutConstraint.activate([
            dinnerLine.topAnchor.constraint(equalTo: dinnerLabel.bottomAnchor, constant: 1),
            dinnerLine.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dinnerLine.heightAnchor.constraint(equalToConstant: 0.7),
            dinnerLine.widthAnchor.constraint(equalToConstant: 294)
        ])
        NSLayoutConstraint.activate([
            dinnerTextView.topAnchor.constraint(equalTo: dinnerLabel.bottomAnchor, constant: 5),
            dinnerTextView.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor),
            dinnerTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dinnerTextView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func configure(with mealObject: Meal, dayString: String) {
        dayLabel.text = dayString
        breakfastTextView.text = "- " + mealObject.breakfast
        lunchTextView.text = "- " + mealObject.lunch
        dinnerTextView.text = "- " + mealObject.dinner
    }
}
