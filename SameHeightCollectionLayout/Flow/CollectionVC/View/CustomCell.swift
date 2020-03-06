//
//  CustomCell.swift
//  SameHeightCollectionLayout
//
//  Created by Константин Маламуж on 04.03.2020.
//  Copyright © 2020 Константин Маламуж. All rights reserved.
//

import UIKit
import PinLayout

class CustomCell: UICollectionViewCell {
    
    static let id = "CustomCell"
    
    lazy var trackLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        trackLabel.pin.all(20)
    }
    
    func setCell(index: IndexPath) {
        self.backgroundColor = UIColor(red:0.29, green:0.21, blue:0.34, alpha:1.0)
        self.addSubview(trackLabel)
        trackLabel.text = "\(index.row)"

    }
    
}
