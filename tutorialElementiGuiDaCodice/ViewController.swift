//
//  ViewController.swift
//  tutorialElementiGuiDaCodice
//
//  Created by Denny Caruso on 01/03/2019.
//  Copyright © 2019 Denny Caruso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //tutorial iOS Youtube Variable
    var myNewLabel = UILabel()
    var myNewButton = UIButton(type: .custom)
    var myTextField = UITextField()
    var myImageView = UIImageView()
    
    var mySlider = UISlider()
    var myToogleSwitch = UISwitch()
    var myActivityIndicator = UIActivityIndicatorView()
    var myCalendar = UIDatePicker()
    var textFieldDate = UITextField()
    
    var clickedButton: Bool = false
    
    var timer = Timer()
    var subView = UIView()
    var loginButton = UIButton()
    var logoutButton = UIButton()
    var alreadyLogged = UILabel()
    var loginSuccessfully: Bool = false
    
    var titleLabel = UILabel()
    private var startActionSheet = UIButton()
    private var quoteTextField = UITextField()
    private var quoteStored = ["La vie è belle"]
    
    private var navBar = UINavigationBar()
    private var labelNavBar = UILabel()
    
    private var firstButtonSegue = UIButton()
    private var secondButtonSegue = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.myTextField.delegate = self
