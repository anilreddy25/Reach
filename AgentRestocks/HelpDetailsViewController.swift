//
//  HelpDetailsViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 13/02/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//


/// https://github.com/dima-nikolaev/ChatBubble
// messaeg chat bubbels - in chat
import UIKit
import Alamofire
import AlamofireImage
class HelpDetailsViewController: UIViewController,GrowingTextViewDelegate,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var camearview: UIView!
    @IBOutlet weak var message: UITextField!
    @IBOutlet weak var popcornalbel: UILabel!
    @IBOutlet weak var myback: UIButton!
    @IBOutlet weak var viewtoptotal: UIView!
    @IBOutlet weak var viewtop: UIView!
    @IBOutlet weak var bottomview: UIView!
    @IBOutlet weak var Helplabel: UILabel!
    @IBOutlet weak var mysendmessagebutton: UIButton!
    var popcornName = String()
    var HelpcolorTotal = String()
    var Helplabeltiel = String()
    @IBOutlet weak var textView: GrowingTextView!
    @IBOutlet weak var mycardtabelviewfinal: UITableView!
    var complaintNamefinalvalue = [String]()
    var coverView = UIView()
    var imageView = UIImageView()
    var useridbilingfinalvalue = String()
    var userComplaintID = String()
    var idComplaintsstring = String()
    var conversationarrayfinalvalue = NSArray()
    
    var idstringvalue = [String]()
    var message_idvalue = [String]()
    var typevalue = [String]()
    var messagevaleu = [String]()
    var tickvalue = [String]()
    var actor_namevalue = [String]()
    var actor_designation = [String]()
    var actor_dateTime = [String]()
    var actor_complaint_subject_color = [String]()
    var actor_complaint_subject = [String]()
    var tickvalueis = [String]()
    var AcessTokenfinalstring = String()
    var myagentTotalvalue = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        viewtoptotal.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewtoptotal.layer.shadowOpacity = 0.6
        viewtoptotal.layer.shadowRadius = 3.0
        viewtoptotal.layer.shadowColor = UIColor.color2().cgColor
        bottomview.layer.shadowOffset = CGSize(width: 0, height: 3)
        bottomview.layer.shadowOpacity = 0.6
        bottomview.layer.shadowRadius = 3.0
        bottomview.layer.shadowColor = UIColor.color2().cgColor
        self.popcornalbel.layer.cornerRadius = self.popcornalbel.layer.frame.size.width/2
        self.Helplabel.layer.cornerRadius = self.Helplabel.layer.frame.size.width/2
        self.Helplabel.layer.masksToBounds = true
        self.bottomview.layer.cornerRadius = 15.0
        self.bottomview.layer.masksToBounds = true
        if popcornName.count > 0
        {
            popcornalbel.text = popcornName
        }
        if HelpcolorTotal.count > 0
        {
           let value =  self.hexStringToUIColor(hex:HelpcolorTotal)
             Helplabel.backgroundColor =  value
        }
        if Helplabeltiel.count > 0
        {
            Helplabel.text = Helplabeltiel
        }
        self.mycardtabelviewfinal.dataSource = self
        self.mycardtabelviewfinal.delegate = self
        
    complaintNamefinalvalue = ["complaintNamefinalvalue","complaintNamefinalvalue","complaintNamefinalvalue","complaintNamefinalvalue","complaintNamefinalvalue","complaintNamefinalvalue","complaintNamefinalvalue"]
        self.mycardtabelviewfinal.showsVerticalScrollIndicator = false
        
        DispatchQueue.main.async
        {
            self.Helpaction()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.complaintNamefinalvalue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: MycardTableViewCell = mycardtabelviewfinal.dequeueReusableCell(withIdentifier: "MycardTableViewCell") as! MycardTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 120.0
    }
    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat)
    {
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveLinear], animations: { () -> Void in
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    @IBAction func messagetextfield(_ sender: Any)
    {
        
    }
  @IBAction func mybackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    @IBAction func mycallbutton(_ sender: UIButton)
    {
        
    }
    @IBAction func menubuton(_ sender: UIButton)
    {
        
    }
    @IBAction func sendmessagebutton(_ sender: UIButton)
    {
        
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
    if let Reviewfinaluseroid:String = defaults.value(forKey: "Myuseridfinaltwovalue")as?String
        {
            self.useridbilingfinalvalue = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = defaults.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        let postString =  String(format: "method=%@&idComplaints=%@&userid=%@","complaintMessages",self.idComplaintsstring,self.useridbilingfinalvalue)
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
                    if dict.count > 0
                    {
                        DispatchQueue.main.async
                        {
                            self.removeSpinner()
                        }
                        self.conversationarrayfinalvalue = dict.value(forKey:"conversation")as!NSArray
                        print(self.conversationarrayfinalvalue)
                    if let messagevaleufinal:[String] =  self.conversationarrayfinalvalue.value(forKey: "message") as? [String]
                        {
                            self.messagevaleu = messagevaleufinal
                        }
                        if let typevaluesingel:[String] =  self.conversationarrayfinalvalue.value(forKey: "type") as? [String]
                        {
                            self.typevalue = typevaluesingel
                        }
                if let Compliantvaluetotalsingel:[String] =  self.conversationarrayfinalvalue.value(forKey:"complaint_subject") as? [String]
                        {
                        self.actor_complaint_subject = Compliantvaluetotalsingel
                        }
                        if let actor_complaint_subject_colorfinalvalue:[String] =  self.conversationarrayfinalvalue.value(forKey:"complaint_subject_color") as? [String]
                        {
                            self.actor_complaint_subject_color = actor_complaint_subject_colorfinalvalue
                        }
                        if let datandtimevalue:[String] =  self.conversationarrayfinalvalue.value(forKey:"dateTime") as? [String]
                        {
                            self.actor_dateTime = datandtimevalue
                        }
                        if let tickvaluefinal:[String] =  self.conversationarrayfinalvalue.value(forKey:"tick") as? [String]
                        {
                            self.tickvalueis = tickvaluefinal
                        }
                        DispatchQueue.main.async
                            {
                            self.mycardtabelviewfinal.reloadData()
                        }
                    }
                }
                break
                
            case .failure(_):
                DispatchQueue.main.async
                    {
                        self.removeSpinner()
                  }
              }
        }
    }
    func hexStringToUIColor (hex:String) -> UIColor
    {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#"))
        {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6)
        {
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
    func showSpinner()
    {
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner()
    {
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
}
