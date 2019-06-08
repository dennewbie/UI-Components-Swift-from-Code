//
//  PassingDataViewController.swift
//  tutorialElementiGuiDaCodice
//
//  Created by Denny Caruso on 05/03/2019.
//  Copyright © 2019 Denny Caruso. All rights reserved.
//

import UIKit

class PassingDataViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func indirectButton(_ sender: UIButton) {
        if checkTextField() == true {
            self.performSegue(withIdentifier: "indirectSegue", sender: sender)
        }
    }
    
    //    MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier != nil else { print("There's no segue"); return }
        
        let receiverVC = segue.destination as! ReceiverViewController
        receiverVC.username = usernameTextField.text!
        receiverVC.password = passwordTextField.text!
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (usernameTextField.text == nil || passwordTextField.text == nil || usernameTextField.text == "" || passwordTextField.text == "") {
            print("Blocco attivato")
            return false
        }
        return true
    }
    
    private func checkTextField() -> Bool {
        if (usernameTextField.text == nil || passwordTextField.text == nil || usernameTextField.text == "" || passwordTextField.text == "") {
            print("Blocco attivato")
            return false
        }
        return true
    }
}
