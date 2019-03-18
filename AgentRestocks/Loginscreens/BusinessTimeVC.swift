//
//  BusinessTimeVC.swift
//  AgentRestocks
//
//  Created by apple on 9/21/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire

class BusinessTimeVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate
{
    @IBOutlet weak var selectBusinessTie: UIView!
    @IBOutlet weak var businessTimeView: UIView!
    @IBOutlet weak var headerDayView: UIView!
    @IBOutlet weak var lblBusinesshours: UILabel!
    
    @IBOutlet weak var tableList: UITableView!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var lblDayofSelect: UILabel!
    
    @IBOutlet weak var select1Time: UIView!
    
    var arrayDaysOfDic:[[String:Any]] = [[String:Any]]()
    var selectedRow: Int = 0
    var useridbiling = String()
    var Myauthorisationstringfinalvalue = String()
    var myagentTotalvalue = String()
    var businessCategType = [Any]()
    var dictBusinessCateg = [String: Any]()
    var businessCategVal = String()
    var dictOFBusinessHours = [String: Any]()
    var actuallyBusinessHours = [Any]()
    var manualBusinessHours = [String: Any]()
    var dailyaryBusinessHours = [Any]()
    var dictOfDailyTime = [String: Any]()
    var dayDetailsInString = String()
    var daysArrayBusiness = [Any]()
    
    var dayOfStartFirst = String()
    var daysArrayStartFirst = [Any]()
    var dayOfStartSecond = String()
    var daysArrayStartSecond = [Any]()
    var dayOfStartThird = String()
    var daysArrayStartThird = [Any]()
    var dayOfStartFourth = String()
    var daysArrayStartFourth = [Any]()
    
    var arraySetTimeFirst = [String]()
    var arraySetTimeTwo = [Any]()
    
    var arrayOneTime = [Any]()
    
    var dayOfEndFirst = String()
    var daysArrayEndFirst = [Any]()
    var dayOfEndSecond = String()
    var daysArrayEndSecond = [Any]()
    var dayOfEndThird = String()
    var daysArrayEndThird = [Any]()
    var dayOfEndFourth = String()
    var daysArrayEndFourth = [Any]()
    var stringOfOcca = String()
    var valueOfOccasion = [Any]()
    var stringNote = String()
    var valueOFNote = [Any]()
    
    var strOneTime = String()
    var strTwoTime = String()
    var strThreTime = String()
    var strFourTime = String()
    var endOneTime = String()
    var endTwoTime = String()
    var endThreTime = String()
    var endFourTime = String()
    var fullCloseTimeVal = String()

    var selectedStr =  String()
    
    
    
    @IBOutlet weak var lblBwnTime: UILabel!
    @IBOutlet weak var viewTime: UIView!
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var btnMoreHours: UIButton!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var view2Time: UIView!
    
    @IBOutlet weak var viewBtn: UIView!
    
    @IBOutlet weak var viewBwnTime: UIView!
    
    @IBOutlet weak var datePicker2: UIDatePicker!
    
    @IBOutlet weak var btnOpen24hr: UIButton!
    
    @IBOutlet weak var btnHClose: UIButton!
    
    @IBOutlet weak var select2Time: UIView!
    
    let timeFormatter = DateFormatter()
    
    var dict = NSDictionary()
    
    @IBOutlet weak var settimeone: UIButton!
    
    @IBOutlet weak var settimetwo: UIButton!
    var selectedArrayOne = [Any]()
    var selectedArrayTwo = [Any]()
    var selectedTimeone = String()
    var selectedTimeTwo = String()
    var valOfDay = String()

    var opentwentyfour = String()
    var Closedstring = String()
    var updateDic = [String:Any]()
    var updateAry = [String]()
    var endtimeAry = [String]()
    
    var apendeed =  String()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableList.delegate = self
        tableList.dataSource = self
        selectBusinessTie.isHidden = true
      //  arrayDays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        arrayDaysOfDic = [["name":"Sunday","hours":[]],["name":"Monday","hours":[]],["name":"Tuesday","hours":[]],["name":"Wednesday","hours":[]],["name":"Thursday","hours":[]],["name":"Friday","hours":[]],["name":"Saturday","hours":[]]];
        self.tableList.tableFooterView = UIView()
        self.businessTimeView.isHidden = true
        self.viewTime.isHidden = true
        self.view2Time.isHidden = true
        self.select1Time.isHidden = true
        self.select2Time.isHidden = true
        self.tableList.showsVerticalScrollIndicator = true
        settimeone.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        settimetwo.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        updateAry = [dayOfStartFirst,dayOfStartSecond,dayOfStartThird,dayOfStartFourth]
        endtimeAry = [dayOfEndFirst,dayOfEndSecond, dayOfEndThird, dayOfEndFourth]
    
