//
//  LogoutViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 11/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController
{
    @IBOutlet weak var edittopview: UIView!
    @IBOutlet weak var editunderview: UILabel!
    @IBOutlet weak var editbottpmview: UIView!
    @IBOutlet weak var singeliconview: UIView!
    @IBOutlet weak var drop: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.editbottpmview.layer.addBorder(edge:.top, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.editbottpmview.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.editbottpmview.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        singeliconview.layer.cornerRadius = 5.0
        drop.roundedButton()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func Nobutton(_ sender: UIButton)
    {
        self.view.removeFromSuperview()
    }
    @IBAction func Logout(_ sender: UIButton)
    {
        let defaults = UserDefaults.standard
        defaults.set("", forKey: "islogintrue")
        defaults.synchronize()
       
        let app = UIApplication.shared.delegate as! AppDelegate
        app.user_defa1()
        app.userdefafinalValue()

        DispatchQueue.main.async
        {
            let AnimationLoginViewfinal = self.storyboard?.instantiateViewController(withIdentifier:"AnimationLoginViewController")as!AnimationLoginViewController
            self.present(AnimationLoginViewfinal, animated: true, completion:nil)
        }
    }
}
