//
//  MealPlannerViewController.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/8/21.
//

import UIKit

protocol MealDelegate: AnyObject {
    func changeMenu(newBreakfast: String, newLunch: String, newDinner: String, index: Int)
}

let meals = [Meal(day: "Monday", breakfast: "oatmeal", lunch: "sandwich", dinner: "burrito bowl"),
             Meal(day: "Tuesday", breakfast: "oatmeal", lunch: "sandwich", dinner: "burrito bowl"),
             Meal(day: "Wednesday", breakfast: "oatmeal", lunch: "sandwich", dinner: "burrito bowl"),
             Meal(day: "Thursday", breakfast: "oatmeal", lunch: "sandwich", dinner: "burrito bowl"),
             Meal(day: "Friday", breakfast: "oatmeal", lunch: "sandwich", dinner: "burrito bowl"),
             Meal(day: "Saturday", breakfast: "oatmeal", lunch: "sandwich", dinner: "burrito bowl"),
             Meal(day: "Sunday", breakfast: "oatmeal", lunch: "sandwich", dinner: "burrito bowl")]

let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]



class MealPlannerViewController: UIViewController {

    private var plannerLabel: UILabel = UILabel()
    var dayCollectionView: UICollectionView!
    private let dayCellReuseIdentifier = "dayCellReuseIdentifier"
    private let dayCellPadding: CGFloat = 15
    var meals: [Meal] = []
    
    let refreshControl = UIRefreshControl()
    private let backButton = UIButton()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "try")!)
        title = "Meal Planner"
        refreshData()
        
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
                backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
                navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        plannerLabel.text = "This Week's Eats:"
        plannerLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        plannerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plannerLabel)
        
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
        
        if #available(iOS 10.0, *) {
            dayCollectionView.refreshControl = refreshControl
        } else {
            dayCollectionView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            plannerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            plannerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            dayCollectionView.topAnchor.constraint(equalTo: plannerLabel.bottomAnchor, constant: 20),
            dayCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            dayCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dayCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func refreshData() {
        NetworkManager.getAllMeals { mealsList in
            self.meals = mealsList
            self.dayCollectionView.reloadData()
            self.dayCollectionView.refreshControl?.endRefreshing()
        }
    }
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }

}

extension MealPlannerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dayCell = dayCollectionView.dequeueReusableCell(withReuseIdentifier: dayCellReuseIdentifier, for: indexPath) as! DayCollectionViewCell
        let dayObject = meals[indexPath.item]
        dayCell.configure(with: dayObject, dayString: days[indexPath.item])
        return dayCell
    }
}

extension MealPlannerViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 330, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mealEditViewController = MealEditViewController(delegate: self, index: indexPath.item)
        navigationController?.present(mealEditViewController, animated: true)
    }
}

extension MealPlannerViewController: MealDelegate {
    func changeMenu(newBreakfast: String, newLunch: String, newDinner: String, index: Int) {
        let newMenu = meals[index]
        newMenu.breakfast = newBreakfast
        newMenu.lunch = newLunch
        newMenu.dinner = newDinner
        dayCollectionView.reloadData()
    }

}
