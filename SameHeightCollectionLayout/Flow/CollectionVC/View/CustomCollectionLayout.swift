//
//  NewCollectionLayout.swift
//  SameHeightCollectionLayout
//
//  Created by Константин Маламуж on 05.03.2020.
//  Copyright © 2020 Константин Маламуж. All rights reserved.
//

import UIKit

protocol CustomLayoutDelegate: AnyObject {
    
    func collectionView(_ collectionView: UICollectionView, indexPath: IndexPath) -> CGFloat
    
}

class CustomCollectionLayout: UICollectionViewLayout {
    
    var cacheAttributes: [IndexPath: UICollectionViewLayoutAttributes] = [:]
    var columnCount: Int = 2
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
                
        let cellWidth: CGFloat = (collectionView.frame.width / CGFloat(self.columnCount)) - padding - (spacingX/CGFloat(self.columnCount))
        

        
                                                                      
        func prepareTwoPieceRow(index: Int) {
            var resultHeight: CGFloat = 0.0
            
            let indexPath1 = IndexPath(row: index, section: 0)
            let indexPath2 = IndexPath(row: index+1, section: 0)

            let attribute1 = UICollectionViewLayoutAttributes(forCellWith: indexPath1)
            let attribute2 = UICollectionViewLayoutAttributes(forCellWith: indexPath2)
            
            let height1 = delegate?.collectionView(collectionView, indexPath: indexPath1) ?? 200
            let height2 = delegate?.collectionView(collectionView, indexPath: indexPath2) ?? 200

            if height1 > height2 {
                resultHeight = height1
            } else {
                resultHeight = height2
            }
            
            var currentColumn: Int = 1

            
            for _ in 1 ... columnCount {
                switch currentColumn {
                case 1:
                    currentColumn += 1
                    lastX = padding
                    
                    print("1 COL \(indexPath1.row) - x: \(lastX), y: \(lastY), w: \(cellWidth), h: \(resultHeight)")

                    attribute1.frame = CGRect(x: lastX, y: lastY, width: cellWidth, height: resultHeight)

                case 2:

                    currentColumn = 1
                    lastX = padding + cellWidth + spacingX
                    
                    print("2 COL \(indexPath2.row) - x: \(lastX), y: \(lastY), w: \(cellWidth), h: \(resultHeight)")

                    
                    attribute2.frame = CGRect(x: lastX, y: lastY, width: cellWidth, height: resultHeight)

                    
                default:
                    return
                }
            }
            
            

            lastY += resultHeight + spacingY
            
            cacheAttributes[indexPath1] = attribute1
            cacheAttributes[indexPath2] = attribute2
            
            self.contentHeight = lastY
        }
        
        func prepareOnePieceRow(index: Int) {
            let indexPath = IndexPath(row: index, section: 0)
            let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            let height = delegate?.collectionView(collectionView, indexPath: indexPath) ?? 200
            
            attribute.frame = CGRect(x: padding, y: lastY, width: cellWidth, height: height)
            
            lastY += height + spacingY
            
            cacheAttributes[indexPath] = attribute
            
            self.contentHeight = lastY
        }
        
        for index in stride(from: 0, to: itemsCount, by: columnCount) {
            
            if index+1 == itemsCount {
                prepareOnePieceRow(index: index)
                break
            }
            
            prepareTwoPieceRow(index: index)
            print("\(index+1)/\(itemsCount)")
        }
        
        if itemsCount%columnCount != 0 {
            
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
