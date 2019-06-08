//
//  WebViewController.swift
//  tutorialElementiGuiDaCodice
//
//  Created by Denny Caruso on 05/03/2019.
//  Copyright © 2019 Denny Caruso. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var myWebView: WKWebView!
    private var activityIndicator = UIActivityIndicatorView()
    //    private var myWebView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupURL()
        setupActivityIndicator()
    }
    
    override func loadView() {
        setupWebNavigation()
    }
    
    private func setupWebNavigation(){
        let myWebCofiguration = WKWebViewConfiguration()
        myWebView = WKWebView(frame: .zero, configuration: myWebCofiguration)
        myWebView.navigationDelegate = self
        view = myWebView
    }
    
    private func setupURL(){
        let myURL = URL(string: "https://www.apple.com/it/")
        let myURLRequest = URLRequest(url: myURL!)
        
        myWebView.allowsLinkPreview = true
        myWebView.load(myURLRequest)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Inizio")
//        loadingView(loadingIsFinish: false)
        activityIndicator.startAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finito")
//        loadingView(loadingIsFinish: true)
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("Errore \(error.localizedDescription)")
    }
    
    private func loadingView(loadingIsFinish: Bool){
        let alertLoading = UIAlertController(title: "Loading...", message: "Please wait until page will load completely and successfully.", preferredStyle: .alert)
        if loadingIsFinish == false {
            self.present(alertLoading, animated: true)
            return
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupActivityIndicator(){
        activityIndicator.frame = CGRect(x: 200, y: 400, width: 30, height: 30)
        activityIndicator.hidesWhenStopped = true
//        activityIndicator.style = .whiteLarge
        activityIndicator.color = .green
        self.view.addSubview(activityIndicator)
    }
}
