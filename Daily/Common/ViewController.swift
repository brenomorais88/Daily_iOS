//
//  ViewController.swift
//  Daily
//
//  Created by Breno Morais on 19/06/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appViewsBackground
        return view
    }()
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.primaryColor
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    let backImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "icon_back_btn_white")
        return view
    }()
    
    let userImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.image = UIImage(named: "user_placeholder")
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.normalLightTextColor
        label.font = UIFont.boldTitleFont
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupContentView()
        self.navSetup()
    }
    
    func setupContentView() {
        self.view.backgroundColor = UIColor.appViewsBackground
        self.view.addSubview(contentView)
        
        contentView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    func setupCommonHeader(title: String, showBackButton: Bool = true) {
        self.contentView.addSubview(headerView)
        self.contentView.addSubview(userImage)
        self.contentView.addSubview(titleLabel)
        
        headerView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        userImage.snp.makeConstraints { (make) -> Void in
            make.right.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(64)
            make.height.width.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(24)
            make.top.equalTo(userImage.snp.bottom).inset(-10)
        }
        
        self.titleLabel.text = title
        
        if showBackButton {
            self.contentView.addSubview(backView)
            self.backView.addSubview(backImage)
            
            backView.snp.makeConstraints { (make) -> Void in
                make.left.equalToSuperview().inset(24)
                make.top.equalToSuperview().inset(64)
                make.height.width.equalTo(40)
            }
            
            backImage.snp.makeConstraints { (make) -> Void in
                make.left.equalToSuperview()
                make.centerY.equalToSuperview().inset(-4)
                make.height.width.equalTo(24)
            }
            
            let backViewTap = UITapGestureRecognizer(target: self, action:  #selector(back))
            backView.addGestureRecognizer(backViewTap)
        }
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func navSetup() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold),
                              NSAttributedString.Key.foregroundColor: UIColor.purple]
        
        navBarAppearance.titleTextAttributes = titleAttribute

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = navBarAppearance
    }
}


