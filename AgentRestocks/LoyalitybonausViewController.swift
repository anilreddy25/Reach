//
//  LoyalitybonausViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 26/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class LoyalitybonausViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var Loylitybonusview: UIView!
    
    @IBOutlet weak var Loyalityviewone: UIView!

    @IBOutlet weak var Loyalitybonustabelview: UITableView!
    var mothstring = [String]()
    var Earnedbonustring = [String]()
    var cashbackstring = [String]()
    var totalrupessstring = [String]()
    var percentage = [String]()
    var advancesstring = [String]()
    var tagetbonusstring = [String]()
    var coverView = UIView()
    var imageView = UIImageView()
    var useridbiling = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Loylitybonusview.layer.shadowOffset = CGSize(width: 0, height: 2)
        Loylitybonusview.layer.shadowOpacity = 0.3
        Loylitybonusview.layer.shadowRadius = 1.0
        Loylitybonusview.layer.borderColor = UIColor.color2().cgColor
        Loylitybonusview.layer.shadowColor = UIColor.color2().cgColor
        
//        topview.dropShadow()
        Loylitybonusview.dropShadow()
//
//        mothstring = ["August","August","August","August","August"]
//        Earnedbonustring = ["Earned bonus ₹250.00","Earned bonus ₹250.00","Earned bonus ₹250.00","Earned bonus ₹250.00"]
//        cashbackstring =  ["₹41,000","₹21,00","₹21,00","₹21,00"]
//        totalrupessstring = ["₹50,000","₹25,000","₹25,000","₹25,000","₹25,000"]
//        percentage = ["(1.25%)","(1%)","(1%)","(1%)","(1%)"]
        advancesstring = ["Achieved"]
        tagetbonusstring = ["/Next target (Bonus)"]
    self.LoyalityBonusscreenfinlavalue()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.mothstring.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell : LoyalityTableViewCell = Loyalitybonustabelview.dequeueReusableCell(withIdentifier: "LoyalityTableViewCell", for: indexPath) as! LoyalityTableViewCell
        cell.selectionStyle = .none

//                    cell.Mothbutton.setTitle(self.mothstring[indexPath.row], for:.normal)
//
//      cell.earnedbonuslabel.text = self.Earnedbonustring[indexPath.row]
//cell.targetbonuslabel.text =  self.tagetbonusstring[indexPath.row]
//
        
         
        if indexPath.row == 0
        {
               cell.offerrupeeslabel.textColor = UIColor.loyalitycolor()
            cell.Mothbutton.setTitle(self.mothstring[indexPath.row], for:.normal)
            cell.earnedbonuslabel.text = self.Earnedbonustring[indexPath.row]
            
            let valuesingel = self.cashbackstring[indexPath.row]
            
            cell.offerrupeeslabel.text = NSString(format:"%@%@",valuesingel,"/") as String
            cell.totalrupesslabel.text = self.totalrupessstring[indexPath.row]
            cell.totalpercentagelabel.text = self.percentage[indexPath.row]
            cell.achivedlabel.text =  self.advancesstring[indexPath.row]
            cell.targetbonuslabel.text =  self.tagetbonusstring[indexPath.row]
            cell.Mothbutton.tag = indexPath.row
        cell.Mothbutton.addTarget(self, action: #selector(LoyalitybonausViewController.connectLoyality(sender:)), for: .touchUpInside)
            cell.Mothbutton.layer.cornerRadius = 5.0
        }
        else{
            cell.offerrupeeslabel.textColor = UIColor.red

            cell.Mothbutton.setTitle(self.mothstring[indexPath.row], for:.normal)
           cell.earnedbonuslabel.text = self.Earnedbonustring[indexPath.row]
            cell.offerrupeeslabel.text = self.cashbackstring[indexPath.row]


            let cashvalue = self.totalrupessstring[indexPath.row]
            cell.offerrupeeslabel.text = self.cashbackstring[indexPath.row]
            cell.totalrupesslabel.text = self.totalrupessstring[indexPath.row]

            cell.totalpercentagelabel.text = self.percentage[indexPath.row]
            cell.achivedlabel.text =  self.advancesstring[indexPath.row]
            cell.targetbonuslabel.text =  self.tagetbonusstring[indexPath.row]
            cell.Mothbutton.tag = indexPath.row
            cell.Mothbutton.addTarget(self, action: #selector(LoyalitybonausViewController.connectLoyality(sender:)), for: .touchUpInside)
            cell.Mothbutton.layer.cornerRadius = 5.0

        }
        
        
       
        return cell
        
        
    }
    
    
    @objc func connectLoyality(sender: UIButton)
    {
        
      
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
    }
    
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.view.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
        
    }
    func LoyalityBonusscreenfinlavalue()
    {
        self.showSpinner()
        let defaulst = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
        else
        {
            self.useridbiling = "127"
        }
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postStringfinlavalue =  String(format: "method=%@&userid=%@","LoyaltyBonus",self.useridbiling)
        print(postStringfinlavalue)
        request.httpBody = postStringfinlavalue.data(using: .utf8)
       request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                self.removeSpinner()

                print(response.result)
                
                if let dict1array:NSArray = response.result.value as? NSArray {
                    print(dict1array)
                    
                    self.mothstring = dict1array.value(forKey:"month")as![String]
                    self.Earnedbonustring = dict1array.value(forKey:"earner_bonus")as![String]

                    self.cashbackstring = dict1array.value(forKey:"taget")as![String]
                    self.totalrupessstring = dict1array.value(forKey:"achieved")as![String]

                    self.percentage = dict1array.value(forKey:"bouns")as![String]
                    
                    DispatchQueue.main.async
                        {
                        self.Loyalitybonustabelview.reloadData()
                     }
                }
                break
            case .failure(_):
                print(response.result)

                break
            }
        }
    }

    
}
