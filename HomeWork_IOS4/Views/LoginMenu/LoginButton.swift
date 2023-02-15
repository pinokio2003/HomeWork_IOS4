//
//  LoginButton.swift
//  HomeWork_IOS4
//
//  Created by Anatolii Kravchuk on 12.02.2023.
//

import UIKit

class LoginButton: UIButton{
     
    var buttonStile = UIButton()
    static var multiCornerRadius: CGFloat = 60
    
    //MARK: - dark shadow
        let darkShadow: CALayer = {
            let darkShadow = CALayer()
            darkShadow.needsDisplayOnBoundsChange = true
            darkShadow.shadowColor = UIColor.black.cgColor
            darkShadow.shadowOffset = CGSize(width: 10, height: 10)
            darkShadow.shadowRadius = 10
            darkShadow.shadowOpacity = 0.15
            darkShadow.cornerRadius = 10
            darkShadow.backgroundColor = UIColor.customBackgroundColor.cgColor
            return darkShadow
        }()
       
    //MARK: - light shadow
        let lightShadow: CALayer = {
            let lightShadow = CALayer()
            lightShadow.needsDisplayOnBoundsChange = true
            lightShadow.shadowColor = UIColor.white.cgColor
            lightShadow.shadowOffset = CGSize(width: -7, height: -7)
            lightShadow.shadowRadius = 10
            lightShadow.shadowOpacity = 0.5
            lightShadow.cornerRadius = 10
            lightShadow.backgroundColor = UIColor.customBackgroundColor.cgColor
            return lightShadow
        }()
  
    //MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBtn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupBtn(){
        addSubview(buttonStile)
        let multiCornerRadius = LoginButton.multiCornerRadius

        buttonStile.setTitle("Start", for: .normal)
        buttonStile.backgroundColor = .customBackgroundColor
        buttonStile.frame = self.bounds
        buttonStile.layer.cornerRadius = multiCornerRadius
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        buttonStile.layer.insertSublayer(darkShadow, at: 0)
        buttonStile.layer.insertSublayer(lightShadow, at: 0)
        darkShadow.cornerRadius = multiCornerRadius
        lightShadow.cornerRadius = multiCornerRadius
    }
    
    
    //MARK: - layout subview
    override func layoutSubviews() {
        super.layoutSubviews()
        darkShadow.frame = self.bounds
        lightShadow.frame = self.bounds
    }
  
}
