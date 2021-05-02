//
//  GroceryViewController.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/1/21.
//

import UIKit

class GroceryViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subLabel = UILabel()
    let subLabelLine = UIView()
    let dateTextField = UITextField()
    let commentTextField = UITextField()
    let addButton = UIButton()
    let reasonsLabel = UILabel()
    let reasonsLabelLine = UIView()
    let reasonsTextView = UITextView()
    let invalidLabel = UILabel()
    let datePadding = UIView(frame: CGRect(x: 0, y: 0, width: 22 , height: 1))
    let commentPadding = UIView(frame: CGRect(x: 0, y: 0, width: 22 , height: 1))
    let lightBlue = UIColor.init(red: 209/255, green: 217/255, blue: 213/255, alpha: 1)
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Grocery List"

        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        
        titleLabel.text = "What do you need?"
        titleLabel.textColor = UIColor.init(red: 68/255, green: 68/255, blue: 54/255, alpha: 1)
        titleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        subLabel.text = "something yummy"
        subLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        subLabel.textColor = lightBlue
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subLabel)
        
        subLabelLine.backgroundColor = lightBlue
        subLabelLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subLabelLine)
        
        dateTextField.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        dateTextField.attributedPlaceholder = NSAttributedString(string: "date (mm/dd)", attributes: [NSAttributedString.Key.foregroundColor: lightBlue])
        dateTextField.layer.borderWidth = 1
        dateTextField.layer.cornerRadius = 22
        dateTextField.layer.borderColor = lightBlue.cgColor
        dateTextField.leftView = datePadding
        dateTextField.leftViewMode = .always
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateTextField)
        
        commentTextField.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        commentTextField.attributedPlaceholder = NSAttributedString(string: "comment", attributes: [NSAttributedString.Key.foregroundColor: lightBlue])
        commentTextField.layer.borderWidth = 1
        commentTextField.layer.cornerRadius = 22
        commentTextField.layer.borderColor = lightBlue.cgColor
        commentTextField.leftView = commentPadding
        commentTextField.leftViewMode = .always
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(commentTextField)
        
        addButton.setTitle("ADD IT >>", for: .normal)
        addButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        addButton.setTitleColor(UIColor.init(red: 94/255, green: 74/255, blue: 48/255, alpha: 1), for: .normal)
        addButton.addTarget(self, action: #selector(addText), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
        reasonsLabel.text = "grocery items"
        reasonsLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        reasonsLabel.textColor = lightBlue
        reasonsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reasonsLabel)
        
        reasonsLabelLine.backgroundColor = lightBlue
        reasonsLabelLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reasonsLabelLine)
        
        reasonsTextView.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        reasonsTextView.textAlignment = .left
        reasonsTextView.isUserInteractionEnabled = false
        reasonsTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reasonsTextView)
        
        invalidLabel.text = "invalid date format or comment!"
        invalidLabel.font = UIFont(name: "HelveticaNeue-Light", size: 12)
        invalidLabel.textColor = .red
        invalidLabel.isHidden = true
        invalidLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(invalidLabel)
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        NSLayoutConstraint.activate([
            subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            subLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            subLabelLine.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 1),
            subLabelLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subLabelLine.heightAnchor.constraint(equalToConstant: 1),
            subLabelLine.widthAnchor.constraint(equalToConstant: 343)
        ])
        
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: subLabelLine.bottomAnchor, constant: 8),
            dateTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateTextField.heightAnchor.constraint(equalToConstant: 44),
            dateTextField.widthAnchor.constraint(equalToConstant: 148)
        ])
        
        NSLayoutConstraint.activate([
            commentTextField.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 8),
            commentTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            commentTextField.heightAnchor.constraint(equalToConstant: 44),
            commentTextField.widthAnchor.constraint(equalToConstant: 343),
        ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: commentTextField.bottomAnchor, constant: 6),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 36),
            addButton.widthAnchor.constraint(equalToConstant: 146)
        ])
        
        NSLayoutConstraint.activate([
            reasonsLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 8),
            reasonsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            reasonsLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            reasonsLabelLine.topAnchor.constraint(equalTo: reasonsLabel.bottomAnchor, constant: 1),
            reasonsLabelLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reasonsLabelLine.heightAnchor.constraint(equalToConstant: 1),
            reasonsLabelLine.widthAnchor.constraint(equalToConstant: 343)
        ])
        
        NSLayoutConstraint.activate([
            reasonsTextView.topAnchor.constraint(equalTo: reasonsLabelLine.bottomAnchor, constant: 8),
            reasonsTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reasonsTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -21),
            reasonsTextView.widthAnchor.constraint(equalToConstant: 330)
        ])
        
        NSLayoutConstraint.activate([
            invalidLabel.topAnchor.constraint(equalTo: commentTextField.bottomAnchor, constant: 2),
            invalidLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            invalidLabel.heightAnchor.constraint(equalToConstant: 13)
        ])
    }
    
    @objc func addText() {
        let date : String = dateTextField.text!
        let reason : String = commentTextField.text!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        
        if dateFormatter.date(from: date) == nil || reason == "" {
            invalidLabel.isHidden = false
        } else {
            reasonsTextView.text = reasonsTextView.text + "- " + date + ": " + reason + "\n"
            invalidLabel.isHidden = true
        }
    }
    

}
