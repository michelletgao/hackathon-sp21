//
//  MealEditViewController.swift
//  nom-nom
//
//  Created by Arianna Curillo on 5/9/21.
//

import UIKit

class MealEditViewController: UIViewController {
    
//    weak var delegate: MealDelegate?
//    var index: Int?

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
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        
        breakfastLabel.text = "Breakfast"
        breakfastLabel.font = UIFont(name: "HelveticaNeue", size: 14)
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
        lunchLabel.font = UIFont(name: "HelveticaNeue", size: 14)
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
        dinnerLabel.font = UIFont(name: "HelveticaNeue", size: 14)
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
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor = .white
        saveButton.layer.cornerRadius = 4
//        saveButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            breakfastLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            breakfastLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            breakfastTextField.topAnchor.constraint(equalTo: breakfastLabel.bottomAnchor, constant: 10),
            breakfastTextField.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor),
            breakfastTextField.widthAnchor.constraint(equalToConstant: 350),
            breakfastTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            lunchLabel.topAnchor.constraint(equalTo: breakfastTextField.bottomAnchor, constant: 10),
            lunchLabel.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            lunchTextField.topAnchor.constraint(equalTo: lunchLabel.bottomAnchor, constant: 10),
            lunchTextField.leadingAnchor.constraint(equalTo: lunchLabel.leadingAnchor),
            lunchTextField.widthAnchor.constraint(equalToConstant: 350),
            lunchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            dinnerLabel.topAnchor.constraint(equalTo: lunchTextField.bottomAnchor, constant: 10),
            dinnerLabel.leadingAnchor.constraint(equalTo: breakfastLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            dinnerTextField.topAnchor.constraint(equalTo: dinnerLabel.bottomAnchor, constant: 10),
            dinnerTextField.leadingAnchor.constraint(equalTo: dinnerLabel.leadingAnchor),
            dinnerTextField.widthAnchor.constraint(equalToConstant: 350),
            dinnerTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
            saveButton.widthAnchor.constraint(equalToConstant: 120),
            saveButton.heightAnchor.constraint(equalToConstant: 32),
        ])
        
    }
    
//    @objc func dismissViewController() {
//        // data validation - no empty fields
//        guard let breakfastText = breakfastTextField.text else {return}
//        guard let lunchText = lunchTextField.text else {return}
//        guard let dinnerText = dinnerTextField.text else {return}
//        guard let index = index else {return}
//        if breakfastText != "" && lunchText != "" && dinnerText != "" {
//            // call delegate function
//            delegate?.changeMenu(newBreakfast: breakfastText, newLunch: lunchText, newDinner: dinnerText, index: index)
//            // dismiss view controller
////            navigationController?.popViewController(animated: true)
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
