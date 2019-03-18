//
//  HerosubscriptioncartViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 18/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import SwiftyJSON
import Alamofire
import AlamofireImage
import SDWebImage

class HerosubscriptioncartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var headerview: UIView!
    
    @IBOutlet weak var carttavbelview: UITableView!
    
    @IBOutlet weak var itemlabel: UILabel!
    
    @IBOutlet weak var subtotalrupees: UILabel!
    
    
    @IBOutlet weak var Handlingrupees: UILabel!
    
    @IBOutlet weak var gstrupes: UILabel!
    
    @IBOutlet weak var cashbackrupees: UILabel!
    
    @IBOutlet weak var topviewfinal: UIView!
    
    var HEROsubscrptionname = [String]()
    
    var HEROsubscrptionRupess = [String]()

    var HEROSubscriptionperiod = [String]()
    var HEROSubscriptioncount = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.headerview.layer.shadowOffset = CGSize(width: 0, height: 2)
         self.headerview.layer.shadowOpacity = 0.3
         self.headerview.layer.shadowRadius = 1.0
         self.headerview.layer.borderColor = UIColor.color2().cgColor
         self.headerview.layer.shadowColor = UIColor.color2().cgColor
        self.headerview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.5)
        self.topviewfinal.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.5)
        self.carttavbelview.dataSource = self
        self.carttavbelview.delegate = self
     
        HEROsubscrptionname = ["HERO subscription for quarterly"]
        HEROsubscrptionRupess = ["₹2,700.00"]
        HEROSubscriptionperiod = ["Subscription period for 90 days"]
        HEROSubscriptioncount = ["1"]
        
        
        
        
        
    }
    
    @IBAction func buttonback(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    @IBAction func clearcart(_ sender: UIButton)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "deletecartViewController") as! deletecartViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.HEROsubscrptionname.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell  = carttavbelview.dequeueReusableCell(withIdentifier:"HeroSubscriptionTableViewCell", for: indexPath) as! HeroSubscriptionTableViewCell
        cell.selectionStyle = .none
        cell.HeroName.text = self.HEROsubscrptionname[indexPath.row] as? String
        cell.rupeeslabel.text = self.HEROsubscrptionRupess[indexPath.row] as? String
        cell.periodlabel.text = self.HEROSubscriptionperiod[indexPath.row] as? String
        cell.editcartcount.text = self.HEROSubscriptioncount[indexPath.row] as? String

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75
    }
    
    @IBAction func checkoutbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let checkoufinalViewControllervalue = self.storyboard?.instantiateViewController(withIdentifier:"checkoufinalViewController")as!checkoufinalViewController
            self.present(checkoufinalViewControllervalue, animated: true, completion:nil)
        }
    }
    
    @IBAction func checkoutamonutrupessbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let checkoufinalViewControllervalue = self.storyboard?.instantiateViewController(withIdentifier:"checkoufinalViewController")as!checkoufinalViewController
            self.present(checkoufinalViewControllervalue, animated: true, completion:nil)
        }
    }

}
