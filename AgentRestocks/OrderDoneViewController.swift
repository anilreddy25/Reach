//
//  OrderDoneViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 19/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class OrderDoneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func NotNow(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            
            let viewone = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")
            as!HomeViewController
            
            self.present(viewone, animated:true, completion:nil)
            
        }
    }
    @IBAction func RateNow(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let viewone = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")
                as!HomeViewController
            self.present(viewone, animated:true, completion:nil)
            
        }
    }
    
}
