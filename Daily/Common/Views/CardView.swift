//
//  CardView.swift
//  Daily
//
//  Created by Breno Morais on 19/06/23.
//

import UIKit

class CardView: UIView {
    private let icon: String
    private let text: String
    
    private let iconImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let descLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.grayTextColor
        label.font = UIFont.boldLittleTextFont
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    private let iconContentView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor.primaryContrastColor
        return view
    }()
    
    init(icon: String, text: String) {
        self.icon = icon
        self.text = text
        super.init(frame: CGRect.zero)
        self.setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.viewCodeSetup()
        self.descLabel.text = self.text
        self.iconImage.image = UIImage(named: self.icon) ?? UIImage()
    }
}

extension CardView: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.addSubview(iconContentView)
        self.iconContentView.addSubview(iconImage)
        self.addSubview(descLabel)
    }
    
    func viewCodeConstraintSetup() {
        iconContentView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(40)
            make.left.top.equalToSuperview().inset(10)
        }
        
        iconImage.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(20)
            make.centerX.centerY.equalToSuperview()
        }
        descLabel.snp.makeConstraints { (make) -> Void in
            make.right.bottom.equalToSuperview().inset(10)
        }
    }
}

