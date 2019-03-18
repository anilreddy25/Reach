//
//  shoutVC.swift
//  AgentRestocks
//
//  Created by apple on 12/24/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire

class shoutVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var lblShout: UILabel!
    
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var txtFieldComment: UITextField!
    
    @IBOutlet weak var tableList: UITableView!
    
    @IBOutlet weak var lblNoOfWord: UILabel!
    
    @IBOutlet weak var btnUPandDown: UIButton!
    
    @IBOutlet weak var btnShout: UIButton!
    
    @IBOutlet weak var btnGallery: UIButton!
    
    @IBOutlet weak var viewShareButon: UIView!
    
    var Myauthorisationstringfinalvalue = String()
    var myagentTotalvalue = String()
    var EditprofiledescriptionViewall = String()
    
    var listArray =  [Any]()
    var listDict =  [String: Any]()
    
    var broughtPeople = String()
    var senderMessage = String()
    var comboText = String()
    var productName = String()
    var offPrice = String()
    var priceValue = Int()
    var saveAmnt = String()
    var timerValue = String()
    var comboArray = [Any]()
    var shoutDict = [String: Any]()
    var marginValue = String()
    var mrpPrice = String()
    var moqValue = String()
    var saveAmount = String()
    var comboNames = String()
    var expText = String()
    var isExclusive = String()
    var isExperied = String()
    var isNewValue = String()
    var isComboValue = String()
    var isDealValue = String()
    var offerValue = String()
    var hasOffTakeValue = String()
    var imgValue = String()
    var OfftakeValue =  String()
    var inStocktValued = String()
    
    // Array
    
    var valBroughtBy = [Any]()
    var valdIShot = [Any]()
    var valdILike = [Any]()
    var valdUserLike = [Any]()
    var valdLikeSS = [Any]()
    var valdImgArray = [Any]()
    var valdImgPro = [Any]()
    var valdComDat = [Any]()
    var valdMSG = [Any]()
    var valdComnts = [Any]()
    var valdHasBrBy = [Any]()
    var valdSaved = [Any]()
    var valAddData = [Any]()
    var valISSht = [Any]()
    var valNameOFP = [Any]()
    var valSUbj = [Any]()
    var valPrfID = [Any]()
    var valAddID = [Any]()
    var valSHOUTS = [Any]()
    var valShtTxt = [Any]()
    var valShtType = [Any]()
    var valShtImg = [Any]()

    var mainShoutVal = [String: Any]()

    var isShoutValue = String()
    var isLikeValue = String()
    var imgArray = [Any]()
    var imgProfile = String()
    var isUserLikeValue = String()
    var likesValue = Int()
    var commentDataValue = [Any]()
    var additionalDataValue = [String: Any]()
    var msgSender = String()
    var commentvalue = Int()
    var hasbroughtValue = String()
    var savedValue = Int()
    var isShoutedValue = String()
    var profileName = String()
    var subjectValue =  String()
    var profileIdValue = Int()
    var shoutTypeValue = String()
    var productIDValue =  Int()
    var shoutTextValue = String()
    var shoutsValue =  Int()
    var shoutimageValue =  String()
    
    //Array
    
    var valSHTPrice = [Any]()
    var valSHTCMIMG = [Any]()
    var valSHTMrgAmnt = [Any]()
    var valSHTPrdtNam = [Any]()
    var valSHTMRPAmt = [Any]()
    var valSHTSaveAmt = [Any]()
    var valSHTOFFPrAmnt = [Any]()
    var valSHTMOQAmnt = [Any]()
    var valSHTTimCal = [Any]()
    var valSHTComTxt = [Any]()
    var valSHTIsExclus = [Any]()
    var valSHTIsExper = [Any]()
    var valSHTIsNew = [Any]()
    var valSHTIsComb = [Any]()
    var valSHTIsDeal = [Any]()
    var valSHTExpTxt = [Any]()
    var valSHTOFFerType = [Any]()
    var valSHTHasTake = [Any]()
    var valSHTIMGSent = [Any]()
    var valSHTOFFValue = [Any]()
    var valSHTinStocktValued = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnShout.addTarget(self, action: #selector(btnShoutAction), for: .touchUpInside)
        btnGallery.addTarget(self, action: #selector(btnGalleryAction), for: .touchUpInside)
        btnUPandDown.addTarget(self, action: #selector(btnUPandDownAction), for: .touchUpInside)
        bottomView.isUserInteractionEnabled = true
        
        tableList.delegate = self
        tableList.dataSource = self
        
        DispatchQueue.main.async {
            self.shoutApi()
        }
    }
    
    @IBAction func btnBackPopAction(_ sender: UIButton) {
    
       self.dismiss(animated: true, completion: nil)
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.valNameOFP.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: shoutOffCell = tableList.dequeueReusableCell(withIdentifier: "shoutOffCell") as! shoutOffCell
        cell.shareView.layer.borderColor = UIColor.lightGray.cgColor
        cell.shareView.layer.borderWidth = 1.0
        cell.shareView.layer.cornerRadius = 5.0
        cell.lblProfileName.text = self.valNameOFP[indexPath.row] as? String
        cell.lblComentShare.text = self.valdComnts[indexPath.row] as? String
        cell.lblDesignation.text = self.valSUbj[indexPath.row] as? String
        let straCommentrd: Int = (self.valdComnts[indexPath.row] as? Int)!
        cell.lblCommentCount.text = String(straCommentrd)
        let strashared: Int = (self.valdSaved[indexPath.row] as? Int)!
        cell.lblShareCount.text = String(strashared)
        let straLiked: Int = (self.valdLikeSS[indexPath.row] as? Int)!
        cell.lblLikesCount.text = String(straLiked)
        let strShoutedVA: Int = (self.valSHOUTS[indexPath.row] as? Int)!
        cell.lblShoutCount.text = String(strShoutedVA)
        let straSaved: Int = (self.valdSaved[indexPath.row] as? Int)!
        cell.lblSaveCount.text = String(straSaved)
        
        cell.lblProductTitle.text = self.valSHTPrdtNam[indexPath.row] as? String
        cell.lblMRPandMOQ.text = self.valSHTMRPAmt[indexPath.row] as? String
        cell.lblFinalPrice.text = self.valSHTOFFPrAmnt[indexPath.row] as? String
        cell.lblStrikePrice.text = self.valSHTMOQAmnt[indexPath.row] as? String
        cell.lblPercentage.text = self.valSHTMrgAmnt[indexPath.row] as? String
        cell.lblDaysRestock.text = self.valSHTOFFValue[indexPath.row] as? String
        cell.lblInstock.text = self.valSHTinStocktValued[indexPath.row] as? String
        
      if let strValImg: String = self.valSHTIMGSent[indexPath.row] as? String {
           let url = URL(string: strValImg)
           let data = try? Data(contentsOf: url!)

             if let imageData = data {
                let image = UIImage(data: imageData)
                cell.imgProduct.image = image
             }
       }
        
        
        if let strNewVal: String = self.valSHTIsNew[indexPath.row] as? String {
            if strNewVal == "1" {
              cell.imgNew.isHidden = false
            }else {
              cell.imgNew.isHidden = true
            }
        }
        
        if let strOfferVal: String = self.valSHTOFFerType[indexPath.row] as? String {
            if strOfferVal == "1" {
                cell.imgOffer.isHidden = false
            }else {
                cell.imgOffer.isHidden = true
            }
        }
        
        if let strExcluseVal: String = self.valSHTIsExclus[indexPath.row] as? String {
            if strExcluseVal == "1" {
                cell.imgOffer.isHidden = false
            }else {
                cell.imgOffer.isHidden = true
            }
        }
        
        if let strDealVal: String = self.valSHTIsDeal[indexPath.row] as? String {
            if strDealVal == "1" {
                cell.imgOffer.isHidden = false
            }else {
                cell.imgOffer.isHidden = true
            }
        }
        
        if let strExperVal: String = self.valSHTIsExper[indexPath.row] as? String {
            if strExperVal == "1" {
                cell.imgOffer.isHidden = false
            }else {
                cell.imgOffer.isHidden = true
            }
        }
    
        if let strComboVal: String = self.valSHTIsComb[indexPath.row] as? String {
            if strComboVal == "1" {
                cell.imgOffer.isHidden = false
            }else {
                cell.imgOffer.isHidden = true
            }
        }
        
        if let strHasTaeVal: String = self.valSHTHasTake[indexPath.row] as? String {
            if strHasTaeVal == "1" {
                cell.imgOffer.isHidden = false
            }else {
                cell.imgOffer.isHidden = true
            }
        }
        
        
        if let strISLikedVal: String = self.valdILike[indexPath.row] as? String {
            if strISLikedVal == "1" {
                cell.imgOffer.isHidden = false
            }else {
                cell.imgOffer.isHidden = true
            }
        }
        
        
        if let strIShoutedeVal: String = self.valISSht[indexPath.row] as? String {
            if strIShoutedeVal == "1" {
                cell.imgOffer.isHidden = false
            }else {
                cell.imgOffer.isHidden = true
            }
        }
        
        if let strUserLikVal: String = self.valdUserLike[indexPath.row] as? String {
            if strUserLikVal == "1" {
                cell.imgOffer.isHidden = false
            }else {
                cell.imgOffer.isHidden = true
            }
        }

        if let strUShotVal: String = self.valdIShot[indexPath.row] as? String {
            if strUShotVal == "1" {
                cell.imgOffer.isHidden = false
            }else {
                cell.imgOffer.isHidden = true
            }
        }
        
        if let strHasBroghtVal: String = self.valdHasBrBy[indexPath.row] as? String {
            if strHasBroghtVal == "1" {
                cell.imgOffer.isHidden = false
            }else {
                cell.imgOffer.isHidden = true
            }
        }
        
        
        
        
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    @objc func btnShoutAction(sender: UIButton) {
        print("shout")
    }
    
    @objc func btnGalleryAction(sender: UIButton) {
        print("Gallery")
    }
    @objc func btnUPandDownAction(sender: UIButton) {
        print("UpandDown")
    }
    
    func shoutApi()  {
        
        let defaulst = UserDefaults.standard
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlShotData)!)
        request.httpMethod = "POST"
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.EditprofiledescriptionViewall = Reviewfinaluseroid
        }
        if let valuev: String = defaulst.value(forKey: "Myauthorisation")as?String{
            self.Myauthorisationstringfinalvalue = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NDg0MDAyOTYsImlzcyI6ImxvY2FsaG9zdCIsImV4cCI6MTU0ODQwMTE5NiwidXNlcklkIjoiQTcwMTUzIn0.obtej_YeFyD3M2zDRhcg7DrKc0PQOK1ewrIqCrar828"
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = "A70153"
        }
        let postStringone =  String(format: "Authorization=%@&AgentID=%@&agentid=%@&shoutId=%@",self.Myauthorisationstringfinalvalue, self.myagentTotalvalue,self.EditprofiledescriptionViewall,"1")
        print(postStringone)
        
        request.httpBody = postStringone.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.EditprofiledescriptionViewall, forHTTPHeaderField:"AgentID")
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                  
                    if let arrayList: [String: Any] = dict.value(forKey: "main") as? [String: Any] {
                        self.mainShoutVal = arrayList
                    }
                    
                    if let dictBrought: String = self.mainShoutVal["broughtBy"] as? String {
                        self.broughtPeople = dictBrought
                    }
                    self.valBroughtBy.append(self.broughtPeople)
                    
                    
                    if let shoutValued: String = self.mainShoutVal["isShout"] as? String {
                        self.isShoutValue = shoutValued
                    }
                    self.valdIShot.append(self.isShoutValue)
                    if let likeValued: String = self.mainShoutVal["isliked"] as? String {
                        self.isLikeValue = likeValued
                    }
                    self.valdILike.append(self.isLikeValue)
                    if let userlikeValued: String = self.mainShoutVal["isuserlike"] as? String {
                        self.isUserLikeValue = userlikeValued
                    }
                    self.valdUserLike.append(self.isUserLikeValue)
                    
                    if let uslikeValued: Int = self.mainShoutVal["likes"] as? Int {
                        self.likesValue = uslikeValued
                    }
                    self.valdLikeSS.append(self.likesValue)
                    
                    if let imgArrValued: [Any] = self.mainShoutVal["broughtByImages"] as? [Any] {
                        self.imgArray = imgArrValued
                    }
                    self.valdImgArray.append(self.imgArray)
                    if let imgValued: String = self.mainShoutVal["profileImage"] as? String {
                        self.imgProfile = imgValued
                    }
                    self.valdImgPro.append(self.imgProfile)
                    if let commentValued: [Any] = self.mainShoutVal["commentData"] as? [Any] {
                        self.commentDataValue = commentValued
                    }
                    self.valdComDat.append(self.commentDataValue)
                    
                    if let msgValued: String = self.mainShoutVal["message"] as? String {
                        self.msgSender = msgValued
                    }
                    self.valdMSG.append(self.msgSender)
                    if let msgValued: Int = self.mainShoutVal["comments"] as? Int {
                        self.commentvalue = msgValued
                    }
                    self.valdComnts.append(self.commentvalue)
                    
                    if let hbroughtValue: String = self.mainShoutVal["hasbroughtby"] as? String {
                        self.hasbroughtValue = hbroughtValue
                    }
                    self.valdHasBrBy.append(self.hasbroughtValue)
                    
                    if let sendValue: Int = self.mainShoutVal["saved"] as? Int {
                        self.savedValue = sendValue
                    }
                    self.valdSaved.append(self.savedValue)
                    
                    if let dictAdditional: [String: Any] = self.mainShoutVal["additionalData"] as? [String: Any] {
                        self.additionalDataValue = dictAdditional
                    }
                    self.valAddData.append(self.additionalDataValue)
                    
                    if let shoutValued: String = self.mainShoutVal["isShouted"] as? String {
                        self.isShoutedValue = shoutValued
                    }
                    self.valISSht.append(self.isShoutedValue)
                    if let nameProfile: String = self.mainShoutVal["name"] as? String {
                        self.profileName = nameProfile
                    }
                    self.valNameOFP.append(self.profileName)
                    if let valueSub: String = self.mainShoutVal["subject"] as? String {
                        self.subjectValue = valueSub
                    }
                    self.valSUbj.append(self.subjectValue)
                    
                    if let profileValue: Int = self.mainShoutVal["profileId"] as? Int {
                        self.profileIdValue = profileValue
                    }
                    self.valPrfID.append(self.profileIdValue)
                    
                    if let producteValue: Int = self.mainShoutVal["id"] as? Int {
                        self.productIDValue = producteValue
                    }
                    self.valAddID.append(self.productIDValue)
                    
                    if let shoutedValue: Int = self.mainShoutVal["shouts"] as? Int {
                        self.shoutsValue = shoutedValue
                    }
                    self.valSHOUTS.append(self.shoutsValue)
                    print(self.valSHOUTS)
                    if let shoutTypeValueSub: String = self.mainShoutVal["shoutType"] as? String {
                        self.shoutTypeValue = shoutTypeValueSub
                    }
                    self.valShtType.append(self.shoutTypeValue)
                    
                    if let shoutTextValueSub: String = self.mainShoutVal["shoutText"] as? String {
                        self.shoutTextValue = shoutTextValueSub
                    }
                    self.valShtTxt.append(self.shoutTextValue)
                    
                    if let shoutimageValueSub: String = self.mainShoutVal["shoutimage"] as? String {
                        self.shoutimageValue = shoutimageValueSub
                    }
                    self.valShtImg.append(self.shoutimageValue)
                    
                    if let dictValue: [String: Any] = self.mainShoutVal["shout"] as? [String: Any] {
                        self.shoutDict = dictValue
                    }
                    if let valuePrice : Int = self.shoutDict["price"] as? Int {
                        self.priceValue  = valuePrice
                    }
                    self.valSHTPrice.append(self.priceValue)
                    
                    if let dictVlaue: [Any] = self.shoutDict["comboimages"] as? [Any] {
                        self.comboArray = dictVlaue
                    }
                    self.valSHTCMIMG.append(self.comboArray)
                    if let dictMargin: String = self.shoutDict["margin"] as? String {
                        self.marginValue = dictMargin
                    }
                    self.valSHTMrgAmnt.append(self.marginValue)
                    
                    if let dictProduct: String = self.shoutDict["name"] as? String {
                        self.productName = dictProduct
                    }
                    self.valSHTPrdtNam.append(self.productName)
                    
                    if let dictMrp : String = self.shoutDict["mrp"] as? String {
                        self.mrpPrice  = dictMrp
                    }
                    self.valSHTMRPAmt.append(self.mrpPrice)
                    
                    if let dictSave: String = self.shoutDict["save_amount"] as? String {
                        self.saveAmount = dictSave
                    }
                    self.valSHTSaveAmt.append(self.saveAmount)
                    
                    if let dictPriceOff : String = self.shoutDict["off_price"] as? String {
                        self.offPrice  = dictPriceOff
                    }
                    self.valSHTOFFPrAmnt.append(self.offPrice)
                    
                    if let dictMOQ: String = self.shoutDict["moq"] as? String {
                        self.moqValue = dictMOQ
                    }
                    self.valSHTMOQAmnt.append(self.moqValue)
                    
                    if let dictTimer: String = self.shoutDict["time"] as? String {
                        self.timerValue = dictTimer
                    }
                    self.valSHTTimCal.append(self.timerValue)
                    if let dictCombo: String = self.shoutDict["combotext"] as? String {
                        self.comboNames = dictCombo
                    }
                    self.valSHTComTxt.append(self.comboNames)
                    
                    if let dictExclusive: String = self.shoutDict["isExclusive"] as? String {
                        self.isExclusive = dictExclusive
                    }
                    self.valSHTIsExclus.append(self.isExclusive)
                    if let dictExperied: String = self.shoutDict["isexperied"] as? String {
                        self.isExperied = dictExperied
                    }
                    self.valSHTIsExper.append(self.isExperied)
                    
                    if let dictNew: String = self.shoutDict["isnew"] as? String {
                        self.isNewValue = dictNew
                    }
                    self.valSHTIsNew.append(self.isNewValue)
                    
                    if let dictVNew: String = self.shoutDict["iscombo"] as? String {
                        self.isComboValue = dictVNew
                    }
                    self.valSHTIsComb.append(self.isComboValue)
                    
                    if let dictlValue: String = self.shoutDict["isDeal"] as? String {
                        self.isDealValue = dictlValue
                    }
                    self.valSHTIsDeal.append(self.isDealValue)
                    
                    if let dictxValue: String = self.shoutDict["experied_text"] as? String {
                        self.expText = dictxValue
                    }
                    self.valSHTExpTxt.append(self.expText)
                    
                    if let offsValue: String = self.shoutDict["Offer"] as? String {
                        self.offerValue = offsValue
                    }
                    self.valSHTOFFerType.append(self.offerValue)
                    
                    if let offTakesValue: String = self.shoutDict["hasofftake"] as? String {
                        self.hasOffTakeValue = offTakesValue
                    }
                    self.valSHTHasTake.append(self.hasOffTakeValue)
                    
                    if let imageDValue: String = self.shoutDict["image"] as? String {
                        self.imgValue = imageDValue
                    }
                    self.valSHTIMGSent.append(self.imgValue)
                    
                    if let OfftValue: String = self.shoutDict["Offtake"] as? String {
                        self.OfftakeValue = OfftValue
                    }
                    self.valSHTOFFValue.append(self.OfftakeValue)
                   
                    if let inStocktValue: String = self.shoutDict["inStock"] as? String {
                        self.inStocktValued = inStocktValue
                    }
                    self.valSHTinStocktValued.append(self.inStocktValued)
                    
                    
                    
                    if let arrayList: [Any] = dict.value(forKey: "list") as? [Any] {
                        self.listArray = arrayList
                    }
                     for i in 0 ..< self.listArray.count{
                        self.listDict  = self.listArray[i] as! [String : Any]
                        
                        if let valueBrought: String = self.listDict["broughtBy"] as? String {
                            self.broughtPeople = valueBrought
                        }
                        self.valBroughtBy.append(self.broughtPeople)
                    
                      if let dictValue: [String: Any] = self.listDict["shout"] as? [String: Any] {
                         self.shoutDict = dictValue
                        }
                        
                      if let valuePrice : Int = self.shoutDict["price"] as? Int {
                            self.priceValue  = valuePrice
                        }
                        self.valSHTPrice.append(self.priceValue)
                        
                      if let arrayVlaue: [Any] = self.shoutDict["comboimages"] as? [Any] {
                        self.comboArray = arrayVlaue
                      }
                        self.valSHTCMIMG.append(self.comboArray)
                      if let valueMargin: String = self.shoutDict["margin"] as? String {
                            self.marginValue = valueMargin
                        }
                        self.valSHTMrgAmnt.append(self.marginValue)
                        
                      if let valueProduct: String = self.shoutDict["name"] as? String {
                            self.productName = valueProduct
                        }
                        self.valSHTPrdtNam.append(self.productName)
        
                     if let priceMrp : String = self.shoutDict["mrp"] as? String {
                            self.mrpPrice  = priceMrp
                        }
                       self.valSHTMRPAmt.append(self.mrpPrice)
                        
                    if let amountSave: String = self.shoutDict["save_amount"] as? String {
                            self.saveAmount = amountSave
                        }
                        self.valSHTSaveAmt.append(self.saveAmount)

                    if let priceOff : String = self.shoutDict["off_price"] as? String {
                            self.offPrice  = priceOff
                        }
                        self.valSHTOFFPrAmnt.append(self.offPrice)
                        
                    if let valueMOQ: String = self.shoutDict["moq"] as? String {
                            self.moqValue = valueMOQ
                        }
                        self.valSHTMOQAmnt.append(self.moqValue)
                        
                    if let valueTimer: String = self.shoutDict["time"] as? String {
                            self.timerValue = valueTimer
                        }
                        self.valSHTTimCal.append(self.timerValue)
                    if let valueCombo: String = self.shoutDict["combotext"] as? String {
                            self.comboNames = valueCombo
                        }
                        self.valSHTComTxt.append(self.comboNames)

                    if let valueExclusive: String = self.shoutDict["isExclusive"] as? String {
                            self.isExclusive = valueExclusive
                        }
                        self.valSHTIsExclus.append(self.isExclusive)
                    if let valueExperied: String = self.shoutDict["isexperied"] as? String {
                            self.isExperied = valueExperied
                        }
                        self.valSHTIsExper.append(self.isExperied)

                    if let valueNew: String = self.shoutDict["isnew"] as? String {
                            self.isNewValue = valueNew
                        }
                        self.valSHTIsNew.append(self.isNewValue)

                    if let comboVNew: String = self.shoutDict["iscombo"] as? String {
                            self.isComboValue = comboVNew
                        }
                        self.valSHTIsComb.append(self.isComboValue)

                    if let dealValue: String = self.shoutDict["isDeal"] as? String {
                            self.isDealValue = dealValue
                        }
                        self.valSHTIsDeal.append(self.isDealValue)

                    if let expValue: String = self.shoutDict["experied_text"] as? String {
                            self.expText = expValue
                        }
                        self.valSHTExpTxt.append(self.expText)
                        
                    if let offValue: String = self.shoutDict["Offer"] as? String {
                            self.offerValue = offValue
                        }
                        self.valSHTOFFerType.append(self.offerValue)
                        
                    if let offTakeValue: String = self.shoutDict["hasofftake"] as? String {
                            self.hasOffTakeValue = offTakeValue
                        }
                        self.valSHTHasTake.append(self.hasOffTakeValue)
                        
                    if let imageDDValue: String = self.shoutDict["image"] as? String {
                            self.imgValue = imageDDValue
                        }
                        self.valSHTIMGSent.append(self.imgValue)
                     
                    if let OfftValue: String = self.shoutDict["Offtake"] as? String {
                            self.OfftakeValue = OfftValue
                        }
                        self.valSHTOFFValue.append(self.OfftakeValue)
                        
                    if let inStocktValue: String = self.shoutDict["inStock"] as? String {
                            self.inStocktValued = inStocktValue
                        }
                        self.valSHTinStocktValued.append(self.inStocktValued)
                        
                        
                    if let shoutValued: String = self.listDict["isShout"] as? String {
                            self.isShoutValue = shoutValued
                        }
                        self.valdIShot.append(self.isShoutValue)
                    if let likeValued: String = self.listDict["isliked"] as? String {
                            self.isLikeValue = likeValued
                        }
                        self.valdILike.append(self.isLikeValue)
                    if let userlikeValued: String = self.listDict["isuserlike"] as? String {
                            self.isUserLikeValue = userlikeValued
                        }
                        self.valdUserLike.append(self.isUserLikeValue)
                    
                    if let uslikeValued: Int = self.listDict["likes"] as? Int {
                            self.likesValue = uslikeValued
                        }
                        self.valdLikeSS.append(self.likesValue)
                        
                    if let imgArrValued: [Any] = self.listDict["broughtByImages"] as? [Any] {
                            self.imgArray = imgArrValued
                        }
                        self.valdImgArray.append(self.imgArray)
                    if let imgValued: String = self.listDict["profileImage"] as? String {
                            self.imgProfile = imgValued
                        }
                        self.valdImgPro.append(self.imgProfile)
                    if let commentValued: [Any] = self.listDict["commentData"] as? [Any] {
                            self.commentDataValue = commentValued
                        }
                        self.valdComDat.append(self.commentDataValue)
                        
                    if let msgValued: String = self.listDict["message"] as? String {
                            self.msgSender = msgValued
                        }
                        self.valdMSG.append(self.msgSender)
                    if let msgValued: Int = self.listDict["comments"] as? Int {
                            self.commentvalue = msgValued
                        }
                        self.valdComnts.append(self.commentvalue)

                        
                    if let hbroughtValue: String = self.listDict["hasbroughtby"] as? String {
                            self.hasbroughtValue = hbroughtValue
                        }
                        self.valdHasBrBy.append(self.hasbroughtValue)

                    if let sendValue: Int = self.listDict["saved"] as? Int {
                            self.savedValue = sendValue
                        }
                        self.valdSaved.append(self.savedValue)
                        
                    if let dictAdditional: [String: Any] = self.listDict["additionalData"] as? [String: Any] {
                            self.additionalDataValue = dictAdditional
                        }
                        self.valAddData.append(self.additionalDataValue)
                        
                    if let shoutValued: String = self.listDict["isShouted"] as? String {
                            self.isShoutedValue = shoutValued
                        }
                        self.valISSht.append(self.isShoutedValue)
                    if let nameProfile: String = self.listDict["name"] as? String {
                            self.profileName = nameProfile
                        }
                        self.valNameOFP.append(self.profileName)
                    if let valueSub: String = self.listDict["subject"] as? String {
                            self.subjectValue = valueSub
                        }
                        self.valSUbj.append(self.subjectValue)

                    if let profileValue: Int = self.listDict["profileId"] as? Int {
                            self.profileIdValue = profileValue
                        }
                        self.valPrfID.append(self.profileIdValue)

                    if let producteValue: Int = self.listDict["id"] as? Int {
                            self.productIDValue = producteValue
                        }
                        self.valAddID.append(self.productIDValue)

                    if let shoutedValue: Int = self.listDict["shouts"] as? Int {
                            self.shoutsValue = shoutedValue
                        }
                        self.valSHOUTS.append(self.shoutsValue)

                        print(self.valSHOUTS)
                    if let shoutTypeValueSub: String = self.listDict["shoutType"] as? String {
                            self.shoutTypeValue = shoutTypeValueSub
                        }
                        self.valShtType.append(self.shoutTypeValue)

                    if let shoutTextValueSub: String = self.listDict["shoutText"] as? String {
                            self.shoutTextValue = shoutTextValueSub
                        }
                        self.valShtTxt.append(self.shoutTextValue)

                    if let shoutimageValueSub: String = self.listDict["shoutimage"] as? String {
                            self.shoutimageValue = shoutimageValueSub
                        }
                        self.valShtImg.append(self.shoutimageValue)
                    }
                    DispatchQueue.main.async {
                        self.tableList.reloadData()
                    }
                }
                break
                
            case .failure(_):
                print("anilreddy")
            }
            
        }
    }
    
    @IBAction func btnSaveShoutAction(_ sender: Any) {
 
    self.viewShareButon.isHidden = true
        
    }
    
    
    @IBAction func btnCopyLAction(_ sender: Any) {
    
    
        self.viewShareButon.isHidden = true

    
    }
    
    @IBAction func btnShareChatAction(_ sender: Any) {
   
        self.viewShareButon.isHidden = true

    }
    
    @IBAction func btnShareVIAction(_ sender: Any) {
        
        self.viewShareButon.isHidden = true
        
    }
    
}
