//
//  UIImageView+extension.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit

extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
