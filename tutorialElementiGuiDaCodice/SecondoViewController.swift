//
//  SecondoViewController.swift
//  tutorialElementiGuiDaCodice
//
//  Created by Denny Caruso on 05/03/2019.
//  Copyright © 2019 Denny Caruso. All rights reserved.
//

import UIKit

class SecondoViewController: UIViewController {

    private var secondButtonSegue = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonSegue()
    }
    
    private func setupButtonSegue(){
        self.view.backgroundColor = .yellow
        
        secondButtonSegue.frame = CGRect(x: self.view.center.x - 150, y: self.view.frame.maxY - 250, width: 300, height: 50)
        secondButtonSegue.backgroundColor = .black
        secondButtonSegue.setTitle("Dismiss Secondo", for: .normal)
        secondButtonSegue.setTitleColor(.white, for: .normal )
        secondButtonSegue.layer.cornerRadius = 15
        secondButtonSegue.addTarget(self, action: #selector(setupTarget), for: .touchUpInside)
        
        self.view.addSubview(secondButtonSegue)
    }
    
    @objc private func setupTarget(){
//        easy way
        //        self.dismiss(animated: true, completion: nil)
        
        //        unwind custom segue
        self.performSegue(withIdentifier: "second2First", sender: nil)
    }
}
