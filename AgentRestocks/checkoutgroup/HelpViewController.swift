//
//  HelpViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 08/02/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
class HelpViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var mybackbutton: UIButton!
    @IBOutlet weak var navigationbarviewfinal: UIView!
    @IBOutlet weak var close: UIButton!
    @IBOutlet weak var myLogyourbutton: UIButton!
    var phoneNumTotal = String()
    @IBOutlet weak var resultcomplaint: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var complianttabelview: UITableView!
    var arrayList = NSArray()
    var Stockistype = [String]()
    var StocktypeColor = [String]()
    var Delyindmessage = [String]()
    var Deliverycomplaint_id = [String]()
    var DeliveryOpen = [String]()
    var DeliverystatusColor = [String]()
    var Deliverydate = [String]()
    var userComplaintID = String()
    var AcessTokenfinalstring = String()
    var myagentTotalvalue  = String()
    
    @IBOutlet weak var HelpTotal: UIView!
    
    
    var coverView = UIView()
    var imageView = UIImageView()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationbarviewfinal.layer.shadowOffset = CGSize(width: 0, height: 3)
        navigationbarviewfinal.layer.shadowOpacity = 0.6
        navigationbarviewfinal.layer.shadowRadius = 3.0
        navigationbarviewfinal.layer.shadowColor = UIColor.color2().cgColor
        myLogyourbutton.layer.cornerRadius = 5.0
         myLogyourbutton.layer.masksToBounds = true
        
        self.viewtop.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.viewbottom.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)

        
        phoneNumTotal = "8688986889"
        
        self.complianttabelview.dataSource = self
        self.complianttabelview.delegate = self
        DispatchQueue.main.async
            {
            self.Helpaction()
        }
    }
    
    @IBAction func Mybackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }

    
    @IBOutlet weak var demoviewfinal: UIView!
    
    
    @IBOutlet weak var bottomtotalfinalvalue: UIView!
    @IBOutlet weak var viewtop: UIView!
    @IBOutlet weak var viewbottom: UIView!
    
    @IBAction func closebutton(_ sender: UIButton)
    {
        self.demoviewfinal.isHidden = true

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
         return self.Stockistype.count
    }
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CompliantTableViewCell = complianttabelview.dequeueReusableCell(withIdentifier: "CompliantTableViewCell", for: indexPath) as! CompliantTableViewCell

        cell.Stockisnotmoving.text = self.Delyindmessage[indexPath.row]
       /// cell.ordernumberlabel.text =  self.Deliverycomplaint_id[indexPath.row]
        
       let deliveryidTotal =  self.Deliverycomplaint_id[indexPath.row]
        let totalvalue = self.DeliveryOpen[indexPath.row]
        
        let stringToatlvaluefinal = String(format:"%@%@",deliveryidTotal,"-")
        
        cell.ordernumberlabel.text = stringToatlvaluefinal

        cell.orderdatelabel.text = self.Deliverydate[indexPath.row]
        cell.stocklabel.text = self.Stockistype[indexPath.row]
        cell.stocklabel.layer.cornerRadius = cell.stocklabel.layer.frame.size.width/2
        cell.stocklabel.layer.masksToBounds = true
        cell.selectionStyle = .none
        let color1labelfianlHelp = self.hexStringToUIColor(hex:self.StocktypeColor[indexPath.row] )
         cell.stocklabel.backgroundColor = color1labelfianlHelp
        let stringfinalvalue = self.Stockistype[indexPath.row]
         cell.myHelpbutton.setTitle(totalvalue, for:.normal)
        
