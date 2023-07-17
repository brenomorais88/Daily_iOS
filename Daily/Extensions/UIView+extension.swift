//
//  UIView+extension.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit

extension UIView {

//  // OUTPUT 1
//  func dropShadow(scale: Bool = true) {
//    layer.masksToBounds = false
//    layer.shadowColor = UIColor.black.cgColor
//    layer.shadowOpacity = 0.5
//    layer.shadowOffset = CGSize(width: -1, height: 1)
//    layer.shadowRadius = 1
//
//    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//    layer.shouldRasterize = true
//    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
//  }

  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