        DispatchQueue.main.async {
            self.editTimeDetails()
    
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysArrayBusiness.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        let cell : WeekDayCell = tableList.dequeueReusableCell(withIdentifier: "WeekDayCell") as! WeekDayCell
         updateDic = arrayDaysOfDic[indexPath.row]
         updateAry = updateDic["hours"] as! [String]

        cell.lblDays.tag = indexPath.row;
        cell.lblDays.text = self.daysArrayBusiness[indexPath.row] as? String
        cell.businessHoursLbl.tag = indexPath.row
        
         if updateAry.count > 0 {
         var titleStr = "";
         for str in updateAry {
         titleStr = "\(titleStr)" + " \n" + "\(str)"
         }
         let Str = titleStr
           fullCloseTimeVal = Str
         }
        strOneTime = (self.daysArrayStartFirst[indexPath.row] as? String)!
        strTwoTime = (self.daysArrayStartSecond[indexPath.row] as? String)!
        strThreTime = (self.daysArrayStartThird[indexPath.row] as? String)!
        strFourTime = (self.daysArrayStartFourth[indexPath.row] as? String)!
        
        endOneTime = (self.daysArrayEndFirst[indexPath.row] as? String)!
        endTwoTime = (self.daysArrayEndSecond[indexPath.row] as? String)!
        endThreTime = (self.daysArrayEndThird[indexPath.row] as? String)!
        endFourTime = (self.daysArrayEndFourth[indexPath.row] as? String)!
        

        arraySetTimeFirst = [strOneTime,strTwoTime,strThreTime,strFourTime]
        arraySetTimeTwo = [endOneTime,endTwoTime,endThreTime,endFourTime]

        fullCloseTimeVal = self.valueOFNote[indexPath.row] as! String
        
        
        if cell.lblDays.text == "Sunday" {
            
            if self.strOneTime == "" && self.strTwoTime == "" && self.strThreTime == "" && self.strFourTime == "" && self.endOneTime == "" && self.endTwoTime == "" && self.endThreTime == "" && self.endFourTime == "" && fullCloseTimeVal == "" {
                cell.businessHoursLbl.text = "Setup BusinessHours"
            }else{
                if self.strOneTime != "" || self.strTwoTime != "" || self.strThreTime != "" || self.strFourTime != "" || self.endOneTime != "" || self.endTwoTime != "" || self.endThreTime != "" || self.endFourTime != "" || self.fullCloseTimeVal == "" {
                    
                    cell.lblStrtOne.isHidden = false
                    cell.lblStrt2.isHidden = false
                    cell.lblStrt3.isHidden = false
                    cell.lblStrt4.isHidden = false
                    
                    cell.lblStrtOne.text = strOneTime
                    cell.lblStrt2.text = strTwoTime
                    cell.lblStrt3.text = strThreTime
                    cell.lblStrt4.text = strFourTime
                
                    cell.lblEndOne.isHidden = false
                    cell.lblEnd2.isHidden = false
                    cell.lblEnd3.isHidden = false
                    cell.lblEnd4.isHidden = false
                    
                    cell.lblEndOne.text = endOneTime
                    cell.lblEnd2.text = endTwoTime
                    cell.lblEnd3.text = endThreTime
                    cell.lblEnd4.text = endFourTime
                    cell.businessHoursLbl.isHidden = true
                 }
            if self.strOneTime == "" || self.strTwoTime == "" || self.strThreTime == "" || self.strFourTime == "" || self.endOneTime == "" || self.endTwoTime == "" || self.endThreTime == "" || self.endFourTime == "" || self.fullCloseTimeVal != "" {
                
                    cell.businessHoursLbl.text   = self.valueOFNote[indexPath.row] as? String
                }
            }
        }
        
        if cell.lblDays.text == "Monday" {
            
            if self.strOneTime == "" && self.strTwoTime == "" && self.strThreTime == "" && self.strFourTime == "" && self.endOneTime == "" && self.endTwoTime == "" && self.endThreTime == "" && self.endFourTime == "" && fullCloseTimeVal == "" {
                cell.businessHoursLbl.text = "Setup BusinessHours"
            }else{
                if self.strOneTime != "" || self.strTwoTime != "" || self.strThreTime != "" || self.strFourTime != "" || self.endOneTime != "" || self.endTwoTime != "" || self.endThreTime != "" || self.endFourTime != "" || self.fullCloseTimeVal == "" {
                    
                    cell.lblStrtOne.isHidden = false
                    cell.lblStrt2.isHidden = false
                    cell.lblStrt3.isHidden = false
                    cell.lblStrt4.isHidden = false
                    
                    cell.lblStrtOne.text = strOneTime
                    cell.lblStrt2.text = strTwoTime
                    cell.lblStrt3.text = strThreTime
                    cell.lblStrt4.text = strFourTime
                    
                    cell.lblEndOne.isHidden = false
                    cell.lblEnd2.isHidden = false
                    cell.lblEnd3.isHidden = false
                    cell.lblEnd4.isHidden = false
                    
                    cell.lblEndOne.text = endOneTime
                    cell.lblEnd2.text = endTwoTime
                    cell.lblEnd3.text = endThreTime
                    cell.lblEnd4.text = endFourTime
                    cell.businessHoursLbl.isHidden = true
                }
                if self.strOneTime == "" || self.strTwoTime == "" || self.strThreTime == "" || self.strFourTime == "" || self.endOneTime == "" || self.endTwoTime == "" || self.endThreTime == "" || self.endFourTime == "" || self.fullCloseTimeVal != "" {
                    
                    cell.businessHoursLbl.text   = self.valueOFNote[indexPath.row] as? String
                }
            }
        }
        if cell.lblDays.text == "Tuesday" {
            
            if self.strOneTime == "" && self.strTwoTime == "" && self.strThreTime == "" && self.strFourTime == "" && self.endOneTime == "" && self.endTwoTime == "" && self.endThreTime == "" && self.endFourTime == "" && fullCloseTimeVal == "" {
                cell.businessHoursLbl.text = "Setup BusinessHours"
            }else{
                if self.strOneTime != "" || self.strTwoTime != "" || self.strThreTime != "" || self.strFourTime != "" || self.endOneTime != "" || self.endTwoTime != "" || self.endThreTime != "" || self.endFourTime != "" || self.fullCloseTimeVal == "" {
                    
                    cell.lblStrtOne.isHidden = false
                    cell.lblStrt2.isHidden = false
                    cell.lblStrt3.isHidden = false
                    cell.lblStrt4.isHidden = false
                    
                    cell.lblStrtOne.text = strOneTime
                    cell.lblStrt2.text = strTwoTime
                    cell.lblStrt3.text = strThreTime
                    cell.lblStrt4.text = strFourTime
                    
                    cell.lblEndOne.isHidden = false
                    cell.lblEnd2.isHidden = false
                    cell.lblEnd3.isHidden = false
                    cell.lblEnd4.isHidden = false
                    
                    cell.lblEndOne.text = endOneTime
                    cell.lblEnd2.text = endTwoTime
                    cell.lblEnd3.text = endThreTime
                    cell.lblEnd4.text = endFourTime
                    cell.businessHoursLbl.isHidden = true
                }
                if self.strOneTime == "" || self.strTwoTime == "" || self.strThreTime == "" || self.strFourTime == "" || self.endOneTime == "" || self.endTwoTime == "" || self.endThreTime == "" || self.endFourTime == "" || self.fullCloseTimeVal != "" {
                    
                    cell.businessHoursLbl.text   = self.valueOFNote[indexPath.row] as? String
                }
            }
        }
        if cell.lblDays.text == "Wednesday" {
            
            if self.strOneTime == "" && self.strTwoTime == "" && self.strThreTime == "" && self.strFourTime == "" && self.endOneTime == "" && self.endTwoTime == "" && self.endThreTime == "" && self.endFourTime == "" && fullCloseTimeVal == "" {
                cell.businessHoursLbl.text = "Setup BusinessHours"
            }else{
                if self.strOneTime != "" || self.strTwoTime != "" || self.strThreTime != "" || self.strFourTime != "" || self.endOneTime != "" || self.endTwoTime != "" || self.endThreTime != "" || self.endFourTime != "" || self.fullCloseTimeVal == "" {
                    
                    cell.lblStrtOne.isHidden = false
                    cell.lblStrt2.isHidden = false
                    cell.lblStrt3.isHidden = false
                    cell.lblStrt4.isHidden = false
                    
                    cell.lblStrtOne.text = strOneTime
                    cell.lblStrt2.text = strTwoTime
                    cell.lblStrt3.text = strThreTime
                    cell.lblStrt4.text = strFourTime
                    
                    cell.lblEndOne.isHidden = false
                    cell.lblEnd2.isHidden = false
                    cell.lblEnd3.isHidden = false
                    cell.lblEnd4.isHidden = false
                    
                    cell.lblEndOne.text = endOneTime
                    cell.lblEnd2.text = endTwoTime
                    cell.lblEnd3.text = endThreTime
                    cell.lblEnd4.text = endFourTime
                    cell.businessHoursLbl.isHidden = true
                }
                if self.strOneTime == "" || self.strTwoTime == "" || self.strThreTime == "" || self.strFourTime == "" || self.endOneTime == "" || self.endTwoTime == "" || self.endThreTime == "" || self.endFourTime == "" || self.fullCloseTimeVal != "" {
                    
                    cell.businessHoursLbl.text   = self.valueOFNote[indexPath.row] as? String
                }
            }
        }
        
        if cell.lblDays.text == "Thursday" {
            
            if self.strOneTime == "" && self.strTwoTime == "" && self.strThreTime == "" && self.strFourTime == "" && self.endOneTime == "" && self.endTwoTime == "" && self.endThreTime == "" && self.endFourTime == "" && fullCloseTimeVal == "" {
                cell.businessHoursLbl.text = "Setup BusinessHours"
            }else{
                if self.strOneTime != "" || self.strTwoTime != "" || self.strThreTime != "" || self.strFourTime != "" || self.endOneTime != "" || self.endTwoTime != "" || self.endThreTime != "" || self.endFourTime != "" || self.fullCloseTimeVal == "" {
                    
                    cell.lblStrtOne.isHidden = false
                    cell.lblStrt2.isHidden = false
                    cell.lblStrt3.isHidden = false
                    cell.lblStrt4.isHidden = false
                    
                    cell.lblStrtOne.text = strOneTime
                    cell.lblStrt2.text = strTwoTime
                    cell.lblStrt3.text = strThreTime
                    cell.lblStrt4.text = strFourTime
                    
                    cell.lblEndOne.isHidden = false
                    cell.lblEnd2.isHidden = false
                    cell.lblEnd3.isHidden = false
                    cell.lblEnd4.isHidden = false
                    
                    cell.lblEndOne.text = endOneTime
                    cell.lblEnd2.text = endTwoTime
                    cell.lblEnd3.text = endThreTime
                    cell.lblEnd4.text = endFourTime
                    cell.businessHoursLbl.isHidden = true
                }
                if self.strOneTime == "" || self.strTwoTime == "" || self.strThreTime == "" || self.strFourTime == "" || self.endOneTime == "" || self.endTwoTime == "" || self.endThreTime == "" || self.endFourTime == "" || self.fullCloseTimeVal != "" {
                    
                    cell.businessHoursLbl.text   = self.valueOFNote[indexPath.row] as? String
                }
            }
        }
        
        if cell.lblDays.text == "Friday" {
            
            if self.strOneTime == "" && self.strTwoTime == "" && self.strThreTime == "" && self.strFourTime == "" && self.endOneTime == "" && self.endTwoTime == "" && self.endThreTime == "" && self.endFourTime == "" && fullCloseTimeVal == "" {
                cell.businessHoursLbl.text = "Setup BusinessHours"
            }else{
                if self.strOneTime != "" || self.strTwoTime != "" || self.strThreTime != "" || self.strFourTime != "" || self.endOneTime != "" || self.endTwoTime != "" || self.endThreTime != "" || self.endFourTime != "" || self.fullCloseTimeVal == "" {
                    
                    cell.lblStrtOne.isHidden = false
                    cell.lblStrt2.isHidden = false
                    cell.lblStrt3.isHidden = false
                    cell.lblStrt4.isHidden = false
                    
                    cell.lblStrtOne.text = strOneTime
                    cell.lblStrt2.text = strTwoTime
                    cell.lblStrt3.text = strThreTime
                    cell.lblStrt4.text = strFourTime
                    
                    cell.lblEndOne.isHidden = false
                    cell.lblEnd2.isHidden = false
                    cell.lblEnd3.isHidden = false
                    cell.lblEnd4.isHidden = false
                    
                    cell.lblEndOne.text = endOneTime
                    cell.lblEnd2.text = endTwoTime
                    cell.lblEnd3.text = endThreTime
                    cell.lblEnd4.text = endFourTime
                    cell.businessHoursLbl.isHidden = true
                }
                if self.strOneTime == "" || self.strTwoTime == "" || self.strThreTime == "" || self.strFourTime == "" || self.endOneTime == "" || self.endTwoTime == "" || self.endThreTime == "" || self.endFourTime == "" || self.fullCloseTimeVal != "" {
                    
                    cell.businessHoursLbl.text   = self.valueOFNote[indexPath.row] as? String
                }
            }
        }
        
        
        
        if cell.lblDays.text == "Saturday" {
            
            if self.strOneTime == "" && self.strTwoTime == "" && self.strThreTime == "" && self.strFourTime == "" && self.endOneTime == "" && self.endTwoTime == "" && self.endThreTime == "" && self.endFourTime == "" && fullCloseTimeVal == "" {
                cell.businessHoursLbl.text = "Setup BusinessHours"
            }else{
                if self.strOneTime != "" || self.strTwoTime != "" || self.strThreTime != "" || self.strFourTime != "" || self.endOneTime != "" || self.endTwoTime != "" || self.endThreTime != "" || self.endFourTime != "" || self.fullCloseTimeVal == "" {
                    
                    cell.lblStrtOne.isHidden = false
                    cell.lblStrt2.isHidden = false
                    cell.lblStrt3.isHidden = false
                    cell.lblStrt4.isHidden = false
                    
                    cell.lblStrtOne.text = strOneTime
                    cell.lblStrt2.text = strTwoTime
                    cell.lblStrt3.text = strThreTime
                    cell.lblStrt4.text = strFourTime
                    
                    cell.lblEndOne.isHidden = false
                    cell.lblEnd2.isHidden = false
                    cell.lblEnd3.isHidden = false
                    cell.lblEnd4.isHidden = false
                    
                    cell.lblEndOne.text = endOneTime
                    cell.lblEnd2.text = endTwoTime
                    cell.lblEnd3.text = endThreTime
                    cell.lblEnd4.text = endFourTime
                    cell.businessHoursLbl.isHidden = true
                }
                if self.strOneTime == "" || self.strTwoTime == "" || self.strThreTime == "" || self.strFourTime == "" || self.endOneTime == "" || self.endTwoTime == "" || self.endThreTime == "" || self.endFourTime == "" || self.fullCloseTimeVal != "" {
                    
                    cell.businessHoursLbl.text   = self.valueOFNote[indexPath.row] as? String
                }
            }
        }
        
        return cell
        }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        selectedRow = indexPath.row
        let cell : WeekDayCell = tableList.dequeueReusableCell(withIdentifier: "WeekDayCell") as! WeekDayCell
        // updateDic = dictOfDailyTime[selectedRow]
        cell.lblDays.text = self.daysArrayBusiness[indexPath.row] as? String
        lblDayofSelect.text = cell.lblDays.text
        lblBwnTime.isHidden = false
        settimeone.isHidden = false
        settimetwo.isHidden = false
        btnHClose.setBackgroundImage(UIImage(named: "check-box-empty"), for: .normal)
        btnOpen24hr.setBackgroundImage(UIImage(named: "check-box-empty"), for: .normal)
        self.selectBusinessTie.isHidden = false
        self.businessTimeView.isHidden = false
        self.selectedTimeone.removeAll()
        self.selectedTimeTwo.removeAll()
        self.opentwentyfour.removeAll()
        self.Closedstring.removeAll()
        self.tableList.reloadData()
        cell.selectionStyle = .none
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         
        if arraySetTimeFirst.count > 0 {
          return CGFloat(40 + 10 * (arraySetTimeFirst.count - 1))
            
        }
        
