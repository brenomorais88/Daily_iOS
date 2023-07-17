//
//  HomeDailieCell.swift
//  Daily
//
//  Created by Breno Morais on 19/06/23.
//

import UIKit

class HomeDailieCell: UITableViewCell {
    static let cellID = "HomeDailieCell"
    
    private let cellContent: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        view.backgroundColor = .white
        return view
    }()
    
    private let checkboxImg: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let descLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.grayTextColor
        label.font = UIFont.boldTextFont
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = UIColor.grayTextColor
        label.font = UIFont.normalTextFont
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "FilterCell")
        self.initialSetup()
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            checkboxImg.image = UIImage(named: "icon_checkbox_selecionado")
        } else {
            checkboxImg.image = UIImage(named: "icon_checkbox")
        }
    }
    
    private func initialSetup() {
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
    }
    
    func setup() {
        self.viewCodeSetup()
        self.contentView.backgroundColor = UIColor.clear
        descLabel.text = "beber agua"
        timeLabel.text = "14:00"
        checkboxImg.image = UIImage(named: "icon_checkbox")
    }
}

extension HomeDailieCell: ViewCodeProtocol {
    func viewCodeHierarchySetup() {
        self.addSubview(cellContent)
        self.cellContent.addSubview(checkboxImg)
        self.cellContent.addSubview(descLabel)
        self.cellContent.addSubview(timeLabel)
    }
    
    func viewCodeConstraintSetup() {
        cellContent.snp.makeConstraints { (make) -> Void in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.top.equalToSuperview().inset(4)
        }
        
        checkboxImg.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
            make.left.equalToSuperview().inset(16)
        }
        
        descLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.left.equalTo(checkboxImg.snp.right).inset(-16)
            make.right.equalTo(timeLabel.snp.left).inset(-16)
        }
        
        timeLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.width.equalTo(60)
            make.right.equalToSuperview().inset(16)
        }
    }
}
