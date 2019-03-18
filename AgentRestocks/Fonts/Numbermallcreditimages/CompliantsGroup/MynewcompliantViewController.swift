//
//  MynewcompliantViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import MultilineTextField
import Alamofire
import AlamofireImage
class MynewcompliantViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate
{
    @IBOutlet weak var mysubmitbutton: UIButton!
    @IBOutlet weak var topviewfinal: UIView!
    @IBOutlet weak var viewtopfinal: UIView!
    var valueStr = String()
    var valueDict = NSArray()
    var validateIssue = String()
    var validID = String()
    var custID = String()
    var userComplaintID = String()
    var AcessTokenfinalstring = String()
    var myagentTotalvalue  = String()

    @IBOutlet weak var stockview: UIView!
    @IBOutlet weak var stocknotmoving: UIButton!
    @IBOutlet weak var productnameview: UIView!
    @IBOutlet weak var productnamebutton: UIButton!
    @IBOutlet weak var brandnameview: UIView!
    @IBOutlet weak var paralebutton: UIButton!
    
    @IBOutlet weak var textField: MultilineTextField!

    @IBOutlet weak var mytabelview: UITableView!
    
    var Connectionfinalstring1 = NSArray()

    var Connectionfinalstring = NSMutableArray()
    
    
    @IBOutlet weak var mynewBackbutton: UIButton!
    
    var Mycompliantidstring = String()
    
   var Mybrand_list = NSArray()

   var Mybrand_idNamestring = [String]()

    var Mybrand_namestring = [String]()

    var Mystocktotalstring = String()

    @IBOutlet weak var mytabelviewfinal: UIView!
    
    var Myclikedstring = String()
    
    
    let cellReuseIdentifier = "cell"

    
    @IBOutlet weak var singeltabelview: UITableView!
    
    var useLoginstring = String()
    var finalcompliantidtotal = String()
    
    var  Mybarndidfinalvalue  = String()
    
    var complaintNAmefinal = String()
    
    var SubcomplaintNAmefinal = String()

    
    var Entertextstring = String()
    
    var sucessfull_compliant = String()
    
    var Stockfinalvalue = String()
    var  BrandNamevalue = String()
    var  productname = String()

    
    var coverView = UIView()
    var imageView = UIImageView()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.stocknotmoving.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.productnamebutton.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.paralebutton.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
    
        topviewfinal.layer.shadowOffset = CGSize(width: 0, height: 3)
        topviewfinal.layer.shadowOpacity = 0.6
        topviewfinal.layer.shadowRadius = 3.0
        topviewfinal.layer.shadowColor = UIColor.color2().cgColor
        
        self.viewtopfinal.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        self.textField.layer.cornerRadius  = 5.0
        self.textField.layer.borderWidth  = 1.0
        self.textField.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
//        let tap = UITapGestureRecognizer(target: self, action: #selector(handleKeyboard(_:)))
//        self.view.addGestureRecognizer(tap)
//
        textField.delegate = self
        textViewDidChange(textField)
  // Connectionfinalstring = ["socket not moving","Need branding support","Need sales promoter support","product Quality issue","I have The Expiry stocks tonbe reuturned"]
 
 
        
        
         Connectionfinalstring.addObjects(from:Connectionfinalstring1 as! [Any])
        print(Connectionfinalstring)
        self.Mystocktotalstring  = Connectionfinalstring[0] as! String
        self.stocknotmoving.setTitle(self.Mystocktotalstring, for:.normal)
   
        self.singeltabelview.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
       self.singeltabelview.dataSource = self
        self.singeltabelview.delegate = self

//        self.mytabelview.isUserInteractionEnabled  = false
        
