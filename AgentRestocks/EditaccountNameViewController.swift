//
//  EditaccountNameViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 08/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.




import UIKit
import Alamofire
import AlamofireImage

class EditaccountNameViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var Editaccountviewfinalvalue: UIView!
    
    
    @IBOutlet weak var businesstypeofbutton: UIButton!
    
    @IBOutlet weak var businesstypeofbuttontwo: UIButton!
    
    @IBOutlet weak var okbutton: UIButton!
    
    @IBOutlet weak var catageorytopview: UIView!
    var profileselectedIndex :Int?
    var int_count = NSInteger()
    var othersstring1 = NSArray()
    var Recomendeddictvaluefinal  = NSDictionary()
    var othersstringhelpfinal  = NSArray()
    var othersstringidfinalvalue  = [String]()
    var othersstringhelpNamevaluefinal  = [String]()

    @IBOutlet weak var Editaccounttabelview: UITableView!
    
    
    @IBAction func Backbutton(_ sender: Any)
    {
        self.dismiss(animated:true, completion:nil)
    }
    @IBOutlet var editaccountview: UIView!
    @IBOutlet weak var editaccounttopview: UIView!
    var selectedcatageory = String()
    @IBOutlet weak var labelbusinesscatageory: UILabel!
    @IBOutlet weak var okbuttoneditaccountfinal: UIButton!
    @IBOutlet weak var savechangesbutton: UIButton!
    var catgeroryfinalvalueoneis = String()
    var multipleSelectionvalue = String()
    var coverView = UIView()
    var imageView = UIImageView()
    var Editaccountnamestring = String()
    var Editaccountnumberfinalvalue = String()
    var MobilenumeberEditaccountName = String()
    
    
    @IBOutlet weak var veryalertviewfinal: UIView!
    
     var EditaccountNametimer = Timer()
    
    
    
    @IBOutlet weak var Editaccountmultipleselction: UIView!
    
    @IBOutlet weak var Mutipleselectiontopviw: UIView!
    
    @IBOutlet weak var mutipleselctionname: UILabel!
    
    @IBOutlet weak var multipleselectioncancelbutton: UIButton!
    
    
    @IBOutlet weak var mutiselctionokbutton: UIButton!
    
    @IBOutlet weak var mutiselctiontabelview: UITableView!
    var selectedCells:[Int] = []
   var select_index : Int!
    
    var singstring = [String]()
    var selectedindexfinal : Int!
    
    
    var MutipleselectionName = [String]()
    var Mutipleselectionidvalue = [String]()
    
    var typeidvalue = String()
    var selectedidfinalvaluesingel = String()
    var selectedidfinalvaluefinalis = String()

    var selectedEditaccountname = NSMutableArray()
    var category = NSString()
    var datafinalvalue = NSMutableDictionary()
      var datafinalvaluetwo = NSMutableDictionary()
