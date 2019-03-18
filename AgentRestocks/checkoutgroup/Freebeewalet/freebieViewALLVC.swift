//
//  freebieViewALLVC.swift
//  AgentRestocks
//
//  Created by apple on 2/8/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class freebieViewALLVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableList: UITableView!
     var listOfFreebies = NSArray()
    var listavalFreebies = NSArray()

    var detailDictList = [String: Any]()
    var sellertext1 = String()
    var sellertext2 = String()
    var sellertext4 = String()
    var sellerStatus = String()
    
    var detailSellertext1 = [String]()
    var detailSellertext2 = [String]()
    var detailSellertext4 = [String]()
    var detailSellerStatus = [String]()
    
    
    var detailAvalList = [String: Any]()
    var couptext = String()
    var coupSelectedtext = [String]()

    @IBOutlet weak var viewtopview: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(listOfFreebies)
        
        tableList.delegate = self
        tableList.dataSource = self
        
            for i in 0 ..< self.listOfFreebies.count {
                
                if let valedDict: [String: Any] = self.listOfFreebies[i] as? [String: Any] {
                    self.detailDictList = valedDict
                }
                if let valedText: String  =  self.detailDictList["text1"] as? String {
                    self.sellertext1 = valedText
                }
                self.detailSellertext1.append(self.sellertext1)
                
                if let valedText: String  =  self.detailDictList["text2"] as? String {
                    self.sellertext2 = valedText
                }
                self.detailSellertext2.append(self.sellertext2)
                
                if let valedText: String  =  self.detailDictList["text4"] as? String {
                    self.sellertext4 = valedText
                }
                self.detailSellertext4.append(self.sellertext4)
                
                if let valedStatus: String  =  self.detailDictList["openstatus"] as? String {
                    self.sellerStatus = valedStatus
                }
                self.detailSellerStatus.append(self.sellerStatus)
            }
        
        for i in 0 ..< self.listavalFreebies.count {
            
            if let valedDict: [String: Any] = self.listavalFreebies[i] as? [String: Any] {
                self.detailAvalList = valedDict
            }
            if let valedText: String  =  self.detailAvalList["card_text"] as? String {
                self.couptext = valedText
            }
            self.coupSelectedtext.append(self.couptext)
        }
        
        
        viewtopview.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewtopview.layer.shadowOpacity = 0.6
        viewtopview.layer.shadowRadius = 3.0
        viewtopview.layer.shadowColor = UIColor.color2().cgColor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfFreebies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: freebieCellAgent = (tableList.dequeueReusableCell(withIdentifier: "freebieCellAgent") as? freebieCellAgent)!
        cell.lblOwnVal.text = self.detailSellertext1[indexPath.row]
        cell.lblCbAmount.text = self.detailSellertext2[indexPath.row]
        cell.lblWalletDate.text = self.detailSellertext4[indexPath.row]
        if let strStatus: String = self.detailSellerStatus[indexPath.row] as? String {
            self.sellerStatus = strStatus
        }
        
        cell.selectionStyle = .none
        if self.sellerStatus == "" {
            cell.btnScratch.setBackgroundImage(UIImage(named: "Bowl.png"), for: .normal)
            
        }else{
            cell.btnScratch.setBackgroundImage(UIImage(named: "bowlscrenen.png"), for: .normal)
            cell.btnScratch.addTarget(self, action: #selector(btnScratchCardAction), for: .touchUpInside)
            cell.btnScratch.tag = indexPath.row
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell: freebieCellAgent = (tableList.dequeueReusableCell(withIdentifier: "freebieCellAgent") as? freebieCellAgent)!
        
        if let strStatus: String = self.detailSellerStatus[indexPath.row] as? String {
            self.sellerStatus = strStatus
        }
        
        cell.selectionStyle = .none
        if self.sellerStatus == "" {
            cell.btnScratch.setBackgroundImage(UIImage(named: "Bowl.png"), for: .normal)
            cell.selectionStyle = .none

        }else{
            cell.btnScratch.setBackgroundImage(UIImage(named: "bowlscrenen.png"), for: .normal)
            cell.btnScratch.addTarget(self, action: #selector(btnScratchCardAction), for: .touchUpInside)
            cell.btnScratch.tag = indexPath.row
            
            let ViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"ViewController") as! ViewController
            self.addChildViewController(ViewControllerfinal)
            ViewControllerfinal.view.frame = self.view.frame
//            ViewControllerfinal.arrayValueText = self.coupSelectedtext
            self.view.addSubview(ViewControllerfinal.view)
            ViewControllerfinal.didMove(toParentViewController: self)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    @IBAction func btnBackAction(_ sender: Any) {
  
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func btnScratchCardAction (sender: UIButton) {
        let btnTag = sender
    
        let ViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"ViewController") as! ViewController
        self.addChildViewController(ViewControllerfinal)
        ViewControllerfinal.view.frame = self.view.frame
        self.view.addSubview(ViewControllerfinal.view)
        ViewControllerfinal.didMove(toParentViewController: self)
       
    
        DispatchQueue.main.async {
         self.tableList.reloadData()
        }
    
    }
    
}