        if self.strOneTime == "" && self.strTwoTime == "" && self.strThreTime == "" && self.strFourTime == "" && self.endOneTime == "" && self.endTwoTime == "" && self.endThreTime == "" && self.endFourTime == "" && fullCloseTimeVal == "" {
            
            return 40
        }
        
        return 40
    }
    
    @objc func btnBusinessTime(sender: UIButton!) {
        selectedRow = sender.tag
        self.businessTimeView.isHidden = false
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short

        selectedTimeone = timeFormatter.string(from: sender.date)
        btnHClose.tag = 0
        btnOpen24hr.tag = 0

    }
    @objc func handleDatePicker2(sender: UIDatePicker) {
       
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        selectedTimeTwo = timeFormatter.string(from: sender.date)
        btnHClose.tag = 0
        btnOpen24hr.tag = 0
    }
    
    
    @IBAction func btnClosed(_ sender: Any) {

        self.businessTimeView.isHidden = true
        self.selectBusinessTie.isHidden = true
    
        selectedTimeone.removeAll()
        selectedTimeTwo.removeAll()
        
        settimetwo.setTitle("SetTime", for:.normal)
        settimeone.setTitle("SetTime", for:.normal)
        

    }
    
    @IBAction func btnCancel(_ sender: Any) {
        
        self.viewTime.isHidden = true
        self.view2Time.isHidden = true
        self.select1Time.isHidden = true
        self.select2Time.isHidden = true
        settimetwo.setTitle("SetTime", for:.normal)
        settimeone.setTitle("SetTime", for:.normal)
    }
    
    @IBAction func btnDone(_ sender: Any) {
        
        viewTime.isHidden = true
        select1Time.isHidden = true
        settimeone.setTitle(selectedTimeone, for:.normal)

    }
    
    
    @IBAction func btnDone2(_ sender: Any) {
        
        view2Time.isHidden = true
        select2Time.isHidden = true
        settimetwo.setTitle(selectedTimeTwo, for:.normal)

    }
    
    @IBAction func btnSaveAction(_ sender: UIButton) {
 
          //selectedRow = sender.tag
        
        if (selectedTimeone.characters.count) > 0 && (selectedTimeTwo.characters.count) > 0
          {
    
            self.businessTimeView.isHidden = true
            self.selectBusinessTie.isHidden = true
            
            updateDic = arrayDaysOfDic[selectedRow]
            
            btnOpen24hr.setBackgroundImage(UIImage(named: "check-box-empty"), for: .normal)
            btnHClose.setBackgroundImage(UIImage(named: "check-box-empty"), for: .normal)
            updateAry = updateDic["hours"] as! [String]
            updateAry.append("\(selectedTimeone) --\(selectedTimeTwo)")
            if updateAry.contains("Full Day") {
                updateAry.remove(at: 0)
            }
            if updateAry.contains("CLOSED") {
                updateAry.remove(at: 0)
            }
            
            
            updateDic.updateValue(updateAry, forKey: "hours")
            arrayDaysOfDic[selectedRow] = updateDic;
            
           
    
            arraySetTimeFirst = [selectedTimeone]
            arraySetTimeTwo = [selectedTimeTwo]

            if self.arraySetTimeFirst.count < 2 {
                if let Strval: String = "" {
                    self.arraySetTimeFirst.append(Strval)
                }
            }
            if self.arraySetTimeFirst.count < 3 {
                if let Strval: String = "" {
                    self.arraySetTimeFirst.append(Strval)
                }
            }
            
            if self.arraySetTimeFirst.count < 4 {
                if let Strval: String = "" {
                    self.arraySetTimeFirst.append(Strval)
                }
            }
            
            if self.arraySetTimeFirst.count > 4 {
                self.arraySetTimeFirst.removeLast()
            }
            
            print(arraySetTimeFirst)

            
            if self.arraySetTimeTwo.count < 2 {
                if let Strval: String = "" {
                    self.arraySetTimeTwo.append(Strval)
                }
            }
            if self.arraySetTimeTwo.count < 3 {
                if let Strval: String = "" {
                    self.arraySetTimeTwo.append(Strval)
                }
            }
            if self.arraySetTimeTwo.count < 4 {
                if let Strval: String = "" {
                    self.arraySetTimeTwo.append(Strval)
                }
            }
            if self.arraySetTimeTwo.count > 4 {
                self.arraySetTimeTwo.removeLast()
            }
            print(arraySetTimeTwo)
          
            self.strOneTime = (self.arraySetTimeFirst[0] as? String)!
            self.strTwoTime = (self.arraySetTimeFirst[1] as? String)!
            self.strThreTime = (self.arraySetTimeFirst[2] as? String)!
            self.strFourTime = (self.arraySetTimeFirst[3] as? String)!
            
            self.endOneTime = (self.arraySetTimeTwo[0] as? String)!
            self.endTwoTime = (self.arraySetTimeTwo[1] as? String)!
            self.endThreTime = (self.arraySetTimeTwo[2] as? String)!
            self.endFourTime = (self.arraySetTimeTwo[3] as? String)!
            
            
            self.daysArrayStartFirst[selectedRow] = self.strOneTime
            self.daysArrayStartSecond[selectedRow] = self.strTwoTime
            self.daysArrayStartThird[selectedRow] = self.strThreTime
            self.daysArrayStartFourth[selectedRow] = self.strFourTime
            
            self.daysArrayEndFirst[selectedRow] = self.endOneTime
            self.daysArrayEndSecond[selectedRow] = self.endTwoTime
            self.daysArrayEndThird[selectedRow] = self.endThreTime
            self.daysArrayStartFourth[selectedRow] = self.endFourTime

            
           
            
            
            DispatchQueue.main.async {
                self.tableList.reloadData()
            }
       }
        if self.btnOpen24hr.tag == 1
        {
            if self.opentwentyfour != ""
            {
                self.businessTimeView.isHidden = true
                self.selectBusinessTie.isHidden = true
                updateDic = arrayDaysOfDic[selectedRow]
                updateAry = updateDic["hours"]  as! [String]
                updateAry.removeAll()
                updateAry.append("Full Day")
                if (selectedTimeone.characters.count) > 0 && (selectedTimeTwo.characters.count) > 0
                {
                    updateAry.removeAll()
                    updateAry.append("\(selectedTimeone) -- \(selectedTimeTwo)")
                }
                self.arraySetTimeFirst = [selectedTimeone]
                self.arraySetTimeTwo = [selectedTimeTwo]
                updateDic.updateValue(updateAry, forKey: "hours")
                arrayDaysOfDic[selectedRow] = updateDic;
                
                
                if self.arraySetTimeFirst.count < 2 {
                    if let Strval: String = "" {
                        self.arraySetTimeFirst.append(Strval)
                    }
                }
                if self.arraySetTimeFirst.count < 3 {
                    if let Strval: String = "" {
                        self.arraySetTimeFirst.append(Strval)
                    }
                }
                
                if self.arraySetTimeFirst.count < 4 {
                    if let Strval: String = "" {
                        self.arraySetTimeFirst.append(Strval)
                    }
                }
                
                if self.arraySetTimeFirst.count > 4 {
                    self.arraySetTimeFirst.removeLast()
                }
                
                print(arraySetTimeFirst)
                
                
                if self.arraySetTimeTwo.count < 2 {
                    if let Strval: String = "" {
                        self.arraySetTimeTwo.append(Strval)
                    }
                }
                if self.arraySetTimeTwo.count < 3 {
                    if let Strval: String = "" {
                        self.arraySetTimeTwo.append(Strval)
                    }
                }
                if self.arraySetTimeTwo.count < 4 {
                    if let Strval: String = "" {
                        self.arraySetTimeTwo.append(Strval)
                    }
                }
                if self.arraySetTimeTwo.count > 4 {
                    self.arraySetTimeTwo.removeLast()
                }
                print(arraySetTimeTwo)

                
                
                self.strOneTime = (self.arraySetTimeFirst[0] as? String)!
                self.strTwoTime = (self.arraySetTimeFirst[1] as? String)!
                self.strThreTime = (self.arraySetTimeFirst[2] as? String)!
                self.strFourTime = (self.arraySetTimeFirst[3] as? String)!

                self.endOneTime = (self.arraySetTimeTwo[0] as? String)!
                self.endTwoTime = (self.arraySetTimeTwo[1] as? String)!
                self.endThreTime = (self.arraySetTimeTwo[2] as? String)!
                self.endFourTime = (self.arraySetTimeTwo[3] as? String)!


                self.daysArrayStartFirst[selectedRow] = self.strOneTime
                self.daysArrayStartSecond[selectedRow] = self.strTwoTime
                self.daysArrayStartThird[selectedRow] = self.strThreTime
                self.daysArrayStartFourth[selectedRow] = self.strFourTime

                self.daysArrayEndFirst[selectedRow] = self.endOneTime
                self.daysArrayEndSecond[selectedRow] = self.endTwoTime
                self.daysArrayEndThird[selectedRow] = self.endThreTime
                self.daysArrayStartFourth[selectedRow] = self.endFourTime
                
                
                
                
                if let noteReadth: String = self.dictOfDailyTime["Note"] as? String {
                    self.stringNote = noteReadth
                }
                self.valueOFNote.append(self.stringNote)
                
                self.selectedStr = (self.updateAry[0] as? String)!
                self.valueOFNote[selectedRow] = self.selectedStr

                DispatchQueue.main.async {
                    self.tableList.reloadData()

                }
            }
        }
        if self.btnHClose.tag == 1
        {
            if Closedstring != ""
            {
                self.businessTimeView.isHidden = true
                self.selectBusinessTie.isHidden = true
                updateDic = arrayDaysOfDic[selectedRow]
                updateAry = updateDic["hours"] as! [String]
                updateAry.removeAll()
                updateAry.append("CLOSED")
                if (selectedTimeone.characters.count) > 0 && (selectedTimeTwo.characters.count) > 0
                {
                    updateAry.removeAll()
                    updateAry.append("\(selectedTimeone) --\(selectedTimeTwo)")
                }
                updateDic.updateValue(updateAry, forKey: "hours")
                self.arraySetTimeFirst = [selectedTimeone]
                self.arraySetTimeTwo = [selectedTimeTwo]
                arrayDaysOfDic[selectedRow] = updateDic;
                
                if self.arraySetTimeFirst.count < 2 {
                    if let Strval: String = "" {
                        self.arraySetTimeFirst.append(Strval)
                    }
                }
                if self.arraySetTimeFirst.count < 3 {
                    if let Strval: String = "" {
                        self.arraySetTimeFirst.append(Strval)
                    }
                }
                
                if self.arraySetTimeFirst.count < 4 {
                    if let Strval: String = "" {
                        self.arraySetTimeFirst.append(Strval)
                    }
                }
                
                if self.arraySetTimeFirst.count > 4 {
                    self.arraySetTimeFirst.removeLast()
                }
                
                if self.arraySetTimeTwo.count < 2 {
                    if let Strval: String = "" {
                        self.arraySetTimeTwo.append(Strval)
                    }
                }
                if self.arraySetTimeTwo.count < 3 {
                    if let Strval: String = "" {
                        self.arraySetTimeTwo.append(Strval)
                    }
                }
                if self.arraySetTimeTwo.count < 4 {
                    if let Strval: String = "" {
                        self.arraySetTimeTwo.append(Strval)
                    }
                }
                if self.arraySetTimeTwo.count > 4 {
                    self.arraySetTimeTwo.removeLast()
                }

                self.strOneTime = (self.arraySetTimeFirst[0] as? String)!
                self.strTwoTime = (self.arraySetTimeFirst[1] as? String)!
                self.strThreTime = (self.arraySetTimeFirst[2] as? String)!
                self.strFourTime = (self.arraySetTimeFirst[3] as? String)!
                
                self.endOneTime = (self.arraySetTimeTwo[0] as? String)!
                self.endTwoTime = (self.arraySetTimeTwo[1] as? String)!
                self.endThreTime = (self.arraySetTimeTwo[2] as? String)!
                self.endFourTime = (self.arraySetTimeTwo[3] as? String)!
                
                
                self.daysArrayStartFirst[selectedRow] = self.strOneTime
                self.daysArrayStartSecond[selectedRow] = self.strTwoTime
                self.daysArrayStartThird[selectedRow] = self.strThreTime
                self.daysArrayStartFourth[selectedRow] = self.strFourTime
                
                self.daysArrayEndFirst[selectedRow] = self.endOneTime
                self.daysArrayEndSecond[selectedRow] = self.endTwoTime
                self.daysArrayEndThird[selectedRow] = self.endThreTime
                self.daysArrayStartFourth[selectedRow] = self.endFourTime
               
                
                if let noteReadth: String = self.dictOfDailyTime["Note"] as? String {
                    self.stringNote = noteReadth
                }
                self.valueOFNote.append(self.stringNote)
                
                self.selectedStr = (self.updateAry[0] as? String)!
                self.valueOFNote[selectedRow] = self.selectedStr
                
                self.tableList.reloadData()
            }
        }
        
     if opentwentyfour == "" && Closedstring == "" && selectedTimeone.characters.count == 0 && selectedTimeTwo.characters.count == 0 {
            self.view.makeToast("fill all details Properly")
        }
        selectedTimeone.removeAll()
        selectedTimeTwo.removeAll()
        settimeone.setTitle("Settime", for:.normal)
        settimetwo.setTitle("Settime", for:.normal)
        settimeone.isEnabled = true
        settimetwo.isEnabled = true
        settimeone.isHidden = false
        settimetwo.isHidden = false
        lblBwnTime.isHidden = false
        btnMoreHours.isHidden = false
        
    }
    
    @IBAction func btnMoreHourAction(_ sender: Any) {
        
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        if btnMoreHours.tag == 0
        {
            viewBwnTime = UIView(frame: CGRect(x: 0, y: 0, width: viewBwnTime.frame.size.width, height: 10))
            viewBwnTime.addSubview(settimeone)
            viewBwnTime.addSubview(settimetwo)
            viewBwnTime.addSubview(lblBwnTime)
            btnMoreHours.tag = 1
        }
        else if btnMoreHours.tag == 1
        {
            btnMoreHours.tag = 0
        }
    }
    
    @IBAction func btnHolidayClose(_ sender: Any)
    {
        if btnHClose.tag == 0
        {
            btnMoreHours.isHidden = true
            btnHClose.setBackgroundImage(UIImage(named: "checkmark-seelcted"), for: .normal)
            btnOpen24hr.setBackgroundImage(UIImage(named: "check-box-empty"), for: .normal)
              Closedstring = "Closed"
            selectedTimeone.removeAll()
            selectedTimeTwo.removeAll()
            settimeone.isHidden = true
            settimetwo.isHidden = true
            lblBwnTime.isHidden = true
            settimeone.isEnabled = false
            settimetwo.isEnabled = false
            btnHClose.tag = 1
        }
        else if btnHClose.tag == 1
        {
            btnMoreHours.isHidden = false
            btnOpen24hr.setBackgroundImage(UIImage(named: "check-box-empty"), for: .normal)
            btnHClose.setBackgroundImage(UIImage(named: "check-box-empty"), for: .normal)
            Closedstring.removeAll()
            settimeone.isEnabled = true
            settimetwo.isEnabled = true
            settimeone.isHidden = false
            settimetwo.isHidden = false
            lblBwnTime.isHidden = false

            btnHClose.tag = 0
        }
    }
    
    
    @IBAction func btnOpen24(_ sender: Any)
    {
        if btnOpen24hr.tag == 0
        {
            btnMoreHours.isHidden = true
            btnHClose.setBackgroundImage(UIImage(named: "check-box-empty"), for: .normal)
            btnOpen24hr.setBackgroundImage(UIImage(named: "checkmark-seelcted"), for: .normal)
            opentwentyfour = "opentwentyfour"
            selectedTimeone.removeAll()
            selectedTimeTwo.removeAll()
            settimeone.isEnabled = false
            settimetwo.isEnabled = false
            settimeone.isHidden = true
            settimetwo.isHidden = true
            lblBwnTime.isHidden = true
            btnOpen24hr.tag = 1
        }
        else if btnOpen24hr.tag == 1
        {
            btnMoreHours.isHidden = false
            btnHClose.setBackgroundImage(UIImage(named: "check-box-empty"), for: .normal)
            btnOpen24hr.setBackgroundImage(UIImage(named: "check-box-empty"), for: .normal)
            opentwentyfour.removeAll()
            settimeone.isEnabled = true
            settimetwo.isEnabled = true
            settimeone.isHidden = false
            settimetwo.isHidden = false
            lblBwnTime.isHidden = false
            btnOpen24hr.tag = 0
        }

    }

   
    @IBAction func Mybackbutton(_ sender: UIButton)
    {
    self.dismiss(animated:true, completion:nil)
    }
    @IBAction func settimeone(_ sender: UIButton)
    {
        select1Time.isHidden = false
         self.viewTime.isHidden = false
        self.select2Time.isHidden = true
        self.view2Time.isHidden = true
        btnOpen24hr.tag = 0
        btnClose.tag = 0
        datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    @IBAction func settimetwo(_ sender: UIButton)
    {
        select2Time.isHidden = false
        select1Time.isHidden = true
        self.viewTime.isHidden = true
        self.view2Time.isHidden = false
        btnOpen24hr.tag = 0
        btnClose.tag = 0
         datePicker2.addTarget(self, action: #selector(handleDatePicker2(sender:)), for: .valueChanged)
    }
    
    func editTimeDetails()
    {
        

        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NDk3MDcyNzQsImlzcyI6ImxvY2FsaG9zdCIsImV4cCI6MTU0OTcwODE3NCwidXNlcklkIjoiQTcwNTA0In0.moe_4jgVOPZn-Kvb2rskHsED1ZIrux7qlBb34dNCtao"
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = "A70153"
        }
    let postStringfinlavalue =  String(format: "method=%@&mobileNo=%@&category=%@&VersionCode=%@&appType=%@&agentId=%@&userid=%@&type=%@&Authorization=%@&AgentID=%@","getownerdetails","7673959961","businessdetails","3.0-37","Direct","127","127","get",self.Myauthorisationstringfinalvalue,self.myagentTotalvalue)
        
        
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling, forHTTPHeaderField:"AgentID")
        
        request.httpBody = postStringfinlavalue.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):

                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    
                    if let profileType: [Any] = dict.value(forKey: "BusinessCategory") as? [Any] {
                        self.businessCategType = profileType
                    }
            
                    for i in 0 ..< self.businessCategType.count {
                        if let valueOFCateg : [String: Any] = (self.businessCategType[i] as! [String : Any]) {
                            self.dictBusinessCateg = valueOFCateg
                        }
                        if let valueOFTypeCate: String = self.dictBusinessCateg["value"] as? String {
                            self.businessCategVal = valueOFTypeCate
                        }
                    }
                    
                    if let businessTypeHours : [String: Any] = dict.value(forKey: "Businesshours") as? [String: Any] {
                        self.dictOFBusinessHours = businessTypeHours
                    }
                    
                    if let arrayTimingVal: [Any] = self.dictOFBusinessHours["timings"] as? [Any] {
                        self.actuallyBusinessHours = arrayTimingVal
                    }
                    
                    if let dictTimingVal: [String : Any] = self.dictOFBusinessHours["openinghours"] as? [String: Any] {
                        self.manualBusinessHours = dictTimingVal
                    }

                    if let arrayDetailHour : [Any] = self.manualBusinessHours["HourDetails"] as? [Any] {
                        self.dailyaryBusinessHours = arrayDetailHour
                    }
                
                    for i in 0 ..< self.dailyaryBusinessHours.count {
                        
                        if let dayDict: [String: Any] = self.dailyaryBusinessHours[i] as? [String: Any] {
                            self.dictOfDailyTime = dayDict
                        }
                        
                        if let dayOfDictVal: String = self.dictOfDailyTime["Day"] as? String {
                            self.dayDetailsInString = dayOfDictVal
                        }
                        self.daysArrayBusiness.append(self.dayDetailsInString)

                        if let startFirst: String = self.dictOfDailyTime["StartFirst"] as? String {
                            self.dayOfStartFirst = startFirst
                        }
                        self.daysArrayStartFirst.append(self.dayOfStartFirst)
                        
                        if let startSecond: String = self.dictOfDailyTime["StartSecond"] as? String {
                            self.dayOfStartSecond = startSecond
                        }
                        self.daysArrayStartSecond.append(self.dayOfStartSecond)
                        
                        if let startThird: String = self.dictOfDailyTime["StartThird"] as? String {
                            self.dayOfStartThird = startThird
                        }
                        self.daysArrayStartThird.append(self.dayOfStartThird)
                        
                        if let startFourth: String = self.dictOfDailyTime["StartFourth"] as? String {
                            self.dayOfStartFourth = startFourth
                        }
                        self.daysArrayStartFourth.append(self.dayOfStartFourth)
                        
                        if let endFirst: String = self.dictOfDailyTime["EndFirst"] as? String {
                            self.dayOfEndFirst = endFirst
                        }
                        self.daysArrayEndFirst.append(self.dayOfEndFirst)
                        
                        if let endSecond: String = self.dictOfDailyTime["EndSecond"] as? String {
                            self.dayOfEndSecond = endSecond
                        }
                        self.daysArrayEndSecond.append(self.dayOfEndSecond)
                        
                        if let endThird: String = self.dictOfDailyTime["EndThird"] as? String {
                            self.dayOfEndThird = endThird
                        }
                        self.daysArrayEndThird.append(self.dayOfEndThird)
                        
                        if let endFourth: String = self.dictOfDailyTime["EndFourth"] as? String {
                            self.dayOfEndFourth = endFourth
                        }
                        self.daysArrayEndFourth.append(self.dayOfEndFourth)
                        
                        if let noteReadth: String = self.dictOfDailyTime["Note"] as? String {
                            self.stringNote = noteReadth
                        }
                        self.valueOFNote.append(self.stringNote)
                        
                        if let OccasionValue: String = self.dictOfDailyTime["Occasion"] as? String {
                            self.stringOfOcca = OccasionValue
                        }
                        self.valueOfOccasion.append(self.stringOfOcca)
                    }
                    DispatchQueue.main.async {
                        self.tableList.reloadData()
                    }
                    
                }
            case .failure(_):
                print("Error")
            }
        }
    }
}