//    var datafinalvalue = [String: String]()
    var toatldictFinalvalue = NSDictionary()
    var NExtscreenquestion = [String]()
    var NExtscreenidfinalvalue = [String]()
    var selectedmultiplevalueis = [String]()
    var ssingelselection = String()
    var datafour = NSDictionary()
    
    var selectedEditaccountnamesingel = [String]()
    var selectedEditaccountidsingel = [String]()

    
    var foodsSelected:[String] = []
    var foodsSelectedtwo:[String] = []

    
    
    var NewothersDict = NSDictionary()
    
  var   Newothersstring1 = NSArray()
    
    var othersfinalidstring = NSArray()
    
    var othersselectedselectedstring = NSArray()

    var othersfinalidstringtwo = NSArray()
    
    var othersselectedselectedstringtwo = NSArray()
    var othersselectedselectedstringcatageoryfinal = NSArray()

    var mutabeldictsingellvalue = NSDictionary()
    var mutabeldictsingellvaluetwo = NSDictionary()

    var mutabeldictfinalvalue = NSMutableDictionary()
    
    var dictionary =  [String:String]()

        var arrayDaysOfDic:[[String:Any]] = [[String:Any]]()
   var useridEditaccountName = String()
    
    
    var democatageory = String()
    
    
    @IBOutlet weak var businesstypetwofinal: UILabel!
    
    
    @IBOutlet weak var demolabel: UILabel!
    
    var demoidsvalue = [String]()
    
    var AcessTokenfinalstring = String()
    
    var myagentTotalvalue  = String()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        print(self.othersstring1)
        print(self.catgeroryfinalvalueoneis)
        print(int_count)
        self.businesstypetwofinal.text = self.catgeroryfinalvalueoneis
        self.othersselectedselectedstring =  self.othersstring1.value(forKey:"selected") as! NSArray
        
          self.othersfinalidstring = self.othersstring1.value(forKey:"id") as! NSArray
        self.othersselectedselectedstringcatageoryfinal = self.othersstring1.value(forKey:"category") as! NSArray
        print(self.othersfinalidstring)
        print(self.othersselectedselectedstring)

        
        
        self.Editaccountviewfinalvalue.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.businesstypeofbutton.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        okbuttoneditaccountfinal.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        catageorytopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        Recomendeddictvaluefinal = self.othersstring1[int_count]as!NSDictionary
        print(Recomendeddictvaluefinal)
        self.typeidvalue =  Recomendeddictvaluefinal.value(forKey:"id")as!String
        
        print(self.typeidvalue)
        
        self.othersstringhelpfinal = Recomendeddictvaluefinal.value(forKey:"options")as!NSArray
        self.othersstringidfinalvalue = self.othersstringhelpfinal.value(forKey:"id")as![String]
        self.othersstringhelpNamevaluefinal = self.othersstringhelpfinal.value(forKey:"value")as![String]
         self.category = self.Recomendeddictvaluefinal.value(forKey:"category")as!NSString
      self.businesstypeofbutton.setTitle(self.catgeroryfinalvalueoneis, for:.normal)
        labelbusinesscatageory.text = self.catgeroryfinalvalueoneis
        multipleSelectionvalue = Recomendeddictvaluefinal.value(forKey:"multipleSelection")as!String
         self.mutiselctionokbutton.layer.addBorder(edge:.top, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.Mutipleselectiontopviw.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.mutipleselctionname.text = self.catgeroryfinalvalueoneis
        if multipleSelectionvalue == "1"
        {
         
            if let Newproductoutletsfinal:NSArray = Recomendeddictvaluefinal.value(forKey:"selected")as?NSArray
                
            {
                let Newproduct_dealsstruck = Newproductoutletsfinal
//                self.selectedEditaccountname.adding(Newproduct_dealsstruck)
                self.selectedEditaccountname.addingObjects(from:Newproduct_dealsstruck as! [Any])
                
            }
        }
        else
        {
            if let Newproductoutletsfinal:NSString = Recomendeddictvaluefinal.value(forKey:"selected")as?NSString
            {
                let Newproduct_dealsstruck = Newproductoutletsfinal
                self.selectedEditaccountname.adding(Newproduct_dealsstruck)
            }
            else
            {
                self.selectedEditaccountname.adding("")
            }
            print(self.selectedEditaccountname)
        }
        
        
        self.NExtscreenquestion  = self.othersstring1.value(forKey:"question")as![String]
        self.NExtscreenidfinalvalue = self.othersstring1.value(forKey:"id")as![String]
        print(self.NExtscreenquestion)
        print(self.NExtscreenidfinalvalue)
        
        
//     self.NExtscreenquestion.remove(at:int_count)
//    self.NExtscreenidfinalvalue.remove(at:int_count)
//        print(self.NExtscreenquestion)
//        print(self.NExtscreenidfinalvalue)
//
        self.catageorytopview.roundedButton()
        self.Mutipleselectiontopviw.roundedButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    
    @IBAction func canceltabelview(_ sender: UIButton)
    {
        self.editaccounttopview.isHidden = true
        businesstypeofbutton.tag = 0
        businesstypeofbuttontwo.tag = 0
    }
    
    @IBAction func Businesstypebutton(_ sender: UIButton)
    {
        self.editaccounttopview.isHidden = true
    }
    
    @IBOutlet weak var Cancelbutton: UIButton!
    

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
{
    if tableView == Editaccounttabelview
    {
        return self.othersstringhelpNamevaluefinal.count

    }
    else{
        return self.othersstringhelpNamevaluefinal.count

    }
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == Editaccounttabelview
        {
            let cell  = Editaccounttabelview.dequeueReusableCell(withIdentifier: "ProofsTableViewCell", for: indexPath) as! ProofsTableViewCell
            cell.businesslabel.text = self.othersstringhelpNamevaluefinal[indexPath.row]
            if self.othersstringhelpNamevaluefinal.count-1 == indexPath.row {
                cell.businesstwo.isHidden = true
            }
            else{
                cell.businesstwo.isHidden = false
            }
            
            if profileselectedIndex == nil
            {
                cell.businessone.backgroundColor = UIColor.color2()
                cell.businesstwo.backgroundColor = UIColor.color2()
                cell.businesslabel.textColor = UIColor.black
                cell.businessone.layer.cornerRadius = cell.businessone.layer.frame.size.width/2
                
            }
            else
            {
                if indexPath.row == profileselectedIndex
                {
                    cell.businessone.backgroundColor = UIColor.red
                    cell.businesstwo.backgroundColor =  UIColor.color2()
                    cell.businessone.layer.cornerRadius = cell.businessone.layer.frame.size.width/2
                    cell.businesslabel.textColor = UIColor.red
                }
                else{
                    cell.businessone.backgroundColor = UIColor.color2()
                    cell.businesstwo.backgroundColor = UIColor.color2()
                    cell.businesslabel.textColor = UIColor.black
                    
                    cell.businessone.layer.cornerRadius = cell.businessone.layer.frame.size.width/2
                    
                }
            }
            return cell
        }
        else
        {
            
            let cell  = mutiselctiontabelview.dequeueReusableCell(withIdentifier: "MultipleselectionTableViewCell", for: indexPath) as! MultipleselectionTableViewCell
            cell.mutiselectionlabel.text = self.othersstringhelpNamevaluefinal[indexPath.row]
            cell.select_index = indexPath.row
            if select_index != nil {
                if select_index == 0 {
                    cell.mutiselctionimage.image = #imageLiteral(resourceName: "verifiedred")
 
                }
                else if select_index == 1 {
                    cell.mutiselctionimage.image = #imageLiteral(resourceName: "Multiselectionsquare")
   
                }
            }
            else {
                if self.selectedCells.contains(indexPath.row) {
                    cell.mutiselctionimage.image = #imageLiteral(resourceName: "verifiedred")
                }
                else{
                   
                    cell.mutiselctionimage.image = #imageLiteral(resourceName: "Multiselectionsquare")
                }
                
            }
            return cell

        }
      
}


func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
{
    if tableView == Editaccounttabelview
    {
        profileselectedIndex = indexPath.row
        selectedcatageory = othersstringhelpNamevaluefinal[indexPath.row]
        selectedidfinalvaluesingel = self.othersstringidfinalvalue[indexPath.row] as! String
         self.selectedEditaccountnamesingel.append(selectedidfinalvaluesingel)
        //  self.selectedEditaccountname.adding(selectedidfinalvaluesingel)
        print(self.selectedEditaccountnamesingel)
        print(self.selectedidfinalvaluesingel)

        Editaccounttabelview.reloadData()
    }
    else
    {
        select_index = nil
        selectedindexfinal = indexPath.row
       let  onevalue = self.othersstringidfinalvalue[indexPath.row] as! String
        
        let twovalue = self.othersstringhelpNamevaluefinal[indexPath.row]
        
        if self.selectedCells.contains(indexPath.row)
        {
            self.selectedCells.remove(at: self.selectedCells.index(of:indexPath.row)!)

            foodsSelected.remove(at: self.selectedCells.index(of: indexPath.row)!)
            foodsSelectedtwo.remove(at: self.selectedCells.index(of: indexPath.row)!)

            
        } else {
            self.selectedCells.append(indexPath.row)
            //self.singstring.append(self.othersstringhelpNamevaluefinal[indexPath.row])
            foodsSelected.append(onevalue)
foodsSelectedtwo.append(twovalue)
        }
        
        foodsSelected = foodsSelected.sorted()

        foodsSelectedtwo = foodsSelectedtwo.sorted()

        
        tableView.reloadData()
        
 
//
//        if(!foodsSelected.contains(self.othersstringidfinalvalue[indexPath.row]))
//        {
//            foodsSelected.append(self.othersstringidfinalvalue[indexPath.row])
//        }
//        else
//        {
//            foodsSelected = foodsSelected.filter({$0 != self.othersstringidfinalvalue[indexPath.row]})
//        }
        
        self.businesstypeofbutton.setTitle("", for: .normal)
        let valuetwo =   self.foodsSelectedtwo.joined(separator: ",")
        self.businesstypeofbutton.setTitle(valuetwo, for: .normal)
        
        
//        if(!foodsSelectedtwo.contains(self.othersstringhelpNamevaluefinal[indexPath.row]))
//        {
//            foodsSelectedtwo.append(self.othersstringhelpNamevaluefinal[indexPath.row])
//            self.businesstypeofbutton.setTitle("", for: .normal)
//            let valuetwo =   self.foodsSelectedtwo.joined(separator: ",")
//            self.businesstypeofbutton.setTitle(valuetwo, for: .normal)
//        }
//        else
//        {
//            foodsSelectedtwo = foodsSelectedtwo.filter({$0 != self.othersstringidfinalvalue[indexPath.row]})
//            self.businesstypeofbutton.setTitle("", for: .normal)
//            let valuetwo =   self.foodsSelectedtwo.joined(separator: ",")
//            self.businesstypeofbutton.setTitle(valuetwo, for: .normal)
//        }
      
        print(foodsSelected)
        self.selectedEditaccountnamesingel = self.foodsSelectedtwo
        print(self.selectedEditaccountnamesingel)
        self.selectedEditaccountidsingel = self.foodsSelected
        let stringone  = NSString(format:"%@",[self.selectedEditaccountnamesingel])
        print(stringone)
        let value = self.selectedEditaccountnamesingel

    }
    
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if tableView == Editaccounttabelview  {
                         return 39
        }
        else{
             return 40
        }
     
    }
    @IBAction func businessnamebuttonone(_ sender: UIButton)
    {
        if multipleSelectionvalue == "1"
        {
            if businesstypeofbutton.tag == 0
            {
                self.Editaccountmultipleselction.isHidden = false
                businesstypeofbutton.tag = 1
            }
            else if businesstypeofbutton.tag == 1
            {
                self.Editaccountmultipleselction.isHidden = false
                businesstypeofbutton.tag = 0
            }

        }
        else
        {
            if businesstypeofbutton.tag == 0
            {
                self.editaccounttopview.isHidden = false
                businesstypeofbutton.tag = 1
            }
            else if businesstypeofbutton.tag == 1
            {
                self.editaccounttopview.isHidden = true
                businesstypeofbutton.tag = 0
            }

        }
    }
    @IBAction func okEditaccountfinal(_ sender: UIButton)
    {
        self.editaccounttopview.isHidden = true
        businesstypeofbutton.setTitle(selectedcatageory, for:.normal)
        businesstypeofbutton.tag = 0
        businesstypeofbuttontwo.tag = 0
        
        self.savechangesbutton.isHidden = false
    }
    
    @IBAction func Savechangesbutton(_ sender: UIButton)
    {
        
        if multipleSelectionvalue == "1"
        {
            self.veryalertviewfinal.isHidden = false
            
            let valuebuttontitleis = businesstypeofbutton.titleLabel?.text
            
            print(valuebuttontitleis)
            if (valuebuttontitleis?.characters.count)! > 0
            {
                DispatchQueue.main.async {
                    self.updatemultiplevalues()
                }
            }
            else
            {
                self.view.makeToast("please selecttype")
            }
        }
        
        else{
            self.veryalertviewfinal.isHidden = false
            
            let valuebuttontitleis = businesstypeofbutton.titleLabel?.text
            
            print(valuebuttontitleis)
            if (valuebuttontitleis?.characters.count)! > 0
            {
                DispatchQueue.main.async {
                self.updatesingelvalueEditaccountNAme()
                    
                   // self.updatemultiplevalues()
                }
            }
            else
            {
                self.view.makeToast("please selecttype")
            }
        }
     
        
    }
    
    func updatesingelvalueEditaccountNAme()
    {
        self.showSpinner()
        let defaultsingelvalue = UserDefaults.standard
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        let kuserdefaukts = UserDefaults.standard
        if let Myagentidfinal:String = defaultsingelvalue.value(forKey:"UserId")as?String
        {
            self.Editaccountnumberfinalvalue = Myagentidfinal
        }
//        http://172.31.0.13/agentRestock/agent_Gwy.php?method=updateAnswers&mobileNo=7673959961&type=100&values=2076&JSON=[{"id":"99","selected":"14,16"},{"id":"100","selected":"2076"},{"id":"100","selected":"14,16"},{"id":"100","selected":"14,16"},{"id":"100","selected":"14,16"},{"id":"100","selected":"14,16"},{"id":"100","selected":"14,16"},{"id":"100","selected":"14,16"},{"id":"100","selected":"14,16"}]
//        [1]
        //
        //
        //        var othersfinalidstring = [String]()
        //
        //        var othersselectedselectedstring = [String]()
        
        
        self.Newothersstring1 = self.othersstring1
//        var othersfinalidstring = NSArray()
//
//        var othersselectedselectedstring = NSArray()
        
        print(self,Newothersstring1.count)
        print(self.othersstring1.count)
        for i in 0..<Newothersstring1.count
        {
            print(profileselectedIndex)
            if i == int_count
            {
                print("Method called final value")
                
                print(selectedidfinalvaluesingel)
                
                mutabeldictsingellvalue = ["id":typeidvalue,"selected":selectedidfinalvaluesingel,"category":self.catgeroryfinalvalueoneis]
                
                print(mutabeldictsingellvalue)

            }
            else{
                mutabeldictsingellvalue = ["id":othersfinalidstring[i],"selected":othersselectedselectedstring[i],"category":othersselectedselectedstringcatageoryfinal[i]]
              //  mutabeldictsingellvaluetwo = ["id":othersfinalidstring[i],"selected":othersselectedselectedstring[i]]
//                 mutabeldictfinalvalue.addEntries(from:mutabeldictsingellvaluetwo as! [AnyHashable : Any])
//                print(mutabeldictfinalvalue.count)
//                print(mutabeldictfinalvalue)
            }
            
                      mutabeldictfinalvalue.addEntries(from:mutabeldictsingellvalue as! [AnyHashable : Any])
            arrayDaysOfDic.append(mutabeldictsingellvalue as! [String : Any])
        }
     
      
        let jsonData = try? JSONSerialization.data(withJSONObject:arrayDaysOfDic, options: [])
        print(jsonData)
        let jsonString = String(data: jsonData!, encoding: .utf8)
        print(jsonString)
        
        print(self.mutabeldictfinalvalue)
        
        
        
//        for i in 0..<self.NExtscreenquestion.count {
//            datafour = ["id":self.NExtscreenidfinalvalue[i],"category": self.NExtscreenquestion[i],"selected":self.selectedmultiplevalueis[i],"appType":"Agent"]
//            datafinalvalue.addEntries(from:datafour as! [AnyHashable : Any])
//        }

    
        if let Myagentidfinal:String = kuserdefaukts.value(forKey:"myuseridvaluefinal")as!String
        {
            self.useridEditaccountName = Myagentidfinal
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

        
        let finalvalueis = kuserdefaukts.value(forKey:"Mymobilenumbervalue")
        
        request.httpMethod = "POST"
    let postString =  String(format: "method=%@&agentID=%@&mobileNo=%@&type=%@&values=%@&JSON=%@","updateAnswers",self.useridEditaccountName,finalvalueis as! CVarArg, self.typeidvalue,self.selectedidfinalvaluesingel,jsonString!)
        print(postString)
        
//        http://172.31.0.13/agentRestock/agent_Gwy.php?method=updateAnswers&mobileNo=7673959961&type=100&values=2076&JSON=[{"
        
        request.httpBody = postString.data(using: .utf8)
        request.addValue(AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.addValue("application/json", forHTTPHeaderField: "Accept")
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                if let dictsingelvalue:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dictsingelvalue)
                    if let str2:String = dictsingelvalue.value(forKey:"Status")as?String
                    {
                        print(str2)
                        if  str2 == "0"
                        {
                        self.removeSpinner()
                        }
                        if  str2 == "1"
                        {
//                            self.removeSpinner()
                            self.EditaccountNametimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.EditaccountNametimeractionfinalvalue), userInfo: nil, repeats: false)
                         
                        }
                    }
                }
                break
            case .failure(_):
                break
            }
        }
        
    }
    
    func updatemultiplevalues()
    {
  
        self.showSpinner()
        let defaultsingelvalue = UserDefaults.standard
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        let kuserdefaukts = UserDefaults.standard
        if let Myagentidfinal:String = defaultsingelvalue.value(forKey:"UserId")as?String
        {
            self.Editaccountnumberfinalvalue = Myagentidfinal
        }
        self.Newothersstring1 = self.othersstring1
        print(self,Newothersstring1.count)
        print(self.othersstring1.count)
        for i in 0..<Newothersstring1.count
        {
            print(profileselectedIndex)
            if i == int_count
            {
                print("Method called final value")
                print(selectedidfinalvaluesingel)
                mutabeldictsingellvalue = ["id":typeidvalue,"selected":self.selectedEditaccountidsingel,"category":self.self.catgeroryfinalvalueoneis]
                
                print(mutabeldictsingellvalue)
            }
            else{
                mutabeldictsingellvalue = ["id":othersfinalidstring[i],"selected":othersselectedselectedstring[i],"category":othersselectedselectedstringcatageoryfinal[i]]
              
            }
            
            mutabeldictfinalvalue.addEntries(from:mutabeldictsingellvalue as! [AnyHashable : Any])
            arrayDaysOfDic.append(mutabeldictsingellvalue as! [String : Any])
        }

        let jsonData = try? JSONSerialization.data(withJSONObject:arrayDaysOfDic, options: [])
        print(jsonData)
        let jsonString = String(data: jsonData!, encoding: .utf8)
        print(jsonString)
        
        print(self.mutabeldictfinalvalue)
        
        if let Myagentidfinal:String = kuserdefaukts.value(forKey:"myuseridvaluefinal")as!String
        {
            self.useridEditaccountName = Myagentidfinal
        }
        let finalvalueis = kuserdefaukts.value(forKey:"Mymobilenumbervalue")
        
        self.demoidsvalue  =  [self.selectedEditaccountidsingel.joined(separator: ",")]
        
        print(self.demoidsvalue)
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

  
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobileNo=%@&type=%@&values=%@&JSON=%@&app=%@","updateAnswers",self.MobilenumeberEditaccountName, self.typeidvalue,self.demoidsvalue,jsonString!,"ios")
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
                print(response.result)
                if let dictsingelvalue:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dictsingelvalue)
                    if let str2:String = dictsingelvalue.value(forKey:"Status")as?String
                    {
                        print(str2)
//                        Status = 1;
//                        message = "Information Updated successfully!";
//
                        
                        if  str2 == "0"
                        {
                            self.removeSpinner()
                        }
                        if  str2 == "1"
                        {
                            
                            let messagefinalvalue = dictsingelvalue.value(forKey:"message")as?String
                            self.view.makeToast(messagefinalvalue)
                            
                            
                           self.EditaccountNametimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.EditaccountNametimeractionfinalvalue), userInfo: nil, repeats: false)
                            
                        }
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }

    @objc func EditaccountNametimeractionfinalvalue()
    {
        
        DispatchQueue.main.async
            {
            let Editcaccount = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
                let deafults = UserDefaults.standard
                deafults.set("myothersvalue", forKey: "myanothersvalue")
                deafults.set("", forKey: "singelupdate")
                deafults.set("", forKey: "MyBillingadressset")
                deafults.set("", forKey: "Mydeliveryadressset")
                deafults.set("", forKey: "Mydeliveryadresssetfinalvalue")
                deafults.synchronize()
                self.present(Editcaccount, animated:true, completion:nil)
        }
    }
    @objc func EditaccountNametimeractionfinalvaluetwo()
    {
        
        DispatchQueue.main.async
            {
                let Editcaccount = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
                self.present(Editcaccount, animated:true, completion:nil)
        }
    }
    
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.veryalertviewfinal.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()

    }
    
    @IBAction func Mutipleselctioncancelbutton(_ sender: UIButton)
    {
        self.Editaccountmultipleselction.isHidden = true
    }
    
    @IBAction func multiselectionokbutton(_ sender: UIButton)
    {
        self.Editaccountmultipleselction.isHidden = true
        self.editaccounttopview.isHidden = true

      let value =   self.selectedEditaccountnamesingel.joined(separator: ",")
         self.businesstypeofbutton.setTitle(value, for: .normal)
        businesstypeofbutton.tag = 0
        businesstypeofbuttontwo.tag = 0
        
        self.savechangesbutton.isHidden = false
    }
    
}
