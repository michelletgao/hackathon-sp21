//
//  MealPlannerViewController.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/8/21.
//

import UIKit

//protocol MealDelegate: class {
//    func changeMenu(newBreakfast: String, newLunch: String, newDinner: String, index: Int)
//}

//let meals = [Meal(breakfast: "oatmeal", lunch: "sandwich", dinner: "burrito bowl")]

let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

class MealPlannerViewController: UIViewController {

    var dayCollectionView: UICollectionView = UICollectionView()
    private let dayCellReuseIdentifier = "dayCellReuseIdentifier"
    private let dayCellPadding: CGFloat = 15
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        let dayLayout = UICollectionViewFlowLayout()
        dayLayout.scrollDirection = .vertical
        dayLayout.minimumInteritemSpacing = dayCellPadding
        dayLayout.minimumLineSpacing = dayCellPadding
        
        dayCollectionView = UICollectionView(frame: .zero, collectionViewLayout: dayLayout)
        dayCollectionView.backgroundColor = .clear
        dayCollectionView.showsVerticalScrollIndicator = false
        dayCollectionView.allowsMultipleSelection = true
        dayCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dayCollectionView)
        
        dayCollectionView.register(DayCollectionViewCell.self, forCellWithReuseIdentifier: dayCellReuseIdentifier)
        dayCollectionView.dataSource = self
        dayCollectionView.delegate = self
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            dayCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            dayCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            dayCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dayCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

}

extension MealPlannerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dayCell = dayCollectionView.dequeueReusableCell(withReuseIdentifier: dayCellReuseIdentifier, for: indexPath) as! DayCollectionViewCell
        return dayCell
    }
}

extension MealPlannerViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mealEditViewController = MealEditViewController()
        navigationController?.present(mealEditViewController, animated: true)
    }
}

//extension MealPlannerViewController: MealDelegate {
//    func changeMenu(newBreakfast: String, newLunch: String, newDinner: String, index: Int) {
//        let newMenu = meals[index]
//        newMenu.breakfast = newBreakfast
//        newMenu.lunch = newLunch
//        newMenu.dinner = newDinner
//        dayCollectionView.reloadData()
//    }
//
//}
