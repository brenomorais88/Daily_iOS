//
//  UIColors.swift
//  Gear
//
//  Created by Breno Morais on 30/05/23.
//

import Foundation
import UIKit

extension UIColor {
    //MARK: Cores
    
    static var primaryColor: UIColor {
        return UIColor.colorFromHex("#6684D4")
    }
    
    static var primaryContrastColor: UIColor {
        return primaryColor.withAlphaComponent(0.2)
    }
    
    static var appViewsBackground: UIColor {
        return UIColor.colorFromHex("#E6E3E3")
    }
    
    static var borderGray: UIColor {
        return UIColor.black
    }
    

    // MARK: text colors
    
    static var normalLightTextColor: UIColor {
        return UIColor.white
    }
    
    static var grayTextColor: UIColor {
        return UIColor.colorFromHex("#838383")
    }    
    
    //MARK: Util
    
    static func colorFromHex(_ hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
