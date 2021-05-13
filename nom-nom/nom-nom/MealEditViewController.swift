//
//  MealEditViewController.swift
//  nom-nom
//
//  Created by Arianna Curillo on 5/9/21.
//

import UIKit

class MealEditViewController: UIViewController {
    
    weak var delegate: MealDelegate?
    var index: Int?

    private var breakfastLabel : UILabel = UILabel()
    private var breakfastTextField : UITextField = UITextField()
    let breakfastPadding = UIView(frame: CGRect(x: 0, y: 0, width: 22 , height: 1))
    private var lunchLabel : UILabel = UILabel()
    private var lunchTextField : UITextField = UITextField()
    let lunchPadding = UIView(frame: CGRect(x: 0, y: 0, width: 22 , height: 1))
    private var dinnerLabel : UILabel = UILabel()
    private var dinnerTextField : UITextField = UITextField()
    let dinnerPadding = UIView(frame: CGRect(x: 0, y: 0, width: 22 , height: 1))
    private var saveButton : UIButton = UIButton()
    let invalidBreakfast = UILabel()
    let invalidLunch = UILabel()
    let invalidDinner = UILabel()
    
    
    init(delegate: MealDelegate, index: Int) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
        self.index = index
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        
        breakfastLabel.text = "Breakfast"
        breakfastLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        breakfastLabel.textColor = .black
        breakfastLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(breakfastLabel)
        
        breakfastTextField.attributedPlaceholder = NSAttributedString(string: "Breakfast", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        breakfastTextField.layer.borderWidth = 1
        breakfastTextField.layer.cornerRadius = 22
        breakfastTextField.layer.borderColor = UIColor.gray.cgColor
        breakfastTextField.leftView = breakfastPadding
        breakfastTextField.leftViewMode = .always
        breakfastTextField.font = UIFont(name: "HelveticaNeue", size: 12)
        breakfastTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(breakfastTextField)
        
        lunchLabel.text = "Lunch"
        lunchLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        lunchLabel.textColor = .black
        lunchLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lunchLabel)
        
        lunchTextField.attributedPlaceholder = NSAttributedString(string: "Lunch", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        lunchTextField.layer.borderWidth = 1
        lunchTextField.layer.cornerRadius = 22
        lunchTextField.layer.borderColor = UIColor.gray.cgColor
        lunchTextField.leftView = lunchPadding
        lunchTextField.leftViewMode = .always
        lunchTextField.font = UIFont(name: "HelveticaNeue", size: 12)
        lunchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lunchTextField)
        
        dinnerLabel.text = "Dinner"
        dinnerLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        dinnerLabel.textColor = .black
        dinnerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dinnerLabel)
        
        dinnerTextField.attributedPlaceholder = NSAttributedString(string: "Dinner", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        dinnerTextField.layer.borderWidth = 1
        dinnerTextField.layer.cornerRadius = 22
        dinnerTextField.layer.borderColor = UIColor.gray.cgColor
        dinnerTextField.leftView = dinnerPadding
        dinnerTextField.leftViewMode = .always
        dinnerTextField.font = UIFont(name: "HelveticaNeue", size: 12)
        dinnerTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dinnerTextField)
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor = .white
        saveButton.layer.cornerRadius = 14
        saveButton.layer.borderWidth = 1
        saveButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        invalidBreakfast.text = "Invalid breakfast!"
        invalidBreakfast.font = UIFont(name: "HelveticaNeue-Light", size: 10)
        invalidBreakfast.textColor = .red
        invalidBreakfast.isHidden = true
        invalidBreakfast.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(invalidBreakfast)
        
        invalidLunch.text = "Invalid breakfast!"
        invalidLunch.font = UIFont(name: "HelveticaNeue-Light", size: 10)
        invalidLunch.textColor = .red
        invalidLunch.isHidden = true
        invalidLunch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(invalidLunch)
        
        invalidDinner.text = "Invalid breakfast!"
        invalidDinner.font = UIFont(name: "HelveticaNeue-Light", size: 10)
        invalidDinner.textColor = .red
        invalidDinner.isHidden = true
        invalidDinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(invalidDinner)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            breakfastLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            breakfastLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        NSLayoutConstraint.activate([
            breakfastTextField.topAnchor.constraint(equalTo: breakfastLabel.bottomAnchor, constant: 10),
            breakfastTextField.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor),
            breakfastTextField.widthAnchor.constraint(equalToConstant: 350),
            breakfastTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            invalidBreakfast.topAnchor.constraint(equalTo: breakfastTextField.bottomAnchor, constant: 4),
            invalidBreakfast.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            lunchLabel.topAnchor.constraint(equalTo: breakfastTextField.bottomAnchor, constant: 20),
            lunchLabel.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            lunchTextField.topAnchor.constraint(equalTo: lunchLabel.bottomAnchor, constant: 10),
            lunchTextField.leadingAnchor.constraint(equalTo: lunchLabel.leadingAnchor),
            lunchTextField.widthAnchor.constraint(equalToConstant: 350),
            lunchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            invalidLunch.topAnchor.constraint(equalTo: lunchTextField.bottomAnchor, constant: 4),
            invalidLunch.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            dinnerLabel.topAnchor.constraint(equalTo: lunchTextField.bottomAnchor, constant: 20),
            dinnerLabel.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            dinnerTextField.topAnchor.constraint(equalTo: dinnerLabel.bottomAnchor, constant: 10),
            dinnerTextField.leadingAnchor.constraint(equalTo: dinnerLabel.leadingAnchor),
            dinnerTextField.widthAnchor.constraint(equalToConstant: 350),
            dinnerTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            invalidDinner.topAnchor.constraint(equalTo: dinnerTextField.bottomAnchor, constant: 4),
            invalidDinner.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: dinnerTextField.bottomAnchor, constant: 20),
            saveButton.widthAnchor.constraint(equalToConstant: 120),
            saveButton.heightAnchor.constraint(equalToConstant: 32),
        ])
        
    }
    
    @objc func dismissViewController() {
        if let breakfastText = breakfastTextField.text, let lunchText = lunchTextField.text, let dinnerText = dinnerTextField.text, let index = index {
            if breakfastText != "" && lunchText != "" && dinnerText != "" {
                // call delegate function
                delegate?.changeMenu(newBreakfast: breakfastText, newLunch: lunchText, newDinner: dinnerText, index: index)
                // dismiss view controller
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
