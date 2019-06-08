//
//  ReceiverViewControllerExpert.swift
//  tutorialElementiGuiDaCodice
//
//  Created by Denny Caruso on 05/03/2019.
//  Copyright © 2019 Denny Caruso. All rights reserved.
//

import UIKit

class ReceiverViewControllerExpert: UIViewController {

    var username = String()
    var password = String()
    var summaryLabel = UILabel()
    var backButton = UIButton()
    
    override func viewDidLoad() {
        print("Username: \(username)")
        print("Password: \(password)")
        setupLabel()
        setupBackButton()
    }
    
    private func setupLabel(){
        summaryLabel.frame = CGRect(x: 30, y: 50, width: self.view.frame.width - 100, height: self.view.frame.height - 100)
        summaryLabel.font = UIFont(name: "Helvetica", size: 20)
        summaryLabel.numberOfLines = 5
        
        summaryLabel.text = "Username: \(username)\n\nPassword: \(password)\n\nCongrats!"
        self.view.addSubview(summaryLabel)
    }
    
    private func setupBackButton(){
        backButton.frame = CGRect(x: self.view.center.x - 50, y: summaryLabel.frame.maxY - 150, width: 100, height: 50)
        backButton.backgroundColor = .black
        backButton.setTitleColor(.white, for: .normal)
        backButton.setTitle("Back", for: .normal)
        backButton.layer.cornerRadius = 15
        
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        self.view.addSubview(backButton)
    }
    
    //MARK: Navigation
    @objc private func goBack(){
        self.performSegue(withIdentifier: "goBack", sender: nil)
    }
}
