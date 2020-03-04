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
        
    }

}


extension CollectionVC: UICollectionViewDelegate {
    
}


extension CollectionVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.id, for: indexPath) as! CustomCell
        cell.setCell()
        return cell
    }
}


extension CollectionVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/2-7.5
        let height = width * 1.53
        return CGSize(width: width, height: height)
    }
    
}
