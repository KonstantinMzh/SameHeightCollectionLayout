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
        
    }

}
