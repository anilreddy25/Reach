//
//  CommecntViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 10/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import QuartzCore

class CommecntViewController: UIViewController {
    @IBOutlet weak var commentbottomtwo: UIView!
    
    @IBOutlet weak var commentlabel: UILabel!
    @IBOutlet weak var commenttopview: UIView!
    
    @IBOutlet weak var rajagoudimage: UIImageView!
    
    @IBOutlet weak var mytetxviewfinal: UILabel!
    
    
    @IBOutlet weak var shareview: UIView!
    
    
    @IBOutlet weak var chatbutton: UIButton!
    
    @IBOutlet weak var sharebutton: UIButton!
    
    @IBOutlet weak var favouritebutton: UIButton!
    
    @IBOutlet weak var starbutton: UIButton!
 
    @IBOutlet weak var commenttextfiled: UITextField!
    
    @IBOutlet weak var commentnameview: UIView!
    
    @IBOutlet weak var commandtextfiledview: UIView!
    
    
    
    @IBOutlet weak var commentmessagelabel: UIView!
    
    
    @IBOutlet weak var postbutton: UIButton!
    
    
    @IBOutlet weak var postnumberlabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        commenttopview.layer.shadowOffset = CGSize(width: 0, height: 3)
        commenttopview.layer.shadowOpacity = 0.6
        commenttopview.layer.shadowRadius = 3.0
        commenttopview.layer.shadowColor = UIColor.color2().cgColor
        
        postbutton.layer.cornerRadius = 5.0
        postbutton.layer.masksToBounds = true
        
        self.shareview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        
        self.shareview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        
        self.commenttextfiled.useUnderline()
        
        self.commentnameview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        
        
        

    }
    @IBAction func backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    
    
    @IBAction func chatbutton(_ sender: UIButton)
    {
        
    }
    
    
    @IBAction func sharebutton(_ sender: UIButton)
    {
        
    }
    @IBAction func favouritebutton(_ sender: UIButton)
    {
    }
    
    @IBAction func starbutton(_ sender: UIButton)
    {
        
        
    }
    
    @IBAction func Postbuton(_ sender: UIButton) {
    }
    

}
