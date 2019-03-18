
//
//  orderCatchViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 29/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class orderCatchViewController: UIViewController
{
    @IBOutlet weak var Donebutton: UIButton!
    @IBOutlet weak var NotNowbutton: UIButton!
    @IBOutlet weak var roundciecleimage: UIImageView!
    @IBOutlet weak var catchpopview: UIView!
    @IBOutlet weak var ratenowbutton: UIButton!
    
    @IBOutlet weak var scatchtopviewfinalvalue: UIView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        catchpopview.layer.cornerRadius = 6
        catchpopview.clipsToBounds = true
        
        roundciecleimage.layer.masksToBounds = false
        roundciecleimage.layer.borderColor = UIColor.black.cgColor
        roundciecleimage.layer.cornerRadius = roundciecleimage.frame.height/2
        roundciecleimage.clipsToBounds = true
        
        
        let cartcounttapvalueis = UITapGestureRecognizer(target: self, action: #selector(self.MycartcounttapvalueisTapContactfinalvalue(_:)))
        scatchtopviewfinalvalue.addGestureRecognizer(cartcounttapvalueis)
        scatchtopviewfinalvalue.isUserInteractionEnabled = true
    }
    
    @objc func MycartcounttapvalueisTapContactfinalvalue(_ sender: UIGestureRecognizer)
    {
        let ViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"scatchtwoViewController") as! scatchtwoViewController
        self.addChildViewController(ViewControllerfinal)
        ViewControllerfinal.view.frame = self.view.frame
        self.view.addSubview(ViewControllerfinal.view)
        ViewControllerfinal.didMove(toParentViewController: self)
    }
    
    @IBAction func Donebutton(_ sender: UIButton)
    {
        
        
    }
    @IBAction func NotNowbutton(_ sender: UIButton)
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
