//
//  FirstButton.swift
//  Gear
//
//  Created by Breno Morais on 03/06/23.
//

import UIKit

class FirstButton: UIButton {
        
    init(text: String) {
        super.init(frame: CGRect.zero)
        initialSetup(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup(text: String) {
        self.backgroundColor = UIColor.primaryColor
        self.titleLabel?.font = UIFont.boldTextFont
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
    }
}

