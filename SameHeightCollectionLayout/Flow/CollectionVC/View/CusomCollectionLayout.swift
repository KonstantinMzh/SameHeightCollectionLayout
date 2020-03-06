//
//  CusomCollectionLayout.swift
//  SameHeightCollectionLayout
//
//  Created by Константин Маламуж on 04.03.2020.
//  Copyright © 2020 Константин Маламуж. All rights reserved.
//

import UIKit

protocol CustomLayoutDelegate: AnyObject {
    
    func collectionView(_ collectionView: UICollectionView, indexPath: IndexPath) -> CGFloat
    
}

class CustomCollectionLayout: UICollectionViewLayout {
    
    var cacheAttributes: [IndexPath : UICollectionViewLayoutAttributes] = [:]
    var columnCount: Int = 2
    var contentHeight: CGFloat = 0.0
    
    weak var delegate: CustomLayoutDelegate?
    
    var currentColumnIndex: Int = 0

    
    override func prepare() {
    
        guard let collectionView = self.collectionView else { return }
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        guard itemsCount > 0 else { return }
        
        
        var lastY: CGFloat = 0.0
        var lastX: CGFloat = 0.0
        
        let padding: CGFloat = 5.0
        let spacingX: CGFloat = 5.0
        let spacingY: CGFloat = 5.0
        
        
        var columnHeight1: CGFloat = 0.0
        var columnHeight2: CGFloat = 0.0
        
        var resultHeight: CGFloat = 0.0
    }
        
        
//        let cellWidth: CGFloat = (collectionView.frame.width / CGFloat(self.columnCount)) - padding - (spacingX/CGFloat(self.columnCount))
        
//        for index in 0 ..< itemsCount {
//
//            print(index)
//
//            let indexPath = IndexPath(item: index, section: 0)
//            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
//
//            let height = delegate?.collectionView(collectionView, indexPath: indexPath) ?? 200
//
//            let rowHeight: CGFloat = 0.0
//
//            switch currentColumn {
//            case 1:
//                lastX = padding
//                columnHeight1 = height
//            case 2:
//                lastX = padding + cellWidth + spacingX
//                columnHeight2 = height
//                print("🍓 \(index)")
//
//            default:
//                return
//            }
//
//            if columnHeight1 > columnHeight2 {
//                resultHeight = columnHeight1
//            } else {
//                resultHeight = columnHeight2
//            }
//
//            attributes.frame = CGRect(x: lastX, y: lastY, width: cellWidth, height: resultHeight)
//
//            switch currentColumn {
//            case 1:
//                currentColumn += 1
//
//            case 2:
//
//                lastY += resultHeight + spacingY
//                currentColumn = 1
//
//            default:
//                return
//            }
//
            
            
            
//            if columnHeight1 > columnHeight2 {
//                let previousAttributes = cacheAttributes[IndexPath(row: index - 1, section: 0)]
//
//                let originX = previousAttributes?.frame.origin.x ?? 0.0
//                let originY = previousAttributes?.frame.origin.y ?? 0.0
//                let width = previousAttributes?.frame.width ?? 0.0
//
//                attributes.frame = CGRect(x: originX, y: originY, width: width, height: columnHeight1)
//
//            } else {
//                resultHeight = columnHeight2
//            }
//
//
//            cacheAttributes[indexPath] = attributes
//            self.contentHeight = lastY
//
//
//
//        }
//    }
    
    
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        return cacheAttributes.values.filter { attributes in
//            return rect.intersects(attributes.frame)
//        }
//    }
//
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        return cacheAttributes[indexPath]
//    }
//
//    override var collectionViewContentSize: CGSize {
//        return CGSize(width: self.collectionView?.frame.width ?? 0, height: self.contentHeight)
//    }
    
}
