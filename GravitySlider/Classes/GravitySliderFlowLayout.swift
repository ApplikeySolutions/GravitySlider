//
//  GravitySliderFlowLayout.swift
//  GravitySliderExample
//
//  Created by Artem Tevosyan on 9/27/17.
//  Copyright © 2017 Artem Tevosyan. All rights reserved.
//

import Foundation
import UIKit

open class GravitySliderFlowLayout: UICollectionViewFlowLayout {
    
    let lineSpacingArgument: CGFloat = -2.5
    private var lastCollectionViewSize: CGSize = CGSize.zero
    
    public init(with itemSize: CGSize) {
        super.init()
        self.scrollDirection = .horizontal
        self.itemSize = itemSize
        self.minimumLineSpacing = itemSize.width / lineSpacingArgument
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(for scrollDirection: UICollectionViewScrollDirection, with collectionViewSize: CGSize) {
        guard collectionViewSize != lastCollectionViewSize else { return }
        self.lastCollectionViewSize = collectionViewSize
        self.scrollDirection = scrollDirection
        switch scrollDirection {
        case .horizontal: sectionInset = UIEdgeInsets(top: 0.0, left: collectionViewSize.width / 2 - itemSize.width / 2, bottom: 0.0, right: collectionViewSize.width / 2 - itemSize.width / 2)
        case .vertical: break
        }
    }
    
    override open func prepare() {
        super.prepare()
        guard let collectionView = self.collectionView else { return }
        self.setup(for: self.scrollDirection, with: collectionView.bounds.size)
    }
    
    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var targetRect = CGRect()
        switch scrollDirection {
        case .horizontal:
            targetRect.origin = CGPoint(x: rect.origin.x - rect.width / 2, y: rect.origin.y)
            targetRect.size = CGSize(width: rect.width * 2, height: rect.height)
            guard let collectionView = collectionView, let attributes = super.layoutAttributesForElements(in: targetRect) else { return nil }
            for attribute in attributes {
                let cellX = collectionView.convert(attribute.center, to: collectionView.superview).x
                let difference = collectionView.center.x - cellX
                let differenceFunction = -pow(abs(difference)/collectionView.frame.size.width, 2.0) + 1.0
                attribute.alpha = differenceFunction
                var transform = CATransform3DIdentity
                let secondDifferenceFunction = -pow((difference / 1.8)/collectionView.frame.size.width * 2.0, 2.0) + 1.0
                let functionAbscissa = (difference/(itemSize.width * 0.135) + CGFloat.pi)
                transform = CATransform3DTranslate(transform, sin(functionAbscissa)*itemSize.width*0.35, 0.0, 0.0)
                transform = CATransform3DScale(transform, secondDifferenceFunction, secondDifferenceFunction, 1.0)
                let isInsideFunctionAbscissaInterval = functionAbscissa >= -CGFloat.pi*0.7 && functionAbscissa <= 2.7*CGFloat.pi
                attribute.alpha = isInsideFunctionAbscissaInterval ? 1.0 : 0.0
                attribute.zIndex = Int(differenceFunction * 1000)
                attribute.transform3D = transform
            }
            return attributes
        case .vertical:
            return nil
        }
    }
    
    override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override open func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                           withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return CGPoint.zero}
        let latestOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        switch scrollDirection {
        case .horizontal:
            let difference = collectionView.frame.size.width / 2 - sectionInset.left - itemSize.width/2
            let inset = collectionView.contentInset.left
            let row: CGFloat = ((latestOffset.x - inset + difference) / (itemSize.width + minimumLineSpacing)).rounded()
            let calculatedOffset = row * itemSize.width + row * minimumLineSpacing + inset
            let targetOffset = CGPoint(x: ((row == 0 && proposedContentOffset.x < (calculatedOffset - difference)) || ((Int(row) ==
                collectionView.numberOfItems(inSection: 0) - 1) && proposedContentOffset.x > (calculatedOffset - difference) )) ?
                    proposedContentOffset.x : calculatedOffset - difference, y: latestOffset.y)
            return targetOffset
        case .vertical:
            return CGPoint.zero
        }
    }
}

