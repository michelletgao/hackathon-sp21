//
//  MealPlannerViewController.swift
//  nom-nom
//
//  Created by Michelle Gao on 5/8/21.
//

import UIKit

class MealPlannerViewController: UIViewController {

    private var dayCollectionView: UICollectionView!
    
    private let dayCellReuseIdentifier = "dayCellReuseIdentifier"
    
    private let dayCellPadding: CGFloat = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
    }

}

extension MealPlannerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension MealPlannerViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
}