        self.singeltabelview.isHidden = true
        

    }
    
    
    @objc  func textViewDidChange(_ textView: MultilineTextField) {
//        placeholderView.isHidden = !textView.text.isEmpty
        
        print(textView.text)
        
        Entertextstring = textView.text
        }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool
    {
        
        print(textView.text)
        Entertextstring = textView.text

        return  true
        
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        
    }
    @IBAction func mysubmitbutton(_ sender: UIButton)
    {
        
        if Entertextstring != "" && Stockfinalvalue != "" && BrandNamevalue != ""
        {
            self.MynewcompliantSubmitviewfinal()

        }
        else
        {
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
        }
    }
    @IBAction func paralebutton(_ sender: UIButton)
    {

        if paralebutton.tag == 0
        {
            self.singeltabelview.isHidden = true
              self.singeltabelview.frame = CGRect(x:5, y:360, width:self.view.frame.size.width, height: self.singeltabelview.frame.size.height)
            self.MynewcompliantView()

Myclikedstring = "3"
            paralebutton.tag = 1
        }
        else if paralebutton.tag == 1
            
        {
            self.singeltabelview.isHidden = true
            self.singeltabelview.frame = CGRect(x:self.singeltabelview.frame.origin.x, y:360, width:self.singeltabelview.frame.size.width, height: self.singeltabelview.frame.size.height)
            Myclikedstring = ""

            paralebutton.tag = 0
        }
    }
    @IBAction func productnamebutton(_ sender: UIButton)
    {
       
        if productnamebutton.tag == 0
        {
            self.singeltabelview.isHidden = false
               self.singeltabelview.frame = CGRect(x:self.singeltabelview.frame.origin.x, y:285, width:self.singeltabelview.frame.size.width, height: self.singeltabelview.frame.size.height)
            Myclikedstring = "2"

            productnamebutton.tag = 1
        }
        else if productnamebutton.tag == 1
            
        {
            self.singeltabelview.isHidden = true
                self.singeltabelview.frame = CGRect(x:self.singeltabelview.frame.origin.x, y:285, width:self.singeltabelview.frame.size.width, height: self.singeltabelview.frame.size.height)
            Myclikedstring = ""

            productnamebutton.tag = 0
        }
    }
    
    @IBAction func stockbutton(_ sender: UIButton)
    {
        if stocknotmoving.tag == 0
        {
            self.singeltabelview.isHidden = false
//            self.mytabelview.frame = CGRect(x:5, y:220, width:300, height:200)
            self.singeltabelview.frame = CGRect(x:self.singeltabelview.frame.origin.x, y:220, width:self.singeltabelview.frame.size.width, height: self.singeltabelview.frame.size.height)

            self.singeltabelview.isHidden = false

            Myclikedstring = "1"

            stocknotmoving.tag = 1
        }
        else if stocknotmoving.tag == 1
        {
            self.singeltabelview.isHidden = true
            Myclikedstring = ""
            stocknotmoving.tag = 0
        }
    }
    @objc func handleKeyboard(_ gesture: UITapGestureRecognizer)
    {
        let location = gesture.location(in: textField)
        if !textField.bounds.contains(location) {
            view.endEditing(true)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.Connectionfinalstring.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:MynewcompiantTableViewCell = singeltabelview.dequeueReusableCell(withIdentifier:"MynewcompiantTableViewCell", for: indexPath) as!MynewcompiantTableViewCell

//        let cell:UITableViewCell = self.singeltabelview.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!

        cell.mynewcompiantlabel.text = self.Connectionfinalstring[indexPath.row] as! String
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("Methodcalled")
        self.Mystocktotalstring = ""
        self.Mystocktotalstring = self.Connectionfinalstring[indexPath.row] as! String
        self.singeltabelview.isHidden = true
        
        print(self.Mystocktotalstring)
        if self.Myclikedstring == "1"
        {
            self.stocknotmoving.setTitle(self.Mystocktotalstring, for:.normal)
            self.Stockfinalvalue = "Stockfinalvalue"
            self.stocknotmoving.tag = 1
            
        }
        if self.Myclikedstring == "2"
        {
            self.productnamebutton.setTitle(self.Mystocktotalstring, for:.normal)
            self.productname = "productname"

            self.productnamebutton.tag = 1

        }
        if self.Myclikedstring == "3"
        {
            self.paralebutton.setTitle(self.Mystocktotalstring, for:.normal)
            
            self.Mybarndidfinalvalue = self.Mybrand_idNamestring[indexPath.row]
            self.BrandNamevalue = "BrandNamevalue"

            self.paralebutton.tag = 1

        }
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        var height:CGFloat = CGFloat()
//        if indexPath.row == 1 {
//            height = 150
//        }
//        else {
//            height = 50
//        }
//
//        return height
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50.0
    }
    
    @IBAction func MynewBackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    func MynewcompliantView()
    {
        var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useLoginstring = Reviewfinaluseroid
        }
        
        if let Finalcompliantid:String = defaults.value(forKey: "Mynewcopliantidvalue")as?String
        {
            self.finalcompliantidtotal = Finalcompliantid
        }
     
        let postString =  String(format: "method=%@&complaint=%@&userid=%@&brandId=%@","complaintinfo",self.finalcompliantidtotal,self.useLoginstring,"nil")
        print(postString)
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    self.Mycompliantidstring = dict.value(forKey:"complaint")as!String
                    self.Mybrand_list = dict.value(forKey:"brand_list")as!NSArray
                    self.Mybrand_idNamestring = self.Mybrand_list.value(forKey:"id")as![String]
                    self.Mybrand_namestring = self.Mybrand_list.value(forKey:"name")as![String]
                    self.Connectionfinalstring.removeAllObjects()
                    
            self.Connectionfinalstring.addObjects(from:self.Mybrand_namestring as [Any])
                    print(self.Connectionfinalstring)
/// self.Connectionfinalstring.adding( self.Mybrand_namestring)
//                    self.Mybrand_namestring = self.Connectionfinalstring as! [String]
                    print(self.Connectionfinalstring)
                    DispatchQueue.main.async
                        {
                            self.singeltabelview.isHidden = false
                        self.singeltabelview.reloadData()
                     }
                }
                break
            case .failure(_):
                print("error")
            }
        }
    }

    func MynewcompliantSubmitviewfinal()
    {
        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useLoginstring = Reviewfinaluseroid
        }
        
        if let Finalcompliantid:String = defaults.value(forKey: "Mynewcopliantidvalue")as?String
        {
            self.finalcompliantidtotal = Finalcompliantid
        }
        if let complaintNAmefinalvalue:String = defaults.value(forKey: "MycompliantName")as?String
        {
            self.complaintNAmefinal = complaintNAmefinalvalue
        }
        if let SubcomplaintNAmefinalvalue:String = defaults.value(forKey: "Mysubcomplaint")as?String
        {
            self.SubcomplaintNAmefinal = SubcomplaintNAmefinalvalue
        }
        
        if let Reviewfinaluseroid:String = defaults.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

        
        let postString =  String(format: "method=%@&complaintId=%@&complaint=%@&subComplaint=%@&brandId=%@&distributorId=%@&message=%@&userid=%@","raisecomplaint",self.finalcompliantidtotal,self.complaintNAmefinal,self.SubcomplaintNAmefinal,self.Mybarndidfinalvalue ,"123",Entertextstring,self.useLoginstring)
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
                    print(dict)
                    self.removeSpinner()
                    self.sucessfull_compliant = dict.value(forKey:"msg") as! String
                    print(self.sucessfull_compliant)
                    self.view.makeToast(self.sucessfull_compliant)
                    DispatchQueue.main.async
                        {
                let HomeViewContro = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
                  self.present(HomeViewContro, animated:true, completion:nil)
                    }
                }
                break
            case .failure(_):
                print("error")
                self.removeSpinner()
            }
        }
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


