//
//  CollectionVC.swift
//  SameHeightCollectionLayout
//
//  Created by Константин Маламуж on 04.03.2020.
//  Copyright © 2020 Константин Маламуж. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController {

    let mainView = CustomCollectionView()
    
//    let heightValues: [CGFloat] = [100, 120, 80, 75, 110, 180, 300, 105, 220, 115, 80, 120, 100, 250, 225, 230, 150, 160, 165, 180, 190, 100, 80, 70]
    
    let heightValues: [CGFloat] = [150, 100, 300, 80, 20, 40, 20, 15, 400, 100, 150]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mainView)
        self.view.backgroundColor = .white
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        if #available(iOS 11.0, *) {
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            mainView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
            mainView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            mainView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
            mainView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            mainView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            mainView.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor).isActive = true
        }

        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        if let layout = mainView.collectionView.collectionViewLayout as? NewCollectionLayout {
            layout.delegate = self
        }
        
    }

}


extension CollectionVC: UICollectionViewDelegate {
    
}


extension CollectionVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heightValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.id, for: indexPath) as! CustomCell
        cell.setCell(index: indexPath)
        return cell
    }
}

extension CollectionVC: CustomLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, indexPath: IndexPath) -> CGFloat {
        return heightValues[indexPath.row]
    }
    
}
