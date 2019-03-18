//
//  productscanViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 12/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire

class productscanViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    @IBOutlet weak var scanview: UIView!
    @IBOutlet weak var productscantetxfield: UITextField!
    @IBOutlet weak var scantabelview: UITableView!
    let cellReuseIdentifier = "cell"
    var screenstring = [String]()
    @IBOutlet weak var Productdescriptionview: UIView!
    @IBOutlet weak var searchbutton: UIButton!
    
    var searchdProductInfo  = String()
    var searchProductName  = String()
    var screenidvalue  = [String]()
    var searchvalue  = String()

    var searchfinalarray = NSArray()
    var screenParticularidvalue  = String()

   var Homeuseridstringvalue = String()
   var Shoutproductdescriptionid  = String()
   var  Myauthorisationstringfinalvalue = String()
   var  myagentTotalvalue = String()
    var useridbilingShout = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.scantabelview.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        scantabelview.delegate = self
        scantabelview.dataSource = self
        searchbutton.layer.cornerRadius = 5.0
       scantabelview.isHidden = true
     
        productscantetxfield.addTarget(self, action: #selector(productscanViewController.textFieldDidEndEditing(_:)), for: .editingDidEnd)

       
        productscantetxfield.delegate = self
        scanview.layer.addBorder(edge: .bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
//        productscantetxfield.attributedPlaceholder = NSAttributedString(string: " Search brands, categories",
//                                                               attributes: [NSAttributedStringKey.foregroundColor:UIColor.textfiledbottomcolorside()])
//
//        let colo = UIColor.textfiledbottomcolorside()
        let attributes = [
            kCTForegroundColorAttributeName:UIColor.textfiledbottomcolorside(),
            kCTFontAttributeName : UIFont(name: ".SFUITEXT-Medium", size: 14.5)!
        ]
        
        productscantetxfield.attributedPlaceholder = NSAttributedString(string: "Search brands, categories", attributes:attributes as [NSAttributedStringKey : Any])
      productscantetxfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        if textField == productscantetxfield
        {
            if (textField.text?.count)! > 0
            {
                self.scantabelview.isHidden = false

                DispatchQueue.main.async {
                    self.searchtype()
                }
            }
            else if textField.text?.count == 0
            {
                self.scantabelview.isHidden = true
            }
            
        }
        
    }
  
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        
        if productscantetxfield.text?.count == 0
        {
            self.screenstring.removeAll()
            
            self.scantabelview.isHidden = true
        }
    }
   

    
  
    
    @IBAction func search(_ sender: UIButton)
    {
     
    }
    @IBAction func buttoncall(_ sender: UIButton)
    {
        "+91 86889 86889".makeAColl()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    @IBAction func scanBack(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    @IBAction func QRcodeviewcontroller(_ sender: UIButton)
    {
        let Barcodeview = self.storyboard?.instantiateViewController(withIdentifier:"BarcodeTypeViewController")as!BarcodeTypeViewController
        self.present(Barcodeview, animated:true, completion:nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.screenstring.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = (self.scantabelview.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        cell.textLabel?.text = self.screenstring[indexPath.row]
        cell.textLabel?.font = UIFont(name:"Arial", size:14.5)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        DispatchQueue.main.async
            {
            let ProductDescriptionView = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
            let valuestringfinaldemo = self.screenidvalue[indexPath.row]
                ProductDescriptionView.productdemoidfinalvalue = valuestringfinaldemo as! String
            self.present(ProductDescriptionView, animated:true, completion:nil)
        }
    }
    func searchtype()
    {
              var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
            request.httpMethod = "POST"
        
        let dafaults = UserDefaults.standard
        if let Myagentidfinal:String =        dafaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.Homeuseridstringvalue = Myagentidfinal
        }
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.Shoutproductdescriptionid = Reviewfinaluseroid
        }
        
        
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        
        if let useridbilingShoutfinalvalue:String = dafaults.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.useridbilingShout = useridbilingShoutfinalvalue

            let postString =  String(format: "method=%@&term=%@&from=%@&userid=%@","getShoppingSearchDetails",productscantetxfield.text!,"text",self.Homeuseridstringvalue)
            print(postString)
        request.httpBody = postString.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        
            Alamofire.request(request).responseJSON { response in
                switch response.result
                {
                case .success(_):
                    
                    if let dictarray:NSArray = response.result.value as? NSArray {
                   print(dictarray)
                      
                    self.searchfinalarray = dictarray
                        self.screenstring = self.searchfinalarray.value(forKey:"ProductName")as![String]
                        self.screenidvalue = self.searchfinalarray.value(forKey:"id")as![String]

                        print(self.screenstring)
                        DispatchQueue.main.async {
                            self.scantabelview.isHidden = false

                            self.scantabelview.reloadData()
                            
                        }
                    }
                    else{
                         self.scantabelview.isHidden = true
                         self.scantabelview.reloadData()
                    }
                    break
                case .failure(_):
                    break
                }
                
                
                
            }
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
//        if productscantetxfield.text?.count  == 0
//        {
//            self.scantabelview.isHidden = true
//
//            let cell:UITableViewCell = (self.scantabelview.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
//            cell.textLabel?.text = nil
//
//        }
    }
   
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
//        let vaueis = productscantetxfield.text?.count
//        print(vaueis)
//
//                if productscantetxfield.text == nil
//                {
//                    self.scantabelview.isHidden = true
//
//                    let cell:UITableViewCell = (self.scantabelview.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
//                    cell.textLabel?.text = nil
//
//                }

        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {

        return true
    }
    
}
