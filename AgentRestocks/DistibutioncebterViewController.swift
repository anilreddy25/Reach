//
//  DistibutioncebterViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 26/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class DistibutioncebterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var headerview: UIView!
    
    @IBOutlet weak var totalviewfinal: UIView!
    
    @IBOutlet weak var angelarrowup: UIButton!
    @IBOutlet weak var Linkeddcpartner: UIView!

    @IBOutlet weak var codLimitbutton: UIButton!
    
    @IBOutlet weak var Kemarenterpraises: UIButton!
    
    @IBOutlet weak var redrupeeslabel: UILabel!
    
    
    @IBOutlet weak var Blackrupeeslabel: UILabel!
    
    @IBOutlet weak var codLimitivew: UIView!
    
    var CODLimitstring = [String]()
    var shopnamestring = [String]()
    var Rupessstring = [String]()
    var RupessTwostring = [String]()

    var ShopNAme = [String]()
    var Ratingstring = [String]()
    var Distancestring = [String]()
    var Locationstring = [String]()
    var Linkstring = [String]()
    var Linkimage = [UIImage]()

    
    @IBOutlet weak var OtherAvailable: UIView!
    
    
    @IBOutlet weak var distibutiontabelview: UITableView!
    
    
    @IBOutlet weak var expandabelview: UIView!
    
    @IBOutlet weak var shopenterpraseslabel: UILabel!
    
    var shopenterpraseslabelString  = [String]()
    
    @IBOutlet weak var Linked: UIButton!
    
    @IBOutlet weak var shopview: UIView!
    
    @IBOutlet weak var shopratinglabel: UILabel!
    
    @IBOutlet weak var shoplocation: UILabel!
    
    @IBOutlet weak var shopdistance: UILabel!
    
    @IBOutlet weak var ownnerview: UIView!

    @IBOutlet weak var ownername: UILabel!
    @IBOutlet weak var ownertype: UILabel!
    
    @IBOutlet weak var opwnercallbutton: UIButton!
    
    @IBOutlet weak var secondpersonsalesview: UIView!
    
    @IBOutlet weak var secondpersonsalesname: UILabel!
    
    
    @IBOutlet weak var secondpersonrating: UILabel!
    
    @IBOutlet weak var secondpersontype: UILabel!
    
    @IBOutlet weak var distibutionscrollview: UIScrollView!
    var shopenterpraseslabelstring = [String]()
    var shoplocationstring = [String]()
    var shopdistancestring = [String]()
    var shopratingstring = [String]()

    var ownernamestring = [String]()

    var ownertypestring = [String]()

    var secondpersonsalesnamestring = [String]()
    var secondpersonratingstring = [String]()

    var secondpersontypestring = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.headerview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
          self.Linkeddcpartner.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)

        CODLimitstring = ["COD Limit"]
        shopnamestring = ["by kumar enterprises"]
        Rupessstring = [" ₹21,000"]
        RupessTwostring = [" ₹21,000"]
        
    

        codLimitbutton.setTitle(CODLimitstring[0], for:.normal)
        Kemarenterpraises.setTitle(shopnamestring[0], for:.normal)
        redrupeeslabel.text = NSString(format:"%@%@",Rupessstring[0],"/") as String 
       // redrupeeslabel.text = Rupessstring[0]

        Blackrupeeslabel.text =  RupessTwostring[0]
        self.OtherAvailable.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
         self.codLimitivew.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)

        ShopNAme = ["Rathan Enterprises","Kumar Agencies","Pavan Marketing"]
        Ratingstring = ["4.1","4.6","3.9"]
        Locationstring = ["Miyapoor","Uppal","Hayathnagar"]
        Distancestring = ["60m","51m","16m"]
        Linkstring = ["Link","Link","Link"]
        Linkimage = [#imageLiteral(resourceName: "Barnds"),#imageLiteral(resourceName: "Barnds"),#imageLiteral(resourceName: "Barnds")]
      
        self.expandabelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)

        self.Linked.layer.cornerRadius = 5.0
        shopenterpraseslabelString = ["Kumar Enterprises"]
        shoplocationstring = ["Kukatpally"]
        shopdistancestring = ["60m"]
        shopratingstring = ["4.5"]
        ownernamestring = ["Sathyanarayana"]
        ownertypestring = ["Owner"]
        secondpersonsalesnamestring = ["Praveen"]
        secondpersonratingstring = ["4.2"]
        secondpersontypestring = ["Sales executive"]
        shopratinglabel.text = shopenterpraseslabelString[0]
        shopratinglabel.text = shopratingstring[0]
        shoplocation.text = shoplocationstring[0]
        shopdistance.text = shopdistancestring[0]
        ownername.text = ownernamestring[0]
        ownertype.text = ownertypestring[0]
        secondpersonsalesname.text = secondpersonsalesnamestring[0]
        secondpersonrating.text = secondpersonratingstring[0]
        secondpersontype.text = secondpersontypestring[0]
        
        
        if self.view.frame.size.height < 800 {
            distibutionscrollview.contentInset = UIEdgeInsetsMake(0, 0,self.distibutionscrollview.frame.size.height+50, 0)
            distibutionscrollview.isScrollEnabled = true
//            distibutionscrollview.showsVerticalScrollIndicator = false
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Back(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    
    @IBAction func angelarrowup(_ sender: UIButton)
    {
        if angelarrowup.tag == 0
        {
          

            angelarrowup.tag = 1
            angelarrowup.setBackgroundImage(#imageLiteral(resourceName: "dropdownvalue"), for:.normal)
            
            expandabelview.isHidden = true
            totalviewfinal.frame = CGRect(x:self.totalviewfinal.frame.origin.x, y:55, width: self.totalviewfinal.frame.size.width, height: self.totalviewfinal.frame.size.height)
            distibutionscrollview.isScrollEnabled = true
            if self.view.frame.size.height < 800 {
                distibutionscrollview.contentInset = UIEdgeInsetsMake(0, 0,self.distibutionscrollview.frame.size.height-200, 0)
                distibutionscrollview.isScrollEnabled = true
                //            distibutionscrollview.showsVerticalScrollIndicator = false
            }
            
            
        }
        else if angelarrowup.tag == 1
        {
            expandabelview.isHidden = false
            totalviewfinal.frame = CGRect(x:self.totalviewfinal.frame.origin.x, y:290, width: self.totalviewfinal.frame.size.width, height: self.totalviewfinal.frame.size.height)
//            distibutionscrollview.isScrollEnabled = false
            if self.view.frame.size.height < 800 {
                distibutionscrollview.contentInset = UIEdgeInsetsMake(0, 0,self.distibutionscrollview.frame.size.height+50, 0)
                distibutionscrollview.isScrollEnabled = true
                //            distibutionscrollview.showsVerticalScrollIndicator = false
            }
            angelarrowup.tag = 0
             angelarrowup.setBackgroundImage(#imageLiteral(resourceName: "angle-arrowup"), for:.normal)
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return ShopNAme.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell : DistibutionTableViewCell = distibutiontabelview.dequeueReusableCell(withIdentifier: "DistibutionTableViewCell", for: indexPath) as! DistibutionTableViewCell

        
        cell.ratingimageview.image = self.Linkimage[indexPath.row]
        cell.shopname.text = self.ShopNAme[indexPath.row]
        cell.ratinglabel.text = self.Ratingstring[indexPath.row]
        cell.Distancelabel.text = self.Distancestring[indexPath.row]
        cell.Miyapurlabel.text =  self.Locationstring[indexPath.row]
        cell.Linklabel.setTitle(self.Linkstring[indexPath.row], for:.normal)
        
        cell.Linklabel.tag = indexPath.row
        cell.Linklabel.addTarget(self, action: #selector(DistibutioncebterViewController.connectedtwo(sender:)), for: .touchUpInside)
        cell.Linklabel.layer.cornerRadius = 5.0
        return cell
        
        
    }
    
    
    @objc func connectedtwo(sender: UIButton){
//        let buttonTag = sender.tag
//        producidclikHOMEstring = self.SecondProductidValue[buttonTag]
//        producidclikHOMENAmestring = self.SecondNEwproductItems[buttonTag]
//        print(producidclikHOMEstring)
//        
//        DispatchQueue.main.async {
//            self.HOMELikeProduct()
//            
//        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 73
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
    }
    @IBAction func ownercallbutton(_ sender: UIButton)
    {
        
    }
    
    
    
}
