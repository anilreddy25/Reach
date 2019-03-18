//
//  editShareVC.swift
//  AgentRestocks
//
//  Created by apple on 1/21/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire


class editShareVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableList: UITableView!
    
    var useridbiling =  String()
    var Myauthorisationstringfinalvalue =  String()
    var myagentTotalvalue =  String()
    
    
    var shareValue = [Any]()
    var statusValue = String()
    var statusDict = [String: Any]()
    
    
    
    //Likes
    var sHRStatusName = String()
    var sHRProfileIdVal = String()
    var sHRProfileImgVal = String()
    var sHRBroughtVal = String()
    var sHRSubjectCust = String()
    var sHRIsUserLiked = String()
    var sHRSendTime = String()
    var sHRMsgValue = String()
    var sHRShoutType = Int()
    var sHRBroughtBYval = String()
    var sHRCountComments = String()
    var sHRCountLikes =  String()
    var sHRCountShouts = String()
    var sHRCountSaves = String()
    var sHRIsLikedVal = Int()
    var sHRIsShoutedVal = Int()
    var sHRShoutTestVal = String()
    var sHRShotImgVal = String()
    var sHRBroughtImgVal = [Any]()
    var sHRShoutListVal = NSDictionary()
    var sHRCommentData = [Any]()
    var sHRAdditionData = [String: Any]()
    var sHRAddOffTake = String()
    //Like shout Dict
    var sHRIsExclusiveAdd = String()
    var sHRIsNewAdd = String()
    var sHROfferValr = String()
    var sHRNameOfProd = String()
    var sHRImgNamed = String()
    var sHRMrpValue = String()
    var sHRMoqValue = String()
    var sHROffPriceVsalu = String()
    var sHRPriceNormal = String()
    var sHRMarginValue = String()
    var sHRTiemrRel = String()
    var sHRIsDealVal = String()
    var sHRIsExperVal = String()
    var sHRExpText = String()
    var sHRIsCOMboVla = String()
    var sHRSaveAMountVal = String()
    var sHRComboTestVal = String()
    var sHRComboImgVal = [Any]()
    var sHRHsaOffTake = String()
    
    var sHRName = [Any]()
    var sHRProfID = [Any]()
    var sHRProfImg = [Any]()
    var sHRHasBroght = [Any]()
    var sHRISSHOt = [Any]()
    var sHRSUB = [Any]()
    var sHRISUSer = [Any]()
    var sHRTime = [Any]()
    var sHRMSG = [Any]()
    var sHRTYPe = [Any]()
    var sHRBroghBY = [Any]()
    var sHRComent = [Any]()
    var sHRLike = [Any]()
    var sHRSHOTS = [Any]()
    var sHRSAVed = [Any]()
    var sHRISLIKE = [Any]()
    var sHRISSHTED = [Any]()
    var sHRISSHTEXT = [Any]()
    var sHRSHTIMG = [Any]()
    var sHRADDOff = [Any]()
    var sHRADDComentData = [Any]()
    var sHRBroghtIMG = [Any]()
    var sHREXClVal = [Any]()
    var sHRMRP = [Any]()
    var sHRISNewM = [Any]()
    var sHROFFESHT = [Any]()
    var sHRNameProd = [Any]()
    var sHRProdIMG = [Any]()
    var sHRMOQV = [Any]()
    var sHROFFPRic = [Any]()
    var sHRPRicProd = [Any]()
    var sHRMArgVAl = [Any]()
    var sHRTImeVal = [Any]()
    var sHRISDeal = [Any]()
    var sHRISEXP = [Any]()
    var sHREXPTxt = [Any]()
    var sHRCOMBVal = [Any]()
    var sHRSaveAMnt = [Any]()
    var sHRCOMBTxtt = [Any]()
    var sHRCMBIMGSS = [Any]()
    var sHRHasTakOfS = [Any]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableList.delegate = self
        tableList.dataSource = self
        
        DispatchQueue.main.async {
            self.editShareShowData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shareValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : editShareCell = tableList.dequeueReusableCell(withIdentifier: "editShareCell") as! editShareCell
//        cell.viewProduct.layer.cornerRadius = 5.0
//        cell.viewProduct.layer.borderWidth = 1.0
//        cell.viewProduct.layer.borderColor = UIColor.lightGray.cgColor
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    func editShareShowData()  {
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlMarketShout)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
//        if let Reviewfinaluseroid:String = dafaults.value(forKey: "MyLoginfinalvalue")as?String
//        {
//            self.useridbiling = Reviewfinaluseroid
//        }
//        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
//        {
//            self.Myauthorisationstringfinalvalue = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NDc4MDY3MzAsImlzcyI6ImxvY2FsaG9zdCIsImV4cCI6MTU0NzgwNzYzMCwidXNlcklkIjoiQTcwMTUzIn0.QptNzqOxSEBYm_42oyj33Tt5S2hOVe-S0Kj8qBI9UNg"
//        }
        
        
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }

        
        
        
        
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = "A70153"
        }
        let postStringfinlavalue =  String(format: "method=%@&agentid=%@&userid=%@&type=%@","getsamplemarketshouts","69948","69948","shout")
        
        
        
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling, forHTTPHeaderField:"AgentID")
        
        request.httpBody = postStringfinlavalue.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    if let statValue = dict.value(forKey: "Status")as? String {
                        self.statusValue = statValue
                    }
                    
                    if let Value:[Any] = dict.value(forKey: "shares")as? [Any]{
                        self.shareValue = Value
                    }
                    for i in 0 ..< self.shareValue.count {
                        if let dictValue: [String : Any] = self.shareValue[i] as? [String : Any]{
                            self.statusDict = (dictValue as? [String : Any])!
                        }
                        
                        if let valueName: String = self.statusDict["name"] as? String {
                            self.sHRStatusName = valueName
                        }
                        self.sHRName.append(self.sHRStatusName)
                        
                        
                        if let valueProfileIdVal: String = self.statusDict["profileId"] as? String {
                            self.sHRProfileIdVal = valueProfileIdVal
                        }
                        self.sHRProfID.append(self.sHRProfileIdVal)
                        
                        if let valueProfileImg: String = self.statusDict["profileImage"] as? String {
                            self.sHRProfileImgVal = valueProfileImg
                        }
                        self.sHRProfImg.append(self.sHRProfileImgVal)
                        
                        if let valueBrought: String = self.statusDict["hasbroughtby"] as? String {
                            self.sHRBroughtVal = valueBrought
                        }
                        
                        self.sHRHasBroght.append(self.sHRBroughtVal)
                        
                        
                        if let valueIsShouted: Int = self.statusDict["isShout"] as? Int {
                            self.sHRIsShoutedVal = valueIsShouted
                        }
                        self.sHRISSHOt.append(self.sHRIsShoutedVal)
                        
                        if let valueSubjectCust: String  = self.statusDict["subject"] as? String {
                            self.sHRSubjectCust = valueSubjectCust
                        }
                        self.sHRSUB.append(self.sHRSubjectCust)
                        
                        if let valueUserLiked: String  = self.statusDict["isuserlike"] as? String {
                            self.sHRIsUserLiked = valueUserLiked
                        }
                        self.sHRISUSer.append(self.sHRIsUserLiked)
                        
                        if let valueTimer: String  = self.statusDict["time"] as? String {
                            self.sHRSendTime = valueTimer
                        }
                        self.sHRTime.append(self.sHRSendTime)
                        
                        if let valueMsgValue: String  = self.statusDict["message"] as? String {
                            self.sHRMsgValue = valueMsgValue
                        }
                        self.sHRMSG.append(self.sHRMsgValue)
                        
                        if let valueShoutType: Int  = self.statusDict["shoutType"] as? Int {
                            self.sHRShoutType = valueShoutType
                        }
                        self.sHRTYPe.append(self.sHRShoutType)
                        
                        if let valueBroughtBYval: String  = self.statusDict["broughtBy"] as? String {
                            self.sHRBroughtBYval = valueBroughtBYval
                        }
                        self.sHRBroghBY.append(self.sHRBroughtBYval)
                        
                        if let valueCountComment: String  = self.statusDict["comments"] as? String {
                            self.sHRCountComments = valueCountComment
                        }
                        self.sHRComent.append(self.sHRCountComments)
                        
                        if let valueCountLikes: String  = self.statusDict["likes"] as? String {
                            self.sHRCountLikes = valueCountLikes
                        }
                        self.sHRLike.append(self.sHRCountLikes)
                        
                        if let valueCountsht: String  = self.statusDict["shouts"] as? String {
                            self.sHRCountShouts = valueCountsht
                        }
                        self.sHRSHOTS.append(self.sHRCountShouts)
                        
                        if let valueCountSav: String  = self.statusDict["saved"] as? String {
                            self.sHRCountSaves = valueCountSav
                        }
                        self.sHRSAVed.append(self.sHRCountSaves)
                        
                        if let valueIsLiK: Int  = self.statusDict["isliked"] as? Int {
                            self.sHRIsLikedVal = valueIsLiK
                        }
                        self.sHRISLIKE.append(self.sHRIsLikedVal)
                        
                        
                        if let valueIsShoutedVal: Int  = self.statusDict["isShouted"] as? Int {
                            self.sHRIsShoutedVal = valueIsShoutedVal
                        }
                        self.sHRISSHTED.append(self.sHRIsShoutedVal)
                      
                        
                        if let valueShoutText: String  = self.statusDict["shoutText"] as? String {
                            self.sHRShoutTestVal = valueShoutText
                        }
                        self.sHRISSHTEXT.append(self.sHRShoutTestVal)
                        
                        if let valueImgNamed: String  = self.statusDict["shoutimage"] as? String {
                            self.sHRShotImgVal = valueImgNamed
                        }
                        self.sHRSHTIMG.append(self.sHRShotImgVal)
                        
                        if let valueImgNamed: [String: Any]  = self.statusDict["additionalData"] as? [String: Any] {
                            self.sHRAdditionData = valueImgNamed
                        }
                        //comAddOffTake
                        if let comAddOff : String = self.sHRAdditionData["Offtake"] as? String{
                            self.sHRAddOffTake = comAddOff
                        }
                        self.sHRADDOff.append(self.sHRAddOffTake)
                        
                        if let valueCommentData: [Any]  = self.statusDict["commentData"] as? [Any] {
                            self.sHRCommentData = valueCommentData
                        }
                        self.sHRADDComentData.append(self.sHRCommentData)
                        
                        if let valueBroughtImage: [Any]  = self.statusDict["broughtByImages"] as? [Any] {
                            self.sHRBroughtImgVal = valueBroughtImage
                        }
                        self.sHRBroghtIMG.append(self.sHRBroughtImgVal)
                        
                        if let valueShoutListVal: NSDictionary  = self.statusDict["shout"] as? NSDictionary {
                            self.sHRShoutListVal = valueShoutListVal
                        }
                        
                        if let comShoutExclusive: String = self.sHRShoutListVal["isExclusive"] as? String {
                            self.sHRIsExclusiveAdd = comShoutExclusive
                        }
                        self.sHREXClVal.append(self.sHRIsExclusiveAdd)
                        
                        if let comShoutMrpValue: String = self.sHRShoutListVal["mrp"] as? String {
                            self.sHRMrpValue = comShoutMrpValue
                        }
                        self.sHRMRP.append(self.sHRMrpValue)
                        
                        if let comShoutNew: String = self.sHRShoutListVal["isnew"] as? String {
                            self.sHRIsNewAdd = comShoutNew
                        }
                        self.sHRISNewM.append(self.sHRIsNewAdd)
                        
                        if let comShoutOffer: String = self.sHRShoutListVal["Offer"] as? String {
                            self.sHROfferValr = comShoutOffer
                        }
                        self.sHROFFESHT.append(self.sHROfferValr)
                        
                        if let comShoutNameofPD: String = self.sHRShoutListVal["name"] as? String {
                            self.sHRNameOfProd = comShoutNameofPD
                        }
                        self.sHRNameProd.append(self.sHRNameOfProd)
                        
                        if let comShoutImgNamed: String = self.sHRShoutListVal["image"] as? String {
                            self.sHRImgNamed = comShoutImgNamed
                        }
                        self.sHRProdIMG.append(self.sHRImgNamed)
                        
                        if let comShoutMoqValue: String = self.sHRShoutListVal["moq"] as? String {
                            self.sHRMoqValue = comShoutMoqValue
                        }
                        self.sHRMOQV.append(self.sHRMoqValue)
                        
                        if let comShoutMoqValue: String = self.sHRShoutListVal["off_price"] as? String {
                            self.sHROffPriceVsalu = comShoutMoqValue
                        }
                        self.sHROFFPRic.append(self.sHROffPriceVsalu)
                        
                        if let comShoutPriceNormal: String = self.sHRShoutListVal["price"] as? String {
                            self.sHRPriceNormal = comShoutPriceNormal
                        }
                        self.sHRPRicProd.append(self.sHRPriceNormal)
                        
                        if let comShoutMarginValue: String = self.sHRShoutListVal["margin"] as? String {
                            self.sHRMarginValue = comShoutMarginValue
                        }
                        self.sHRMArgVAl.append(self.sHRMarginValue)
                        
                        if let comShoutTiemrRel: String = self.sHRShoutListVal["time"] as? String {
                            self.sHRTiemrRel = comShoutTiemrRel
                        }
                        self.sHRTImeVal.append(self.sHRTiemrRel)
                        
                        if let comShoutIsDealVal: String = self.sHRShoutListVal["isDeal"] as? String {
                            self.sHRIsDealVal = comShoutIsDealVal
                        }
                        self.sHRISDeal.append(self.sHRIsDealVal)
                        
                        if let comShoutIsExperVal: String = self.sHRShoutListVal["isexperied"] as? String {
                            self.sHRIsExperVal = comShoutIsExperVal
                        }
                        self.sHRISEXP.append(self.sHRIsExperVal)
                        
                        if let comShoutExpText: String = self.sHRShoutListVal["experied_text"] as? String {
                            self.sHRExpText = comShoutExpText
                        }
                        
                        self.sHREXPTxt.append(self.sHRExpText)
                        
                        if let comShoutIsCOMboVla: String = self.sHRShoutListVal["iscombo"] as? String {
                            self.sHRIsCOMboVla = comShoutIsCOMboVla
                        }
                        self.sHRCOMBVal.append(self.sHRIsCOMboVla)
                        
                        
                        if let comShoutSaveAMount: String = self.sHRShoutListVal["save_amount"] as? String {
                            self.sHRSaveAMountVal = comShoutSaveAMount
                        }
                        self.sHRSaveAMnt.append(self.sHRSaveAMountVal)
                        
                        
                        if let comShoutComboTest: String = self.sHRShoutListVal["combotext"] as? String {
                            self.sHRComboTestVal = comShoutComboTest
                        }
                        self.sHRCOMBTxtt.append(self.sHRComboTestVal)
                        
                        if let comShoutComboImgVal: [Any] = self.sHRShoutListVal["comboimages"] as? [Any] {
                            self.sHRComboImgVal = comShoutComboImgVal
                        }
                        self.sHRCMBIMGSS.append(self.sHRComboImgVal)
                        
                        if let comShoutHsaOffTake: String = self.sHRShoutListVal["hasofftake"] as? String {
                            self.sHRHsaOffTake = comShoutHsaOffTake
                        }
                        self.sHRHasTakOfS.append(self.sHRHsaOffTake)
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
