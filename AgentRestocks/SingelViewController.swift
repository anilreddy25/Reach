//
//  SingelViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 21/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class SingelViewController: UIViewController {

    @IBOutlet weak var singeldemoviewfinal: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Homeview(_ sender: UIButton)
    {
         let MarketViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"HomeViewController") as! HomeViewController
        self.present(MarketViewControllerfinal, animated:true, completion:nil)
        
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func singeldemofinalvalue(_ sender: UIButton)
    {
        let MarketViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"MarketViewController") as! MarketViewController
        self.addChildViewController(MarketViewControllerfinal)
//        MarketViewControllerfinal.view.frame = self.view.frame
        
        MarketViewControllerfinal.view.frame = CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height)

        self.singeldemoviewfinal.addSubview(MarketViewControllerfinal.view)
        
        MarketViewControllerfinal.didMove(toParentViewController: self)
    }
    
}
