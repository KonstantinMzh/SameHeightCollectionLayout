//
//  CustomCollectionView.swift
//  SameHeightCollectionLayout
//
//  Created by Константин Маламуж on 04.03.2020.
//  Copyright © 2020 Константин Маламуж. All rights reserved.
//

import UIKit
import PinLayout

class CustomCollectionView: UIView {
    
    lazy var collectionView: UICollectionView = {

        let layout = CustomCollectionLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.id)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    

    init() {
        super.init(frame: .zero)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.pin.all(0)
    }
    
    func setView() {
        self.addSubview(collectionView)
    }
    


}