//        setupLabel()
//        setupButton()
//        setupTextField()
//        setupImageView()
//        setupSlider()
//        setupSwitch()
//        setupActivityIndicatorView()
//        setupDatePicker()
//        setupStartAndStop()
//        setupNavigationBar()
//        setupNavigationWithSegue()
//        playWithOptionalValue()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        setupAlertTraining()
//        behindActionSheet()
    }

    
    private func setupLabel(){
        myNewLabel.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
//        myNewLabel.text = "Hello nice World!"
        myNewLabel.text = "0"
        myNewLabel.textColor = .blue
        
        self.view.addSubview(myNewLabel)
    }
    
    private func setupButton(){
        myNewButton.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        myNewButton.center.x = self.view.center.x
        myNewButton.center.y = self.view.center.y - 50
//        myNewButton.setTitle("Let me Go", for: .normal)
        myNewButton.setTitle("Stop", for: .normal)

        myNewButton.layer.cornerRadius = 15
//        myNewButton.backgroundColor = .blue
         myNewButton.backgroundColor = .red
        myNewButton.setTitleColor(.white, for: .normal)
        myNewButton.addTarget(self, action: #selector(setupButtonAction(_:)), for: .touchUpInside)
        
        self.view.addSubview(myNewButton)
    }
    
    private func setupTextField(){
        myTextField.frame = CGRect(x: self.view.center.x - 150, y: self.view.center.y, width: 300, height: 50)
        myTextField.placeholder = "Insert your phone number..."
        myTextField.textColor = .black
        myTextField.borderStyle = .roundedRect
        myTextField.backgroundColor = .white
        myTextField.clearButtonMode = .always
        myTextField.minimumFontSize = 20
        myTextField.layer.cornerRadius = 15
        myTextField.returnKeyType = .done
        
        self.view.addSubview(myTextField)
    }
    
    @objc func setupButtonAction(_ button: UIButton) {
        
        //Changing Label Text
//        if clickedButton == false {
//            myNewLabel.text = "Goodbye cruel World!"
//            myNewButton.setTitle("Save Me", for: .normal)
//            myNewButton.backgroundColor = .red
//            myNewLabel.textColor = .red
//            clickedButton = true
//        } else {
//            myNewLabel.text = "Hello nice World!"
//            myNewButton.setTitle("Let me Go", for: .normal)
//            myNewButton.backgroundColor = .blue
//            myNewLabel.textColor = .blue
//            clickedButton = false
//        }
        
        
        //Activity Indicator
        if clickedButton == false {
            clickedButton = true
            myNewButton.setTitle("Start", for: .normal)
            myNewButton.backgroundColor = .blue
            myActivityIndicator.stopAnimating()
        } else {
            clickedButton = false
            myNewButton.setTitle("Stop", for: .normal)
            myNewButton.backgroundColor = .red
            myActivityIndicator.startAnimating()
        }
    }
    
//    private func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return false
//    }
    
    private func setupImageView(){
        myImageView.frame = CGRect(x: self.view.center.x - 100, y: self.view.center.y, width: 300, height: 200)
        myImageView.layer.cornerRadius = 15
        myImageView.layer.borderWidth = 3
        myImageView.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        myImageView.layer.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
//        myImageView.image = UIImage(named: "myImageViewAsset")
        myImageView.contentMode = .scaleAspectFit
        
        
        let urlImage = URL(string: "https://www.tpi.it/app/uploads/2019/01/uovo.png")!
        var dataImage = Data()
        do {
            dataImage = try Data (contentsOf: urlImage)
        }catch{
            print("Errore downlaod")
            let labelError = UILabel(frame: CGRect(x: 30, y: 0, width: 300, height: 100))
            labelError.text = "Error nel download dell'image"
            labelError.textColor = .white
            
            myImageView.addSubview(labelError)
        }
        myImageView.image = UIImage(data: dataImage)
        
        self.view.addSubview(myImageView)
    }
    
    private func setupSlider() {
        mySlider.frame = CGRect(x: 30, y: 300, width: self.view.frame.width - 50, height: 100)
        mySlider.addTarget(self, action: #selector(updateMyNewLabelWithSlider), for: .valueChanged)
        mySlider.minimumValue = 0
        mySlider.maximumValue = 10
        mySlider.isContinuous = true
        
        mySlider.minimumValueImage = UIImage(named: "red")
        mySlider.maximumValueImage = UIImage(named: "green")
        mySlider.minimumTrackTintColor = .red
        mySlider.maximumTrackTintColor = .green
        
        self.view.addSubview(mySlider)
    }
    
    @IBAction func updateMyNewLabelWithSlider(){
        myNewLabel.text = String(mySlider.value)
    }
    
    
    private func setupSwitch(){
        myToogleSwitch.frame = CGRect(x: self.view.center.x - 50, y: 300, width: 50, height: 50)
        myToogleSwitch.addTarget(self, action: #selector(changeImage), for: .valueChanged)
        myToogleSwitch.onTintColor = .purple
        myToogleSwitch.thumbTintColor = .green
        myToogleSwitch.tintColor = .black
        
        self.view.addSubview(myToogleSwitch)
    }
    
    @objc private func changeImage(){
        if clickedButton == false {
            clickedButton = true
            myImageView.image = UIImage(named: "green")
        } else {
            clickedButton = false
            myImageView.image = UIImage(named: "red")
        }
    }
    
    private func setupActivityIndicatorView(){
        myActivityIndicator.frame = CGRect(x: self.view.center.x - 50, y: 200, width: 100, height: 100)
        myActivityIndicator.color = .blue
        myActivityIndicator.startAnimating()
        
        self.view.addSubview(myActivityIndicator)
    }
    
    
    //How to create Delay in Swift: Dispatch Queue
    private func createDelay(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            print("Ciao ho aspettato 3 sec.")
        }
    }
    
    //How to create Delay in Swift: Timer
    private func createDelayTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            //cose da far ripeterexs
        })
        
        //funzione per invalidare
        timer.invalidate()
        
        //start timer
        createDelayTimer()
    }
    
    
    private func setupDatePicker(){
        setupCalendarDetail()
        createGestureRecognizer()
        
        textFieldDate.frame = CGRect(x: 30, y: 110, width: self.view.frame.width - 100, height: 30)
        textFieldDate.placeholder = "Choose a date from Calendar..."
        textFieldDate.resignFirstResponder()
        textFieldDate.inputView = myCalendar
        textFieldDate.borderStyle = .roundedRect
        
        //Uncomment to use calendar as view component and not as popup view compoennt. Uncomment also the addSubview instruction right at the bottom of this method.
//        myCalendar.frame = CGRect(x: 30, y: 200, width: self.view.frame.width - 100, height: 250)
        
        myCalendar.datePickerMode = .date
        myCalendar.locale = NSLocale(localeIdentifier: "it") as Locale!
        myCalendar.addTarget(self, action: #selector(changeTextFieldText), for: .valueChanged)
        
        self.view.addSubview(textFieldDate)
//        self.view.addSubview(myCalendar)
        
    }
    
    private func setupCalendarDetail(){
        var titleInsertDate = UILabel()
        titleInsertDate.frame = CGRect(x: 30, y: 70, width: self.view.frame.width, height: 30)
        titleInsertDate.text = "Date:"
        titleInsertDate.font = UIFont(name: "GillSans-Bold", size: 20)!
        
        
        let calendar = Calendar(identifier: .gregorian)
        
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        
        components.year = -1
        components.month = 12
        components.day = -1
        let maxDate = calendar.date(byAdding: components, to: currentDate)!
        
        components.year = -120
        let minDate = calendar.date(byAdding: components, to: currentDate)!
        
        myCalendar.minimumDate = minDate
        myCalendar.maximumDate = maxDate
        
        self.view.addSubview(titleInsertDate)
    }
    
    @objc private func changeTextFieldText(){
        let formattedData = DateFormatter()
        formattedData.dateFormat = "E, dd/MM/YYYY"
        formattedData.locale = NSLocale(localeIdentifier: "it") as Locale!
        textFieldDate.text = "\(formattedData.string(from: myCalendar.date))"
    }
    
    private func createGestureRecognizer(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissViewOnTapGesture(gestureRecognizer:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func dismissViewOnTapGesture(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    private func setupStartAndStop(){
        var buttonStart = UIButton()
        
        buttonStart.frame = CGRect(x: self.view.center.x - 100, y: self.view.frame.maxY - 150, width: 200, height: 100)
        buttonStart.backgroundColor = .black
        buttonStart.setTitleColor(.white, for: .normal)
        buttonStart.setTitle("Start", for: .normal)
        buttonStart.layer.cornerRadius = 15
        buttonStart.addTarget(self, action: #selector(startSubView), for: .touchUpInside)
        
        self.view.addSubview(buttonStart)
    }
    
    private func setupStartAndStopSubView(){
        subView.frame = CGRect(x: self.view.center.x - 125, y: self.view.center.y - 125, width: 250, height: 250)
        subView.backgroundColor = .blue
        subView.layer.cornerRadius = 15
        
        var buttonStop = UIButton()
        
        buttonStop.frame = CGRect(x: subView.frame.origin.x, y: 30, width: 100, height: 30)
        buttonStop.backgroundColor = .black
        buttonStop.setTitleColor(.white, for: .normal)
        buttonStop.setTitle("Stop", for: .normal)
        buttonStop.layer.cornerRadius = 15
        buttonStop.addTarget(self, action: #selector(stopSubView), for: .touchUpInside)
        
        subView.addSubview(buttonStop)
        self.view.addSubview(subView)
    }
    
    @objc private func stopSubView(){
        subView.removeFromSuperview()
    }
    
    @objc private func startSubView(){
        setupStartAndStopSubView()
    }
    
    private func setupAlertTraining(){
        if loginSuccessfully == false {
            setupBehindView()
            setupLoginAlertController()
        } else {
            setupLogged()
        }
    }
    
    private func setupBehindView(){
        loginButton.frame = CGRect(x: self.view.center.x - 50, y: self.view.frame.maxY - 150, width: 100, height: 50)
        loginButton.backgroundColor = .black
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal )
        loginButton.layer.cornerRadius = 15
        loginButton.addTarget(self, action: #selector(setupLoginAlertController), for: .touchUpInside)
        
        self.view.addSubview(loginButton)
    }
    
    private func setupLogged(){
        alreadyLogged.frame = CGRect(x: self.view.center.x - 150, y: self.view.frame.minY + 100, width: 350, height: 80)
        alreadyLogged.text = "You are already logged in.\nCongrats!"
        alreadyLogged.numberOfLines = 2
        alreadyLogged.font = UIFont(name: "GillSans-Bold", size: 20)!
        
        self.view.addSubview(alreadyLogged)
        loginButton.removeFromSuperview()
        
        logoutButton.frame = CGRect(x: self.view.center.x - 50, y: self.view.frame.maxY - 150, width: 100, height: 50)
        logoutButton.backgroundColor = .black
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.white, for: .normal )
        logoutButton.layer.cornerRadius = 15
        logoutButton.addTarget(self, action: #selector(exitFromAccount), for: .touchUpInside)
        
        self.view.addSubview(logoutButton)
    }
    
    @objc private func setupLoginAlertController(){
        let loginAlert = UIAlertController(title: "Credentials Required", message: "In order to access to this service, you have to login in our database.", preferredStyle: .alert)
        loginAlert.addAction(UIAlertAction(title: "Login", style: .default, handler: {azione in
            let username = loginAlert.textFields![0] as UITextField
            let passwordLogin = loginAlert.textFields![1] as UITextField
            
            if username.text == "Pino" && passwordLogin.text == "1" {
                self.loginSuccessfully = true
                self.setupAlertTraining()
            } else {
                let errorAlert = UIAlertController(title: "Permission Denied", message: "There is an error in the entered credentials. Try again.", preferredStyle: .alert)
                errorAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {azione in
                    self.present(loginAlert, animated: true)}))
                
                self.present(errorAlert, animated: true)
            }
        }))
        
        loginAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        loginAlert.addTextField(configurationHandler: {azione in
            azione.placeholder = "Type here username..."
        })
        
        loginAlert.addTextField(configurationHandler: {azione in
            azione.placeholder = "Type here password..."
            azione.isSecureTextEntry = true
        })
        
        self.present(loginAlert, animated: true)
    }
    
    @objc private func exitFromAccount(){
        loginSuccessfully = false
        logoutButton.removeFromSuperview()
        alreadyLogged.removeFromSuperview()
        setupAlertTraining()
    }
    
    
    private func behindActionSheet(){
        titleLabel.frame = CGRect(x: self.view.center.x - 50, y: 100, width: 100, height: 50)
        titleLabel.text = "Quote"
        titleLabel.font = UIFont(name: "GillSans-Bold", size: 20)!
        titleLabel.layer.cornerRadius = 15
        titleLabel.layer.masksToBounds = true
        titleLabel.textAlignment = .center
        
        quoteTextField.frame = CGRect(x: self.view.center.x - 150, y: self.view.center.y, width: 300, height: 50)
        quoteTextField.placeholder = "Insert your quote..."
        quoteTextField.textColor = .black
        quoteTextField.borderStyle = .roundedRect
        quoteTextField.backgroundColor = .white
        quoteTextField.clearButtonMode = .always
        quoteTextField.minimumFontSize = 20
        quoteTextField.layer.cornerRadius = 15
        quoteTextField.returnKeyType = .done
        
        
        startActionSheet.frame = CGRect(x: self.view.center.x - 50, y: self.view.frame.maxY - 150, width: 100, height: 50)
        startActionSheet.backgroundColor = .black
        startActionSheet.setTitle("Options", for: .normal)
        startActionSheet.setTitleColor(.white, for: .normal )
        startActionSheet.layer.cornerRadius = 15
        startActionSheet.addTarget(self, action: #selector(setupActionSheet), for: .touchUpInside)
        
        self.view.addSubview(quoteTextField)
        self.view.addSubview(startActionSheet)
        self.view.addSubview(titleLabel)
    }
    
    @objc private func setupActionSheet(){
        let chooseOption = UIAlertController(title: "Choose Action", message: nil, preferredStyle: .actionSheet)
        
        chooseOption.addAction(UIAlertAction(title: "Change to Red", style: .default, handler: { action in
            self.titleLabel.backgroundColor = .red
            self.titleLabel.textColor = .white
        }))
        
        chooseOption.addAction(UIAlertAction(title: "Change to Blue", style: .default, handler: { action in
            self.titleLabel.backgroundColor = .blue
            self.titleLabel.textColor = .white
        }))
        
        chooseOption.addAction(UIAlertAction(title: "Change to Default", style: .default, handler: { action in
            self.titleLabel.backgroundColor = .white
            self.titleLabel.textColor = .black
        }))
        
        chooseOption.addAction(UIAlertAction(title: "Send Data", style: .default, handler: {action in
            if self.quoteTextField.text != "" {
                var duplicateQuotes: Int = 0
                for quote in self.quoteStored {
                    if quote == self.quoteTextField.text {
                        duplicateQuotes += 1
                    }
                }
                
                if duplicateQuotes >= 1 {
                    let errorAlert = UIAlertController(title: "Quote Error", message: "Please you already sent this quote before.", preferredStyle: .alert)
                    errorAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(errorAlert, animated: true)
                } else {
                    let successAlert = UIAlertController(title: "Success", message: "Quote sent successfully! Congrats.", preferredStyle: .alert)
                    successAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.quoteStored.append(self.quoteTextField.text!)
                    self.present(successAlert, animated: true)
                }
            } else {
                let errorAlert = UIAlertController(title: "Quote Error", message: "Please send a valid quote.", preferredStyle: .alert)
                errorAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(errorAlert, animated: true)
            }
        }))
        
        chooseOption.addAction(UIAlertAction(title: "Annulla", style: .cancel, handler: nil))
        
        
        self.present(chooseOption, animated: true)
    }
    
    private func setupNavigationBar(){
        navBar.frame = CGRect(x: 0, y: self.view.frame.origin.y + 50, width: self.view.frame.width, height: 100)
        
        var item = UINavigationItem()
        item.title = "New Nav Bar"
        item.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addNavBarButton))
        item.rightBarButtonItem?.tintColor = .green
        item.leftBarButtonItem = UIBarButtonItem(title: "Remove", style: .plain, target: self, action: #selector(removeNavBarButton))
        item.leftBarButtonItem?.tintColor = .red
        navBar.items = [item]
        navBar.isTranslucent = false
        
        labelNavBar.frame = CGRect(x: self.view.center.x - 100, y: self.view.center.y, width: 200, height: 100)
        labelNavBar.text = "Touch a Nav Bar Button"
        
        self.view.addSubview(labelNavBar)
        self.view.addSubview(navBar)
    }
    
    @objc private func addNavBarButton(){
        self.view.backgroundColor = .green
    }
    
    @objc private func removeNavBarButton(){
        self.view.backgroundColor = .red
    }
    
    private func setupNavigationWithSegue(){
        setupButtonSegue()
    }
    
    private func setupButtonSegue(){
        self.view.backgroundColor = .green
        
        firstButtonSegue.frame = CGRect(x: self.view.center.x - 150, y: self.view.frame.maxY - 250, width: 300, height: 50)
        firstButtonSegue.backgroundColor = .black
        firstButtonSegue.setTitle("Apri Secondo", for: .normal)
        firstButtonSegue.setTitleColor(.white, for: .normal )
        firstButtonSegue.layer.cornerRadius = 15
        firstButtonSegue.addTarget(self, action: #selector(setupTarget), for: .touchUpInside)
        
        secondButtonSegue.frame = CGRect(x: self.view.center.x - 150, y: self.view.frame.maxY - 350, width: 300, height: 50)
        secondButtonSegue.backgroundColor = .black
        secondButtonSegue.setTitle("Apri Terzo", for: .normal)
        secondButtonSegue.setTitleColor(.white, for: .normal )
        secondButtonSegue.layer.cornerRadius = 15
        secondButtonSegue.addTarget(self, action: #selector(setupTargetSecond), for: .touchUpInside)
        
        self.view.addSubview(firstButtonSegue)
        self.view.addSubview(secondButtonSegue)
    }
    
    @objc private func setupTarget(){
        //con storyboard
        
//        let segueDaCodice = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondoVC")
//        self.present(segueDaCodice, animated: true, completion: nil)
        
        
        
        //da codice
//        let second = SecondoViewController()
//        self.present(second, animated: true, completion: nil)
        
        
        //con performSegue
        self.performSegue(withIdentifier: "first2Second", sender: nil)
    }
    
    @objc private func setupTargetSecond(){
        self.performSegue(withIdentifier: "first2Third", sender: nil)
    }
    
    @IBAction func goBackUnwind(sender: UIStoryboardSegue){
        print("\nSegue Intercepted:")
        print(sender.identifier!)
    }
    
    private func playWithOptionalValue(){
        
//        classicOptionalBlindingWithLet()
//        classicOptionalBlindingWithNIL()
        optionalUnwrappingWithGuardStatement()
    }
    
    private func classicOptionalBlindingWithLet(){
        var number: Int?
        //        number = 30
        if let tempNumber = number {
            print(number!)
        } else {
            print("Please insert a number, first.\nmethod: classicOptionalBlindingWithLet()")
        }
    }
    
    private func classicOptionalBlindingWithNIL(){
        var number: Int?
        //        number = 30
        if number != nil {
            print(number!)
        } else {
            print("Please insert a number, first.\nmethod: classicOptionalBlindingWithNIL()")
        }
    }
    
    private func optionalUnwrappingWithGuardStatement(){
        //        most elegant. hmmmm... classy :P
        var number: Int?
        //        number = 30
        
        
        //Modi di scrivere il guard let
//        1. con una costante d'appoggio temporanea
//        guard let tempNumber = number else {
//            print("Please insert a number, first.\nmethod: optionalUnwrappingWithGuardStatement()")
//            return
//        }
        
        
        
//        2. col nil
//        guard number != nil else {
//            print("Please insert a number, first.\nmethod: optionalUnwrappingWithGuardStatement()")
//            return
//        }
        
        
//        3. forma abbreviata
//        guard let tempNumber = number else { print("Found nil value."); return }
//        guard number != nil else { print("Found nil value."); return }
        
        
//        4. con funzione interna
        guard let tempNumber = number else { takeMeSomewhere(); print("No value"); return }
        print(number!)
    }
    
    private func takeMeSomewhere(){
        print("You are here, bc you are nil. Shitty Man.")
    }
    
    //Appunti Navigation Bar
    
//    Si possono aggiungere elementi bar button item left e right da storyboard solo alla main nav bar ovvero
//    il view controller primo appena dopo il nav controller blanck
//    e.g.
//    nav controller -> main view controller -> other view controller
//    
//    nel main view vanno aggiunti da storyboard, nei successivi non possono essere aggiunti se non da codice attraverso il navigation.right bar button item add(action), dove action è di tipo UIBarButtonItem(...).
//    Per aggiungerla si fa navigationItem.rightBarButtonItem, per left va 'left', per title .title e così via.
//    
//    Se hai tanti view controller embeddati e non vuoi far perdere tempo all'utente per farlo tornare al madre, basta che fai navigationController.popUpToRootViewController(...), mentre se ne devi poppare solo uno fai il classcio popViewController(...)
    
}

