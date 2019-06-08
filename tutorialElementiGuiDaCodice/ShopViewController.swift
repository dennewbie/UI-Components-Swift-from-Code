//
//  ShopViewController.swift
//  tutorialElementiGuiDaCodice
//
//  Created by Denny Caruso on 01/03/2019.
//  Copyright © 2019 Denny Caruso. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    
    var backgroundShop = UIImageView()
    var navBar = UIImageView()
    var eyeIconButton = UIButton()
    var shopBagIconButton = UIButton()
    var titleNavLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    
    private func setupViewController(){
        backgroundShop.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        navBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
        eyeIconButton.frame = CGRect(x: self.view.frame.maxX - 100, y: self.view.frame.minY + 125, width: 30, height: 25)
        shopBagIconButton.frame = CGRect(x: self.view.frame.maxX - 50, y: self.view.frame.minY + 125, width: 30, height: 25)
        
        titleNavLabel.frame = CGRect(x: 30, y: 85, width: 200, height: 100)
        
        backgroundShop.image = UIImage(named: "bgShop")
        navBar.image = UIImage(named: "navBar")
        navBar.contentMode = .scaleAspectFill
        eyeIconButton.setBackgroundImage(UIImage(named: "eyeIcon"), for: .normal)
        eyeIconButton.imageView!.contentMode = .scaleAspectFill
        shopBagIconButton.setBackgroundImage(UIImage(named: "shopBagIcon"), for: .normal)
        shopBagIconButton.imageView!.contentMode = .scaleAspectFill
        
        titleNavLabel.text = "Shop"
        titleNavLabel.textColor = .white
        titleNavLabel.font = UIFont.boldSystemFont(ofSize: 40.0)
        
        self.view.addSubview(backgroundShop)
        self.view.addSubview(navBar)
        self.view.addSubview(eyeIconButton)
        self.view.addSubview(shopBagIconButton)
        self.view.addSubview(titleNavLabel)
    }
}
