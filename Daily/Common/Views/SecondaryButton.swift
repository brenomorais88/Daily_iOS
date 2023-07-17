//
//  SecondaryButton.swift
//  Gear
//
//  Created by Breno Morais on 05/06/23.
//

import UIKit

class SecondaryButton: UIButton {
        
    init(text: String) {
        super.init(frame: CGRect.zero)
        initialSetup(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup(text: String) {
        self.backgroundColor = UIColor.white
        self.titleLabel?.font = UIFont.boldTextFont
        self.setTitle(text, for: .normal)
        self.setTitleColor(.primaryColor, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
        self.layer.borderColor = UIColor.primaryColor.cgColor
        self.layer.borderWidth = 1
    }
}
