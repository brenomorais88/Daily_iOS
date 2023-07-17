//
//  UIFont+extension.swift
//  Gear
//
//  Created by Breno Morais on 31/05/23.
//

import UIKit

extension UIFont {
    private static var titleSize: CGFloat {
        return 22
    }
    
    private static var mediumTextSize: CGFloat {
        return 19
    }
    
    private static var normalTextSize: CGFloat {
        return 16
    }
    
    private static var smallTextSize: CGFloat {
        return 12
    }
    
    static var boldTitleFont: UIFont {
        return UIFont.boldSystemFont(ofSize: titleSize)
    }
    
    static var normalTitleFont: UIFont {
        return UIFont.systemFont(ofSize: titleSize)
    }
    
    static var boldTextFont: UIFont {
        return UIFont.boldSystemFont(ofSize: normalTextSize)
    }
    
    static var normalTextFont: UIFont {
        return UIFont.systemFont(ofSize: normalTextSize)
    }
    
    static var boldMediumTextFont: UIFont {
        return UIFont.boldSystemFont(ofSize: mediumTextSize)
    }
    
    static var normalMediumTextFont: UIFont {
        return UIFont.systemFont(ofSize: mediumTextSize)
    }
    
    static var boldLittleTextFont: UIFont {
        return UIFont.boldSystemFont(ofSize: smallTextSize)
    }
    
    static var normalLittleTextFont: UIFont {
        return UIFont.systemFont(ofSize: smallTextSize)
    }
}
