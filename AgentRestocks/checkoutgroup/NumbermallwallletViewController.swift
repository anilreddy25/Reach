//
//  NumbermallwallletViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 18/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class NumbermallwallletViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var walletrupess: UILabel!
    @IBOutlet weak var topviewfinal: UIView!
    var images1 = [UIImage]()
    var logoImages1 = [String]()
    var Productname = [String]()
    var ProductRupess = [String]()
    var ProductExpirerupess = [String]()
    @IBOutlet weak var banktabelviewtwo: UITableView!
    var Logoimagevalue = [UIImage]()
    var WalletuserBiling = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.topviewfinal.dropShadow()
        
        topviewfinal.layer.shadowOffset = CGSize(width: 0, height: 2)
        topviewfinal.layer.shadowOpacity = 0.3
        topviewfinal.layer.shadowRadius = 1.0
        topviewfinal.layer.borderColor = UIColor.color2().cgColor
        topviewfinal.layer.shadowColor = UIColor.color2().cgColor
        self.topviewfinal.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.5)
        banktabelviewtwo.dataSource = self
        banktabelviewtwo.delegate = self
  Logoimagevalue = [UIImage(named:"NumberMall.png.png"),UIImage(named:"Timla.png"),UIImage(named:"Britannia.png"),UIImage(named:"Lays.png")] as! [UIImage]
        

//        Logoimagevalue = [UIImage(named:"NumberMall.png"),UIImage(named:"Timla.png")] as! [UIImage]

        Productname  = ["NumberMall","Timla","Britannia","Lays"]

        ProductRupess  = ["₹250","₹220","₹120","₹80"]

        ProductExpirerupess  = ["₹45 expires in 40h 28m","","₹45 expires in 40h 28m",""]
        DispatchQueue.main.async {
            self.walletcallfunctionfinalvalue()
        }
    }
    
    @IBAction func backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    @IBAction func Closebutton(_ sender: UIButton) {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    return self.Productname.count

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell  = banktabelviewtwo.dequeueReusableCell(withIdentifier:"NumbermallcreditTableViewCell", for: indexPath) as! NumbermallcreditTableViewCell
        cell.selectionStyle = .none
        cell.productName.text = self.Productname[indexPath.row] as? String
        cell.productrupess.text = self.ProductRupess[indexPath.row] as? String
        cell.expirelabel.text = self.ProductExpirerupess[indexPath.row] as? String
        cell.numbermallimage.image = self.Logoimagevalue[indexPath.row] as? UIImage
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        DispatchQueue.main.async
            {
            let secodnvalue = self.storyboard?.instantiateViewController(withIdentifier:"ListofscatchcardViewController")as!ListofscatchcardViewController
            self.present(secodnvalue, animated: true, completion:nil)
        }
    }
    
    
    func walletcallfunctionfinalvalue()
    {
        let defaulst = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.WalletuserBiling = Reviewfinaluseroid
        }
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        
        let postString12 = String(format: "method=%@&userid=%@","getWallet",self.WalletuserBiling)
        print(postString12)
        
        request.httpBody = postString12.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
         
                    
                }
                
                break
            case .failure(_):
                break
            }
            
            
        }
        
    }
}
