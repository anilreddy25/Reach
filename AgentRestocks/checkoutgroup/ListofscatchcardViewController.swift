//
//  ListofscatchcardViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 19/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class ListofscatchcardViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var Exposed = [String]()
    var Expiredate = [String]()
    var numbermallimage = [UIImage]()
    
    @IBOutlet weak var popview: UIView!
    
    @IBOutlet weak var Listofcardtabelview: UITableView!
    //    Expires on
//    Unopened Expires on
//    28 Aug 2018
//    28 Aug 2018
//    28 Aug 2018
//    28 Aug 2018
//    28 Aug 2018
    @IBOutlet weak var topview: UIView!
    
    @IBOutlet weak var delteebutton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       Exposed  = ["Exposed","Exposed","Exposed","Exposed","Exposed"]
       Expiredate  = ["Unopened Expires on 28 Aug 2018","Unopened Expires on 28 Aug 2018","Unopened Expiredon 28 Aug 2018","Unopened Expires on 28 Aug 2018","Unopened Expires on 28 Aug 2018"]
        numbermallimage = [UIImage(named:"maskone.png"),UIImage(named:"maskone.png"),UIImage(named:"maskone.png"),UIImage(named:"maskone.png"),UIImage(named:"maskone.png")] as! [UIImage]
        Listofcardtabelview.dataSource = self
        Listofcardtabelview.delegate = self
        topview.layer.shadowOffset = CGSize(width: 0, height: 2)
        topview.layer.shadowOpacity = 0.3
        topview.layer.shadowRadius = 1.0
        topview.layer.borderColor = UIColor.color2().cgColor
        topview.layer.shadowColor = UIColor.color2().cgColor
        self.topview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.5)
        
        self.delteebutton.layer.cornerRadius = 2.0
        self.delteebutton.layer.borderWidth = 1.0
        self.delteebutton.layer.borderColor = UIColor.white.cgColor
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.Exposed.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell  = Listofcardtabelview.dequeueReusableCell(withIdentifier:"ListofcardTableViewCell", for: indexPath) as! ListofcardTableViewCell
        cell.selectionStyle = .none
        if indexPath.row == 3
        {
            cell.unexposedlabel.text = self.Exposed[indexPath.row] as? String
            cell.Datelabel.text = self.Expiredate[indexPath.row] as? String
            cell.Numbermallimage.image = self.numbermallimage[indexPath.row] as? UIImage
            cell.deleteiamge.isHidden = false
             cell.Datelabel.textColor = UIColor.red
          
        }
        else
        {
            cell.unexposedlabel.text = self.Exposed[indexPath.row] as? String
            cell.Datelabel.text = self.Expiredate[indexPath.row] as? String
            cell.Numbermallimage.image = self.numbermallimage[indexPath.row] as? UIImage
            cell.deleteiamge.isHidden = true
            cell.Datelabel.textColor = UIColor.textfiledbottomcolorside()
            

        }
       
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 3
        {
            self.popview.isHidden = false
        }
        else
        {
            self.popview.isHidden = true
        }
        
    }
    
    
    @IBAction func closebutton(_ sender: UIButton)
    {
        self.popview.isHidden = true
        
    }
    
    @IBAction func Mydeletebutton(_ sender: UIButton)
    {
        self.popview.isHidden = true
    }
    
    @IBAction func Mybackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
}
