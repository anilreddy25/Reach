//
//  LaunchscreenViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 09/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class LaunchscreenViewController: UIViewController {
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func timerAction() {
       
        let view = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
        self.navigationController?.pushViewController(view, animated:true)
    }
}
