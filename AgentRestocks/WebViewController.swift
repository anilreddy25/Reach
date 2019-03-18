//
//  WebViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 15/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {
    @IBOutlet weak var webviewfinalvalue: WKWebView!
    @IBOutlet weak var webpopview: UIView!
    var timersingel  = Timer()
    
    @IBOutlet weak var singelview: UIView!
    
    var coverView = UIView()
    var imageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   webpopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.showSpinner()
        self.singelview.isHidden = false

        timersingel = Timer.scheduledTimer(timeInterval: 0.50, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
        

    }
    @objc func timerAction()
    {
        self.removeSpinner()
        self.singelview.isHidden = true

        let url = URL(string: "http://172.31.0.13/NumberMall/heroterms.php")!
        webviewfinalvalue.load(URLRequest(url: url))
        webviewfinalvalue.allowsBackForwardNavigationGestures = true
        webviewfinalvalue.navigationDelegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Back(_ sender: UIButton)
    {

        
        self.dismiss(animated:true, completion:nil)
    }
    
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.singelview.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }

}