//        if (indexPath.row % 2) != 0
//        {
//            cell.stocklabel.textColor = UIColor.green
//        }
//        else
//        {
//            cell.stocklabel.textColor = UIColor .textfiledbottomcolorside()
//        }
        
        cell.myHelpbutton.addTarget(self, action: #selector(HelpaddBrandFavAction), for: .touchUpInside)
        cell.myHelpbutton.tag = indexPath.row
        return cell
        
    }
    @objc func HelpaddBrandFavAction(sender: UIButton)
    {
        print("buttontaotal value")
        DispatchQueue.main.async
            {
            let HelpDetailsViewControllerTotal = self.storyboard?.instantiateViewController(withIdentifier:"HelpDetailsViewController")as!HelpDetailsViewController
                HelpDetailsViewControllerTotal.popcornName = self.Delyindmessage[sender.tag]
                
                HelpDetailsViewControllerTotal.Helplabeltiel = self.Stockistype[sender.tag]
                HelpDetailsViewControllerTotal.HelpcolorTotal  =  self.StocktypeColor[sender.tag]
            self.present(HelpDetailsViewControllerTotal, animated: true, completion:nil)
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    @IBAction func Mylogyourticket(_ sender: UIButton)
    {
        
        DispatchQueue.main.async {
            let CompliantTotal = self.storyboard?.instantiateViewController(withIdentifier:"ComplaintVC")as!ComplaintVC
            self.present(CompliantTotal, animated: true, completion:nil)
            
        }
    }
    @IBAction func MycalledTotalvalue(_ sender: UIButton)
    {

    }
    @IBAction func DialledNumbervalue(_ sender: UIButton)
    {
        phone(phoneNum:phoneNumTotal)
    }
    @IBAction func mycallbutton(_ sender: UIButton)
    {
        self.demoviewfinal.isHidden = false
        
    }
    
    func phone(phoneNum: String) {
        if let url = URL(string: "tel://\(phoneNum)") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
             
                
            }
            else {
                UIApplication.shared.openURL(url as URL)
             
            }
        }
    }
    
    @IBAction func addbuttonTotal(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let ComplaintVCTotal  = self.storyboard?.instantiateViewController(withIdentifier:"ComplaintVC")as!ComplaintVC
            self.present(ComplaintVCTotal, animated:true, completion:nil)
        }
    }
    
    func Helpaction()
    {
        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
      
        
        if let Reviewfinaluseroid:String = defaults.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.userComplaintID = Reviewfinaluseroid
        }
        
        if let Reviewfinalusid:String = defaults.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinalusid
        }
        if let Myagentidfinlavalue:String = defaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        
        let postString =  String(format: "method=%@&userid=%@","complaintList",self.userComplaintID)
        print(postString)
        request.httpBody = postString.data(using: .utf8)
        request.addValue(AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    self.removeSpinner()

                    DispatchQueue.main.async
                        {
                            self.removeSpinner()
                            self.HelpTotal.isHidden = false
                            self.resultcomplaint.isHidden = true
                    }
                    
                    
                    if let Descriptioncb_display:NSArray = dict.value(forKey: "complaints") as? NSArray {
                        self.arrayList = Descriptioncb_display
                        print(self.arrayList)

                        if self.arrayList.count > 0
                        {
                            self.HelpTotal.isHidden = true
                            self.resultcomplaint.isHidden = false

                            self.Stockistype = self.arrayList.value(forKey:"type")as! [String]
                            
                            self.StocktypeColor = self.arrayList.value(forKey:"typeColor")as! [String]
                            self.Delyindmessage = self.arrayList.value(forKey:"message")as! [String]
                            self.Deliverycomplaint_id = self.arrayList.value(forKey:"complaint_id")as! [String]
                            self.DeliveryOpen = self.arrayList.value(forKey:"status")as! [String]
                            self.DeliverystatusColor = self.arrayList.value(forKey:"statusColor")as! [String]
                            self.Deliverydate = self.arrayList.value(forKey:"date")as! [String]

                            DispatchQueue.main.async
                                {
                                    self.complianttabelview.reloadData()
                            }
                            

                        }
                        
                        if self.arrayList.count < 0 {
                            
                            self.HelpTotal.isHidden = false
                            self.resultcomplaint.isHidden = true

                        }
                      
                    }
                }
                break
                
            case .failure(_):
                DispatchQueue.main.async
                    {
                    self.removeSpinner()
                    self.HelpTotal.isHidden = false
                    self.resultcomplaint.isHidden = true

                  }
            }
        }
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
        //        self.btnSign.isUserInteractionEnabled = true
    }
}
