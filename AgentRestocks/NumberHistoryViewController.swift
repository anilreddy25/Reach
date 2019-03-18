//
//  NumberHistoryViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 18/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class NumberHistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var tabelview: UITableView!
    
    var paid_array = [paid]()
    
    
    @IBOutlet weak var popview: UIView!
    
    
    @IBOutlet weak var searchbutton: UIButton!
    
    @IBOutlet weak var filterbutton: UIButton!
    
    
    @IBOutlet weak var sharebutton: UIButton!
    @IBOutlet weak var morebutton: UIButton!
    var coverView = UIView()
    var imageView = UIImageView()
    
    var useridbilingfinalvalue = String()
     var Myauthorisationstringfinalvalue = String()
    var myagentTotalvalue = String()
    
    
    var historyarray = NSArray()
    var historyDict = [String: Any]()
    
    var strDateHist = String()
    var historyarrayDate = [String]()
    
    var datewisearrayfinal = NSArray()
    
  ///  var datewiseTotalDictfinal = [String: Any]()
    
    var datewiseTotalDictfinal = NSArray()
    var datewiseDictfinal = [String: Any]()
    var valueSection = Int()

    var strTimeHIST = String()
    var datewisearrayTime = [String]()
    var struseHIST = String()
    var datewiseused = [String]()
    var strTextHIST = String()
    var datewisetext = [String]()
    var strOrderHIST = String()
    var datewiseorderid = [String]()
    var strText1HIST = String()
    var datewisetext1 = [String]()
    var strText2HIST = String()
    var datewisetext2 = [String]()
    var datewisetext3 = [String]()
    
    var strFinalAMoHIST = String()
    var datewisefinalamount = [String]()
    var strClosingHIST = String()
    var datewisefinalclosingbal = [String]()

    var arrayDateWise = [Any]()
    var datwisearrayfinalvalue  = [Any]()
    var valueSec = [Any]()
    var AcessTokenfinalstring = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Topview.dropShadow()
        self.tabelview.dataSource = self
        self.tabelview.delegate = self
        self.searchbutton.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        self.filterbutton.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        self.sharebutton.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        self.popview.layer.cornerRadius = 4.0
        
        self.tabelview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:))))
        DispatchQueue.main.async
        {
            self.numebrmallcreditHistory()
        }
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer)
    {
         self.popview.isHidden = true
    }
    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    @IBOutlet weak var Topview: UIView!
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return self.historyarray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let tempDic:[String:AnyObject] = historyarray[section] as! [String : AnyObject]
        let tempAry:NSArray = tempDic["datewise"] as! NSArray
        return tempAry.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell  = tableView.dequeueReusableCell(withIdentifier:"creditcardTableViewCell", for: indexPath) as! creditcardTableViewCell
        cell.selectionStyle = .none
        let tempDic:[String:AnyObject] = historyarray[indexPath.section] as! [String : AnyObject]
        let tempAry:NSArray = tempDic["datewise"] as! NSArray
        let tempSubDic:[String:String] = tempAry[indexPath.row] as! [String : String]
        cell.creditcardusedfor.text = tempSubDic["text"]
        cell.timinglabel.text =  tempSubDic["time"]
        cell.rupeeslabel.text =  tempSubDic["finalamount"]
        cell.ClosingBalance.text = tempSubDic["closingbal"]
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        let tempDic:[String:AnyObject] = historyarray[section] as! [String : AnyObject]
        let titelString:String = tempDic["date"] as! String
        return titelString
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 50.0
    }
    @IBAction func Menubutton(_ sender: UIButton)
    {
        if morebutton.tag == 0
        {
            popview.isHidden = false
            morebutton.tag = 1
        }
        else if morebutton.tag == 1
        
        {
            popview.isHidden = true

            morebutton.tag = 0

        }
    }
    @IBAction func searchbutton(_ sender: UIButton) {
    }
    @IBAction func filterbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
        {
            let FilterViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"FilterViewController") as! FilterViewController
            self.present(FilterViewControllerfinal, animated:true, completion:nil)
        }
    }
    @IBAction func sahrebutton(_ sender: UIButton)
    {
        let secondViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"secondViewController") as! secondViewController
        self.addChildViewController(secondViewControllerfinal)
        secondViewControllerfinal.view.frame = CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(secondViewControllerfinal.view)
        secondViewControllerfinal.didMove(toParentViewController: self)
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
    func numebrmallcreditHistory()
    {
        self.showSpinner()
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "Myuseridfinaltwovalue")as?String
        {
            self.useridbilingfinalvalue = Reviewfinaluseroid
        }
        let defaulst = UserDefaults.standard

        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&userid=%@","DPCreditHistory",self.useridbilingfinalvalue)
         print(postString)
        request.httpBody = postString.data(using: .utf8)
        request.addValue(self.AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    self.historyarray = dict.value(forKey:"history")as!NSArray
                    for i in 0 ..<  self.historyarray.count
                    {
                        if let dictOFVal: [String: Any] = self.historyarray[i] as? [String: Any]
                        {
                            self.historyDict = dictOFVal
                        }
                        if let valDate: String = self.historyDict["date"] as? String
                        {
                            self.strDateHist = valDate
                        }
                        self.historyarrayDate.append(self.strDateHist)
                        
                        if let arrayDaeWis: [Any] = self.historyDict["datewise"] as? [Any]{
                            self.arrayDateWise = arrayDaeWis
                        }
                        self.datwisearrayfinalvalue.append(self.arrayDateWise)
                        for j in 0 ..< self.datwisearrayfinalvalue.count
                        {
                            if let dictofHistyr:NSArray = self.datwisearrayfinalvalue[j] as? NSArray
                            {
                                self.datewiseTotalDictfinal = dictofHistyr
                            }
                        }
                            if let stringTimeHist: [String] = self.datewiseTotalDictfinal.value(forKey:"time") as? [String]
                            {
                                self.datewisearrayTime = stringTimeHist
                            }

                            if let stringUsedHist: [String] = self.datewiseTotalDictfinal.value(forKey: "used") as? [String]
                            {
                                self.datewiseused = stringUsedHist
                           }

                            if let stringTextHist: [String] = self.datewiseTotalDictfinal.value(forKey: "text") as? [String]
                            {
                                self.datewisetext = stringTextHist
                            }
                            if let stringordertHist: [String] = self.datewiseTotalDictfinal.value(forKey: "orderid") as? [String]
                            {
                                self.datewiseorderid = stringordertHist
                            }
                            if let stringTexHist: [String] = self.datewiseTotalDictfinal.value(forKey: "text1") as? [String]  {
                                self.datewisetext1 = stringTexHist
                            }
                        
                            if let stringTex2Hist: [String] = self.datewiseTotalDictfinal.value(forKey: "text2") as? [String]
                            {
                                self.datewisetext2 = stringTex2Hist
                            }

                            if let stringfinalamountFinal: [String] = self.datewiseTotalDictfinal.value(forKey: "finalamount") as? [String]  {
                                self.datewisefinalamount = stringfinalamountFinal
                            }
                        
                            if let stringclosingbaltFinal: [String] = self.datewiseTotalDictfinal.value(forKey: "closingbal") as? [String]  {
                                self.datewisefinalclosingbal = stringclosingbaltFinal
                            }
                    }
                 
                    DispatchQueue.main.async
                        {
                        self.tabelview.reloadData()
                    }
                    DispatchQueue.main.async
                    {
                        self.removeSpinner()
                    }

                }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    self.removeSpinner()
                    
                }
                break
            }
        }
    }
    
}
