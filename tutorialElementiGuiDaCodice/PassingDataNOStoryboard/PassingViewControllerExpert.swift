//
//  PassingViewControllerExpert.swift
//  tutorialElementiGuiDaCodice
//
//  Created by Denny Caruso on 05/03/2019.
//  Copyright © 2019 Denny Caruso. All rights reserved.
//

import UIKit

class PassingViewControllerExpert: UIViewController {
    
    private var usernameLabel = UILabel()
    private var usernameTextField = UITextField()
    private var passwordLabel = UILabel()
    private var passwordTextField = UITextField()
    private var parentSummaryLabel = UILabel()
    
    private var sendDirect = UIButton()
    private var sendIndirect = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout(){
        usernameLabel.frame = CGRect(x: 30, y: 50, width: self.view.frame.width - 100, height: 30)
        usernameLabel.text = "Username"
        
        usernameTextField.frame = CGRect(x: 30, y: 100, width: self.view.frame.width - 100, height: 30)
        usernameTextField.placeholder = "Insert your username..."
        usernameTextField.borderStyle = .roundedRect
        
        passwordLabel.frame = CGRect(x: 30, y: 150, width: self.view.frame.width - 100, height: 30)
        passwordLabel.text = "Password"
        
        passwordTextField.frame = CGRect(x: 30, y: 200, width: self.view.frame.width - 100, height: 30)
        passwordTextField.placeholder = "Insert your password..."
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        
        sendDirect.frame = CGRect(x: 30, y: 300, width: self.view.frame.width - 100, height: 50)
        sendDirect.setTitle("Send Directly", for: .normal)
        sendDirect.backgroundColor = .black
        sendDirect.addTarget(self, action: #selector(goOnDirecty), for: .touchUpInside)
        sendDirect.layer.cornerRadius = 15
        
        sendIndirect.frame = CGRect(x: 30, y: 400, width: self.view.frame.width - 100, height: 50)
        sendIndirect.setTitle("Send Indirectly", for: .normal)
        sendIndirect.backgroundColor = .black
        sendIndirect.addTarget(self, action: #selector(goOnIndirecty), for: .touchUpInside)
        sendIndirect.layer.cornerRadius = 15
        
        self.view.addSubview(usernameLabel)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(sendIndirect)
        self.view.addSubview(sendDirect)
        
        
        parentSummaryLabel.frame = CGRect(x: 30, y: 500, width: self.view.frame.width - 100, height: 250)
        parentSummaryLabel.backgroundColor = .black
        parentSummaryLabel.textColor = .white
        parentSummaryLabel.layer.cornerRadius = 15
        parentSummaryLabel.numberOfLines = 5
        parentSummaryLabel.textAlignment = .center
        
        self.view.addSubview(parentSummaryLabel)
    }
    
     // MARK: - Navigation
    @objc private func goOnDirecty(){
        if checkTextField() == true {
            self.performSegue(withIdentifier: "directSegue", sender: nil)
        }

    }
    
    @objc private func goOnIndirecty(){
//        if checkTextField() == true {
//            let segueDaCodice = UIStoryboard(name: "PassingDataBetweenVCExpert", bundle: nil).instantiateViewController(withIdentifier: "ReceiverController")
//            self.present(segueDaCodice, animated: true, completion: nil)
//
//
//        }
    }
    
    
//    @IBAction func indirectButton(_ sender: UIButton) {
//        if checkTextField() == true {
//            self.performSegue(withIdentifier: "indirectSegue", sender: sender)
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier != nil else { print("There's no segue"); return }
        
        let receiverVC = segue.destination as! ReceiverViewControllerExpert
        receiverVC.username = usernameTextField.text!
        receiverVC.password = passwordTextField.text!
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if (usernameTextField.text == nil || passwordTextField.text == nil || usernameTextField.text == "" || passwordTextField.text == "") {
//            print("Blocco attivato")
//            return false
//        }
//        return true
//    }

    private func checkTextField() -> Bool {
        if (usernameTextField.text == nil || passwordTextField.text == nil || usernameTextField.text == "" || passwordTextField.text == "") {
            print("Blocco attivato")
            return false
        }
        return true
    }
    
    @IBAction func unwindFromDetailLogin(segue: UIStoryboardSegue){
        guard let tempID = segue.identifier else { print("There's no segue."); return }
        
        if segue.identifier == "goBack" {
            let sourceVC = segue.source as! ReceiverViewControllerExpert
            print(sourceVC.username)
            parentSummaryLabel.text = sourceVC.summaryLabel.text
        }
    }
}
