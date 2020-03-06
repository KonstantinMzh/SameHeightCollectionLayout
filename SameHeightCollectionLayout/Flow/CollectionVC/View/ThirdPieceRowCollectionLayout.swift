//
//  ThirdPieceRowCollectionLayout.swift
//  SameHeightCollectionLayout
//
//  Created by Константин Маламуж on 06.03.2020.
//  Copyright © 2020 Константин Маламуж. All rights reserved.
//

import UIKit

class ThirdPieceRowCollectionLayout: UICollectionViewLayout {
    
    var cacheAttributes: [IndexPath: UICollectionViewLayoutAttributes] = [:]
    var columnCount: Int = 3
    var contentHeight: CGFloat = 0.0
    
    let padding: CGFloat = 5.0
    let spacingX: CGFloat = 5.0
    let spacingY: CGFloat = 5.0
    
    weak var delegate: CustomLayoutDelegate?
    
    override func prepare() {
        
        guard let collectionView = self.collectionView else { return }
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        guard itemsCount > 0 else { return }
        
        var lastY: CGFloat = spacingY
        var lastX: CGFloat = 0.0
        
        let totalPaddingSpace = padding * 2
        let spacingBetweenCellsCount = columnCount - 1
        let totalSpacingBetwenCells: CGFloat = CGFloat(spacingBetweenCellsCount) * spacingX
        let totalCellWidth: CGFloat = collectionView.frame.width - totalPaddingSpace - totalSpacingBetwenCells
        let cellWidth: CGFloat = totalCellWidth / CGFloat(columnCount)
        
        
    }
    
}
