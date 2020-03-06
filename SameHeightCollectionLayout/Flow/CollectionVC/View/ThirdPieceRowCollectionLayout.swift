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
        
        func prepareThirdPieceRow(index: Int, columnInRow: Int) {
            
            var resultHeight: CGFloat = 0.0

            var indexPaths: [IndexPath] = []
            var elementsHeight: [CGFloat] = []
            var attributes: [UICollectionViewLayoutAttributes] = []
            
            for index in index..<index+columnInRow {
                
                
                let indexPath = IndexPath(row: index, section: 0)
                
                indexPaths.append(indexPath)
                elementsHeight.append(delegate?.collectionView(collectionView, indexPath: indexPath) ?? 200)
                attributes.append(UICollectionViewLayoutAttributes(forCellWith: indexPath))
                
                resultHeight = elementsHeight.max() ?? 200
                
            }
                        
            for columnIndex in 0 ... columnInRow-1 {
                
                
                var columnOriginX: CGFloat {
                    if columnIndex == 0 {
                        return padding
                    } else {
                        return (padding + (CGFloat(columnIndex) * cellWidth) + (CGFloat(columnIndex) * spacingX))
                    }
                }
                
                lastX = columnOriginX
                
                attributes[columnIndex].frame = CGRect(x: lastX, y: lastY, width: cellWidth, height: resultHeight)
                
            }
            
            for index in 0...attributes.count - 1 {
                cacheAttributes[attributes[index].indexPath] = attributes[index]
            }
            
            lastY += resultHeight + spacingY
            self.contentHeight = lastY
            
        }
        
        let remainingColumns: Int = itemsCount - ((itemsCount/columnCount) * columnCount)
        
        
        for index in stride(from: 0, through: itemsCount - remainingColumns, by: columnCount) {
            
//            print(index)
            
            if index == itemsCount - remainingColumns {
                break
            }
            
            prepareThirdPieceRow(index: index, columnInRow: columnCount)
        }
        
        print(itemsCount - remainingColumns - 1)
        

        if remainingColumns > 0 {
            prepareThirdPieceRow(index: itemsCount - remainingColumns, columnInRow: remainingColumns)
        }
        
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.values.filter { attributes in
            return rect.intersects(attributes.frame)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath]
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: self.collectionView?.frame.width ?? 0, height: self.contentHeight)
    }
    
}
