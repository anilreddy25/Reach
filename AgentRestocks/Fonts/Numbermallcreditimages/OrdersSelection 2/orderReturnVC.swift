//
//  orderReturnVC.swift
//  AgentRestocks
//
//  Created by apple on 12/18/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class orderReturnVC: UIViewController, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource
{
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var lblOrder: UILabel!
    @IBOutlet weak var lblOrderNo: UILabel!
    @IBOutlet weak var lblDistributorName: UILabel!
    @IBOutlet weak var lblDistributortype: UILabel!
    @IBOutlet weak var btnDeliveryAddress: UIButton!
    @IBOutlet weak var addMenuView: UIView!
    @IBOutlet weak var lblReceiverName: UILabel!
    @IBOutlet weak var lblReceiverAddress: UILabel!
    @IBOutlet weak var lblFullfillPartner: UILabel!
    @IBOutlet weak var lblDeliveryName: UILabel!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblOrderNoandDate: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblItems: UILabel!
    @IBOutlet weak var lblQntyOfOrder: UILabel!
    @IBOutlet weak var btnTickMark: UIButton!
    @IBOutlet weak var btnRecyclic: UIButton!
 
    @IBOutlet weak var lblReturnreqDT: UILabel!
    
    
    @IBOutlet weak var lblReturnPickupTime: UILabel!
    
    
    @IBOutlet weak var lblReturnProcessedTime: UILabel!
    
    
    @IBOutlet weak var tableList: UITableView!
    @IBOutlet weak var lblSubtotal: UILabel!
    @IBOutlet weak var lblHandlingAmount: UILabel!
    @IBOutlet weak var lblGSTAmount: UILabel!
    @IBOutlet weak var lblCBAmount: UILabel!
    @IBOutlet weak var lblPromoAmount: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var lblNMCreditAmount: UILabel!
    @IBOutlet weak var lblUPIAmount: UILabel!
    var arrayList = [Any]()
    var listOfItems = [Any]()
    var listItemAmount = [Any]()
    @IBOutlet weak var Returnthisitem: UIButton!
    @IBOutlet weak var ordermidelview: UIView!
    @IBOutlet weak var myscrollview: UIScrollView!
    @IBOutlet weak var orderreturnmiddelview: UIView!
    @IBOutlet weak var orderreturntabelview: UITableView!
    @IBOutlet weak var cancelbutton: UIButton!
    @IBOutlet weak var returningviewtwo: UIView!
    var Langagefinalstring = [String]()
    var selectimagestring = [UIImage]()
    var selectedIndex :Int?
    
    
    @IBOutlet weak var returingbottomview: UIView!
    
    @IBOutlet weak var preferabelTimingsview: UIView!
    
    @IBOutlet weak var preferabelbottomview: UIView!
    
    @IBOutlet weak var prferabelbototmview: UIView!
    
    @IBOutlet weak var prefreabelscrolingbototmview: UIView!
    
    
    @IBOutlet weak var preferabelpickerview: UIPickerView!
    
    
    var pickerData: [String] = [String]()

    
    @IBOutlet weak var selectpickerview: UIView!
    
    
    
    
    @IBOutlet weak var preferbaletimingview: UIView!
    
    
    @IBOutlet weak var preferabeltiminglabel: UILabel!
    
    
    @IBOutlet weak var orderTimingview: UIView!
    
    @IBOutlet weak var orderTiminglabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        arrayList = ["Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala"]
        listOfItems = ["4 Qty","4 Qty","4 Qty","4 Qty","4 Qty","4 Qty"]
        listItemAmount = ["₹900","₹900","₹900","₹900","₹900","₹900"]
      scrollView.delegate = self
//        middleView.addSubview(scrollView)
        
        if self.view.frame.size.height < 850
        {
            scrollView.contentInset = UIEdgeInsetsMake(0, 0,1800, 0)
            scrollView.isScrollEnabled = true
            scrollView.showsVerticalScrollIndicator = false
        }
        self.addMenuView.layer.cornerRadius = 4.0
        addMenuView.dropShadow1()
        
        topView.layer.shadowOffset = CGSize(width: 0, height: 3)
        topView.layer.shadowOpacity = 0.6
        topView.layer.shadowRadius = 3.0
        topView.layer.shadowColor = UIColor.color2().cgColor
        
        self.ordermidelview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.ordermidelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
        
        self.orderreturnmiddelview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.orderreturnmiddelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
        
        
        Langagefinalstring  = ["Delay in delivery","Trying out NumberMall","Prices are high","Don’t need these items any more","Bought from another supplier","₹ Items quantity mismatch","Items mismatch","Items damaged","Can’t find the packets","others"]
        selectimagestring = [#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark")]
        
        self.orderreturntabelview.dataSource = self
        self.orderreturntabelview.delegate = self
        
        self.orderreturnmiddelview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.orderreturnmiddelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
         self.orderreturntabelview.showsHorizontalScrollIndicator = false
         self.orderreturntabelview.showsVerticalScrollIndicator = false
        
        
        self.preferabelpickerview.delegate = self
        self.preferabelpickerview.dataSource = self
        pickerData = ["9.00 AM - 1.00 PM", "1.00 PM - 5.00 PM", "5.00 PM - 8.00 PM"]
     
        self.prferabelbototmview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.prferabelbototmview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.selectpickerview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
        
//
//        @IBOutlet weak var preferbaletimingview: UIView!
//
//
//        @IBOutlet weak var preferabeltiminglabel: UILabel!
//
//
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        
        preferbaletimingview.addGestureRecognizer(tap)
        
        preferbaletimingview.isUserInteractionEnabled = true
        
        let taptwo = UITapGestureRecognizer(target: self, action: #selector(self.handleTaptwo(_:)))
        
        orderTimingview.addGestureRecognizer(taptwo)
        
        orderTimingview.isUserInteractionEnabled = true
        
        

    }
    @objc func handleTap(_ sender: UITapGestureRecognizer)
    {
        self.preferbaletimingview.isHidden = false
    }
    
    @objc func handleTaptwo(_ sender: UITapGestureRecognizer)
    {
        self.orderTimingview.isHidden = false
    }
 
    @IBAction func btnOrderMenu(_ sender: UIButton)
    {
        let btn = sender
        if btn.isSelected
        {
            self.addMenuView.isHidden = true
            btn.isSelected = false
        }
        else
        {
            self.addMenuView.isHidden = false
            btn.isSelected = true
        }
    }
    @IBAction func btnBackAction(_ sender: Any)
    {
    self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnHandlingChargeAction(_ sender: UIButton)
    {
       let handlingCharge = self.storyboard?.instantiateViewController(withIdentifier:"HandlingChargeVC") as! HandlingChargeVC
      self.present(handlingCharge, animated: true, completion: nil)
    }
    @IBAction func btnTaxBreakUpAction(_ sender: UIButton)
    {
    let taxBreak = self.storyboard?.instantiateViewController(withIdentifier:"taxBreakupVC") as! taxBreakupVC
        self.present(taxBreak, animated: true, completion: nil)
    }
    @IBAction func btnCBAction(_ sender: Any)
    {
           let cashBack = self.storyboard?.instantiateViewController(withIdentifier:"cashBackItemVC") as! cashBackItemVC
        self.present(cashBack, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == tableList
        {
            return arrayList.count
        }
        else
        {
            return Langagefinalstring.count

        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == tableList
        {
            let cell: orderReturnCell = tableList.dequeueReusableCell(withIdentifier: "orderReturnCell") as! orderReturnCell
            cell.lblProductName.text = self.arrayList[indexPath.row] as? String
            cell.lblPrice.text = self.listItemAmount[indexPath.row] as? String
            cell.lblQnty.text = self.listOfItems[indexPath.row] as? String
            cell.selectionStyle = .none
            return cell
        }
       else
        {
            let cell  = orderreturntabelview.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as! LanguageTableViewCell
            cell.Langagelabael.text = self.Langagefinalstring[indexPath.row]
            cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2
            cell.selectionStyle = .none

            if self.Langagefinalstring.count-1 == indexPath.row
            {
                cell.langaeviewtwo.isHidden = true
            }
            else{
                cell.langaeviewtwo.isHidden = false
            }
            
            if selectedIndex == nil
            {
                if indexPath.row == 0
                {
                    cell.imagefinal.isHidden = false
                    
                    cell.LAngageviewone.backgroundColor = UIColor.color2()
                    cell.langaeviewtwo.backgroundColor = UIColor.color2()
                    cell.Langagelabael.textColor = UIColor.black
                    cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2
                    cell.imagefinal.image = #imageLiteral(resourceName: "TickMark")
                    cell.LAngageviewone.isHidden = true
                    
                }
            }
                
            else
            {
                if indexPath.row == selectedIndex
                {
                    cell.imagefinal.isHidden = false
                    
                    cell.LAngageviewone.backgroundColor = UIColor.color2()
                    cell.langaeviewtwo.backgroundColor = UIColor.color2()
                    cell.Langagelabael.textColor = UIColor.black
                    cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2
                    cell.imagefinal.image = #imageLiteral(resourceName: "TickMark")
                    cell.LAngageviewone.isHidden = true
                    
                }
                else{
                    
                    cell.LAngageviewone.backgroundColor = UIColor.color2()
                    cell.langaeviewtwo.backgroundColor = UIColor.color2()
                    cell.Langagelabael.textColor = UIColor.black
                    cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2
                    cell.imagefinal.isHidden = true
                    cell.LAngageviewone.isHidden = false
                    
                    
                    
                }
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == orderreturntabelview
        {
            return 50
        }
        else
        {
            return 50
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == orderreturntabelview
        {
            selectedIndex = indexPath.item
            orderreturntabelview.reloadData()
        }
    }
    
    @IBAction func btnDeliveryAddresAction(_ sender: Any)
    {
    
    }
    
    @IBAction func Returnthisitem(_ sender: UIButton)
    {
        self.myscrollview.isHidden = false

    }
    @IBAction func Nobutton(_ sender: UIButton)
    {
        self.myscrollview.isHidden = true
        self.returningviewtwo.isHidden = true
    }
    @IBAction func yesbutton(_ sender: UIButton)
    {
        self.myscrollview.isHidden = true
        self.returningviewtwo.isHidden = false
    }
    
    @IBAction func Cancelbutton(_ sender: UIButton)
    {
        self.returningviewtwo.isHidden = true
        self.myscrollview.isHidden = true


    }
    @IBAction func ReturnorderNobutton(_ sender: UIButton)
    {
        self.returningviewtwo.isHidden = true
        self.myscrollview.isHidden = true
    }
    @IBAction func Returnorderconfirmbutton(_ sender: UIButton)
    {
        self.returningviewtwo.isHidden = true
        self.myscrollview.isHidden = true
    }

    
    
    
    @IBAction func preferabelcancel(_ sender: UIButton)
    {
        self.orderTimingview.isHidden = true
    }
    
    @IBAction func preferabelcancelbuton(_ sender: UIButton)
    {
        self.orderTimingview.isHidden = true
    }
    @IBAction func Mypreferabelokbutton(_ sender: UIButton)
    {
        self.orderTimingview.isHidden = true
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
//        lblanotherQnty.text = pickerData[row]
        preferabelpickerview.selectRow(row, inComponent:0, animated: true)
        return pickerData[row] as String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.preferabeltiminglabel.text = pickerData[row]

        preferabelpickerview.reloadAllComponents()
    }
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
//    {
//        var label:UILabel
//        if let v = view as? UILabel
//        {
//            label = v
//        }
//        else
//        {
//            label = UILabel()
//        }
//        label.textColor = UIColor.yellow
//        label.textAlignment = .center
//        label.font = UIFont(name: "Arial", size:14.5)
//        
//        label.text = pickerData[row]
//        
//        return label
//    }
}
