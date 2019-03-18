//
//  orderSelectionVC.swift
//  AgentRestocks
//
//  Created by apple on 12/17/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class orderSelectionVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var lblOrder: UILabel!
    
    @IBOutlet weak var lblOrderNo: UILabel!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var addBtnView: UIView!
    
    @IBOutlet weak var lblTraderName: UILabel!
    
    @IBOutlet weak var lblTypeofTrader: UILabel!
    
    @IBOutlet weak var lblStoreName: UILabel!
    
    @IBOutlet weak var lblDestinationStore: UILabel!
    
    @IBOutlet weak var lblFulfilledbyTrader: UILabel!
    
    @IBOutlet weak var orderNoWithDate: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblItems: UILabel!
    
    @IBOutlet weak var lblQnty: UILabel!
    
    @IBOutlet weak var tableList: UITableView!
    
    @IBOutlet weak var lblTotalPrice: UILabel!
    
    @IBOutlet weak var lblPreferedTime: UILabel!
    
    @IBOutlet weak var lblSubTotalPrice: UILabel!
    
    @IBOutlet weak var lblWalletPrice: UILabel!
    
    @IBOutlet weak var lblGTotalPrice: UILabel!
    
    
    var arrayList = [Any]()
    var listOfItems = [Any]()
    var listItemAmount = [Any]()
    var genderManer = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrayList = ["Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala"]
        listOfItems = ["4 Qty","4 Qty","4 Qty"]
        listItemAmount = ["₹900","₹900","₹900"]
        genderManer = []
        

        self.addBtnView.layer.borderColor = UIColor.lightGray.cgColor
        self.addBtnView.layer.borderWidth = 1.0
        self.addBtnView.layer.cornerRadius = 4.0
//        self.addBtnView.dropShadow1()
        self.addBtnView.dropShadow()
        
        //self.topView.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        
        topView.layer.shadowOffset = CGSize(width: 0, height: 3)
        topView.layer.shadowOpacity = 0.6
        topView.layer.shadowRadius = 3.0
        topView.layer.shadowColor = UIColor.color2().cgColor

    }
    

    @IBAction func btnBackAction(_ sender: Any) {
    
        self.dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func btnMenuAction(_ sender: UIButton) {
        let btn = sender
    
        if btn.isSelected  {
            self.addBtnView.isHidden = true
            btn.isSelected = false

        }else{
            self.addBtnView.isHidden = false
            btn.isSelected = true
        }
    }
    

    @IBAction func btnCancelAction(_ sender: Any) {
   
        self.addBtnView.isHidden = true

    }
    
    @IBAction func btnHelpAction(_ sender: Any) {
    
        self.addBtnView.isHidden = true

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: orderCellSelection = tableList.dequeueReusableCell(withIdentifier: "orderCellSelection") as! orderCellSelection
        cell.lblProductName.text = self.arrayList[indexPath.row] as? String
        cell.lblPrice.text = self.listItemAmount[indexPath.row] as? String
        cell.lblQnty.text = self.listOfItems[indexPath.row] as? String
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let selectItemRemove = self.storyboard?.instantiateViewController(withIdentifier: "orderSelectReturnVC") as! orderSelectReturnVC
        self.present(selectItemRemove, animated: true, completion: nil)
        
    }
}
