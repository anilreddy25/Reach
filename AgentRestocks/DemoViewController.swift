//
//  DemoViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 11/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    @IBOutlet weak var pop: UIView!
 
    @IBOutlet weak var sing: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  // pop(frame: CGRect(x: 0, y: 0.0, width: 300.0, height: 300.0))
        
pop.frame = CGRect(x:0, y:self.pop.frame.origin.y+500, width:300.0, height:300.0)

        sing.dropShadow1()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Topbutton(_ sender: UIButton)
    {
        bottom()
        pop.isHidden = false
    }
    
    @IBAction func bottom(_ sender: UIButton)
    {
      
           Up()
        
        pop.isHidden = false
    }
    func bottom()  {
        
        UIView.animate(withDuration: 3.0, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.pop.frame = CGRect(x: 0, y: 500.0, width: 500.0, height: 300.0)
        }) { (finished) in
            if finished {
                // Repeat animation from bottom to top
              //  self.Up()
            }
        }
    }
    
    func Up()  {
        
        UIView.animate(withDuration: 3.0, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.pop.frame = CGRect(x: 0, y:200, width: 300.0, height: 300.0)
        }) { (finished) in
            if finished {
               // self.bottom()
            }
        }
    
}
}
