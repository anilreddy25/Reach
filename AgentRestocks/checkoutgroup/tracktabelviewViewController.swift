



//
//  tracktabelviewViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 26/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class tracktabelviewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate
{
    @IBOutlet weak var tracktabelview: UITableView!
    var trackLogoimagevalue = [UIImage]()
    var trackrecivedName = [String]()
    var trackorderedName = [String]()
    var trackorderedDate = [String]()
    var trackorderedDonelabel = [String]()
    @IBOutlet weak var notdeliveredbutton: UIButton!
    
    @IBOutlet weak var okgothit: UIButton!
    
    
    @IBOutlet weak var demoscrollview: UIScrollView!
    
//    @IBOutlet weak var singlpopvie: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tracktabelview.dataSource = self
        tracktabelview.delegate = self
        trackLogoimagevalue = [UIImage(named:"Received.png"),UIImage(named:"Packed.png"),UIImage(named:"Confirmed.png"),UIImage(named:"Shipped.png"),UIImage(named:"Delivered.png"),UIImage(named:"OutforDelivery.png"),UIImage(named:"OrderDelivered.png")] as! [UIImage]
        
        trackrecivedName = ["Received","Packed","Confirmed","Shipped","Delivered to DP","Out for Delivery","Order Delivered"]
        
        trackorderedName = ["Self order by Kamalesh","Order picked, packed and verified","Invoice generated, ready to ship","Order loaded into the delivery vehicle to DP","Ollirndegr Adedlivderedsast DP","Ganesh will be delivering your order","Your order has been delivered. Keep ordering!"]
        
        
        trackorderedDate = ["Wed 6 nov 2017 6:30 PM","Wed 6 nov 2017 6:30 PM","Wed 6 nov 2017 6:30 PM","Wed 6 nov 2017 6:30 PM","Wed 6 nov 2017 6:30 PM","Arrived at Wed 6 nov 2017 12:35 PM",""]
        trackorderedDonelabel = ["DONE","DONE","DONE","DONE","DONE","DONE","NOW"]
 
        tracktabelview.showsHorizontalScrollIndicator = false
        tracktabelview.showsVerticalScrollIndicator = false
        
        self.notdeliveredbutton.layer.cornerRadius = 1.0
        self.notdeliveredbutton.layer.masksToBounds  = true
        self.notdeliveredbutton.layer.borderColor = UIColor.orderconfirmListvalue().cgColor
        self.notdeliveredbutton.layer.borderWidth  = 1.0
        
        
        
//        let bottomSheettwo = JXBottomSheetView(contentView:(demoscrollview)!)
//        bottomSheettwo.defaultMaxinumDisplayHeight  = 500
//        bottomSheettwo.defaultMininumDisplayHeight = 300
//        bottomSheettwo.displayState = .maxDisplay
//        bottomSheettwo.frame = self.view.bounds
//        self.view.addSubview(bottomSheettwo)
//        demoscrollview.delegate  = self
        
        let bottomSheettwo = JXBottomSheetView(contentView:(demoscrollview)!)
        bottomSheettwo.defaultMaxinumDisplayHeight  = 500
        bottomSheettwo.defaultMininumDisplayHeight = 150
        bottomSheettwo.displayState = .maxDisplay
        bottomSheettwo.frame = self.view.bounds
        self.view.addSubview(bottomSheettwo)
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
//        self.singlpopvie.backgroundColor = UIColor.white.withAlphaComponent(0.3)
//        self.demoscrollview.backgroundColor = UIColor.white.withAlphaComponent(0.3)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.trackLogoimagevalue.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell  = tracktabelview.dequeueReusableCell(withIdentifier:"TrackTableViewCell", for: indexPath) as! TrackTableViewCell
        cell.selectionStyle = .none
        cell.ReceivedName.text = self.trackrecivedName[indexPath.row] as? String
        cell.SelforderbyKamalesh.text = self.trackorderedName[indexPath.row] as? String
        cell.datelaebl.text = self.trackorderedDate[indexPath.row] as? String
      let valuesingel = self.trackorderedDonelabel[indexPath.row] as? String
        cell.Donelabel.layer.cornerRadius = 6.0
        cell.Donelabel.layer.masksToBounds  = true
        cell.Donelabel.layer.borderColor = UIColor.orderconfirmListvalue().cgColor
        cell.Donelabel.layer.borderWidth  = 1.0
        cell.Donelabel.setTitle(valuesingel, for:.normal)
        cell.tarckiamge.image = self.trackLogoimagevalue[indexPath.row] as? UIImage
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == tracktabelview
        {
            
            
        }
    }
    @IBAction func Nodeliverybutton(_ sender: UIButton)
    {
        
    }
    @IBAction func okhitbutton(_ sender: UIButton)
    {
        
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool)
    {
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        
    }
  
}
