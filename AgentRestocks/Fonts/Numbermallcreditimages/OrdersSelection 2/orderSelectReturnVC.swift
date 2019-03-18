//
//  orderSelectReturnVC.swift
//  AgentRestocks
//
//  Created by apple on 12/20/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class orderSelectReturnVC: UIViewController, UITableViewDataSource, UITableViewDelegate , UIScrollViewDelegate {
    
    

    @IBOutlet weak var lblSelected: UILabel!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var modelView: UIView!
   
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var lblTraderName: UILabel!
    @IBOutlet weak var lblTypeTrader: UILabel!
    
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblDeliveryAddress: UILabel!
    
    @IBOutlet weak var lblFullfillDeliveryPartner: UILabel!
    
    @IBOutlet weak var lblOrderNoandTime: UILabel!
    
    @IBOutlet weak var lblOrdPrice: UILabel!
    
    @IBOutlet weak var lblOrdItem: UILabel!
    @IBOutlet weak var lblQnty: UILabel!
    
    @IBOutlet weak var lblOrderDetails: UILabel!
    @IBOutlet weak var tableList: UITableView!
    
    @IBOutlet weak var lblSubTotalAmount: UILabel!
    
    @IBOutlet weak var lblWalletAmount: UILabel!
    
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    @IBOutlet weak var lblCashOnDeliveryAmounr: UILabel!
    
    @IBOutlet weak var lblPreferedDeliveryTime: UILabel!
    
    @IBOutlet weak var btnSelectOrderCancel: UIButton!
    
    var arrayList = [Any]()
    var listOfItems = [Any]()
    var listItemAmount = [Any]()
    var selectedIndex = [Any]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        arrayList = ["Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala"]
        listOfItems = ["4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty"]
        listItemAmount = ["₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900","₹900"]
        
        scrollView.delegate = self
        
        
    }
    

    @IBAction func btnSelectedAllAction(_ sender: Any) {
    
    
    }
    
    
    @IBAction func btnBackAction(_ sender: Any) {
  
    self.dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func btnSelectItemAction(_ sender: Any) {
  
    let selectOrder = self.storyboard?.instantiateViewController(withIdentifier: "selectedOrderVC") as! selectedOrderVC
    self.present(selectOrder, animated: true, completion: nil)
    }
    
    @IBAction func btnSelectDeliveryAction(_ sender: Any) {
    
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == tableList
        {
            return arrayList.count

        }
        else
        {
            return arrayList.count

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: orderSelectReturnCell = tableList.dequeueReusableCell(withIdentifier: "orderSelectReturnCell") as! orderSelectReturnCell
        cell.lblProductName.text = self.arrayList[indexPath.row] as? String
        cell.lblPriceOfOrder.text = self.listItemAmount[indexPath.row] as? String
        cell.lblSelectQnty.text = self.listOfItems[indexPath.row] as? String
        cell.btnOrderSelectReturnAct.tag = indexPath.row
        cell.btnOrderSelectReturnAct.addTarget(self, action: #selector(orderSelectValue), for: .touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell: orderSelectReturnCell = tableList.dequeueReusableCell(withIdentifier: "orderSelectReturnCell") as! orderSelectReturnCell
        cell.btnOrderSelectReturnAct.tag = indexPath.row
      
        
    }
    
    @objc func orderSelectValue(sender: UIButton) {
        
        let btn = sender
        selectedIndex = [btn.tag]
        
        if btn.isSelected{
            btn.setImage(#imageLiteral(resourceName: "Multiselectionsquare"), for: .normal)
            btn.isSelected = false
            self.btnSelectOrderCancel.setTitle("Select items to Cancel", for: .normal)
        }else{
            btn.setImage(#imageLiteral(resourceName: "verification-square-button"), for: .normal)
            btn.isSelected = true
            self.btnSelectOrderCancel.setTitle("Cancel this Order", for: .normal)
        }
    }
}
