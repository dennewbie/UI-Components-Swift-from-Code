//
//  ReceiverViewController.swift
//  tutorialElementiGuiDaCodice
//
//  Created by Denny Caruso on 05/03/2019.
//  Copyright © 2019 Denny Caruso. All rights reserved.
//

import UIKit

class ReceiverViewController: UIViewController {

    var username = String()
    var password = String()
    @IBOutlet weak var lblResult: UILabel!
    
    
    override func viewDidLoad() {
        print("Username: \(username)")
        print("Password: \(password)")
        setupLabel()
    }
    
    private func setupLabel(){
        lblResult.text = "Username: \(username)\n\nPassword: \(password)"
    }
    
    //MARK: Navigation
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
