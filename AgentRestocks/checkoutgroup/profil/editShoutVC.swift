//
//  editShoutVC.swift
//  AgentRestocks
//
//  Created by apple on 1/21/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire


class editShoutVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableList: UITableView!
    
    
    var useridbiling =  String()
    var Myauthorisationstringfinalvalue =  String()
    var myagentTotalvalue =  String()
    
    
    var shoutsValue = [Any]()
    var statusValue = String()
    var statusDict = [String: Any]()
    
    var shotStatusName = String()
    var shotProfileIdVal = String()
    var shotProfileImgVal = String()
    var shotBroughtVal = String()
    var shotSubjectCust = String()
    var shotIsUserLiked = String()
    var shotSendTime = String()
    var shotMsgValue = String()
    var shotShoutType = Int()
    var shotBroughtBYval = String()
    var shotCountComments = String()
    var shotCountLikes =  String()
    var shotCountShouts = String()
    var shotCountSaves = String()
    var shotIsLikedVal = Int()
    var shotIsShoutedVal = Int()
    var shotShoutTestVal = String()
    var shotShotImgVal = String()
    var shotBroughtImgVal = [Any]()
    var shotShoutListVal = NSDictionary()
    var shotCommentData = [Any]()
    var shotAdditionData = [String: Any]()
    var shotAddOffTake = String()
    
    
    var shtName = [Any]()
    var shtProfID = [Any]()
    var shtProfImg = [Any]()
    var shtHasBroght = [Any]()
    var shtISSHOt = [Any]()
    var shtSUB = [Any]()
    var shtISUSer = [Any]()
    var shtTime = [Any]()
    var shtMSG = [Any]()
    var shtBroghBY = [Any]()
    var shtTYPe = [Any]()
    var shtComent = [Any]()
    var shtLike = [Any]()
    var shtSHOTS = [Any]()
    var shtSAVed = [Any]()
    var shtISLIKE = [Any]()
    var shtISSHTED = [Any]()
    var shtISSHTEXT = [Any]()
    var shtSHTIMG = [Any]()
    var shtADDOff = [Any]()
    var shtADDComentData = [Any]()
    var shtBroghtIMG = [Any]()
    var shtEXClVal = [Any]()
    var shtMRP = [Any]()
    var shtISNewM = [Any]()
    var shtOFFESHT = [Any]()
    var shtNameProd = [Any]()
    var shtProdIMG = [Any]()
    var shtMOQV = [Any]()
    var shtOFFPRic = [Any]()
    var shtPRicProd = [Any]()
    var shtMArgVAl = [Any]()
    var shtTImeVal = [Any]()
    var shtISDeal = [Any]()
    var shtISEXP = [Any]()
    var shtEXPTxt = [Any]()
    var shtCOMBVal = [Any]()
    var shtSaveAMnt = [Any]()
    var shtCOMBTxtt = [Any]()
    var shtCMBIMGSS = [Any]()
    var shtHasTakOfS = [Any]()
    
    //Like shout Dict
    var shotIsExclusiveAdd = String()
    var shotIsNewAdd = String()
    var shotOfferValr = String()
    var shotNameOfProd = String()
    var shotImgNamed = String()
    var shotMrpValue = String()
    var shotMoqValue = String()
    var shotOffPriceVsalu = String()
    var shotPriceNormal = String()
    var shotMarginValue = String()
    var shotTiemrRel = String()
    var shotIsDealVal = String()
    var shotIsExperVal = String()
    var shotExpText = String()
    var shotIsCOMboVla = String()
    var shotSaveAMountVal = String()
    var shotComboTestVal = String()
    var shotComboImgVal = [Any]()
    var shotHsaOffTake = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableList.delegate = self
        tableList.dataSource = self
        
        DispatchQueue.main.async {
            self.editShoutShowData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shoutsValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : editShoutCell = tableList.dequeueReusableCell(withIdentifier: "editShoutCell") as! editShoutCell
        cell.lblProfile.text = (self.shtName[indexPath.row] as! String)
        cell.lblSenderTime.text = self.shtTime[indexPath.row] as? String
        cell.lblDistributor.text = self.shtSUB[indexPath.row] as? String
     
        let url = URL(string: (self.shtProfImg[indexPath.row] as? String)!)
//        let data = try? Data(contentsOf: url!)
//
//        if let imageData = data {
//            let imageVal = UIImage(data: imageData)
//            cell.imgProfile.image = imageVal
//        }
        
        
        cell.imgProfile?.sd_setImage(with: url) { (image, error, cache, urls) in
            if (error != nil) {
                cell.imgProfile.image = #imageLiteral(resourceName: "default_img")
            } else {
                cell.imgProfile.image = image
            }
        }
        cell.imgProfile.layer.borderWidth = 1
        cell.imgProfile.layer.masksToBounds = false
        cell.imgProfile.layer.borderColor = UIColor.black.cgColor
        cell.imgProfile.layer.cornerRadius = cell.imgProfile.frame.height/2
        cell.imgProfile.clipsToBounds = true
        
        
        
        cell.lblProductName.text = self.shtNameProd[indexPath.row] as? String
        
        let urlType = URL(string: (self.shtProdIMG[indexPath.row] as? String)!)
        cell.imgProductShout?.sd_setImage(with: urlType) { (image, error, cache, urls) in
            if (error != nil) {
                cell.imgProductShout.image = #imageLiteral(resourceName: "default_img")
            } else {
                cell.imgProductShout.image = image
            }
        }
        
        
        
        cell.lblMRPPrice.text = self.shtMRP[indexPath.row] as? String
        cell.lblStrikePrice.text = self.shtMOQV[indexPath.row] as? String
        cell.lblPercentMargin.text = self.shtMArgVAl[indexPath.row] as? String
        cell.lblDays.text = self.shtADDOff[indexPath.row] as? String
        cell.lblOutletBought.text = self.shtBroghBY[indexPath.row] as? String
        cell.lblSenderMsg.text = self.shtMSG[indexPath.row] as? String

       
        
        cell.lblCommentCount.text = self.shtComent[indexPath.row] as? String
        cell.lblShare.text = self.shtSAVed[indexPath.row] as? String
        cell.lblLikes.text = self.shtLike[indexPath.row] as? String
        cell.lblShoutCount.text = self.shtSHOTS[indexPath.row] as? String
        cell.lblSaveCount.text = self.shtSAVed[indexPath.row] as? String
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
//        let shotData: shoutVC = self.storyboard?.instantiateViewController(withIdentifier: "shoutVC") as! shoutVC
//        shotData.listArray = self.shoutsValue
//        self.present(shotData, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    func editShoutShowData() {
    
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlMarketShout)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
//            self.Myauthorisationstringfinalvalue = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NDc4MDY3MzAsImlzcyI6ImxvY2FsaG9zdCIsImV4cCI6MTU0NzgwNzYzMCwidXNlcklkIjoiQTcwMTUzIn0.QptNzqOxSEBYm_42oyj33Tt5S2hOVe-S0Kj8qBI9UNg"

        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
           // self.myagentTotalvalue = "A70153"

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
                    if let validShout: [Any] = dict.value(forKey: "shouts")as? [Any] {
                        self.shoutsValue = validShout
                    }
                    for i in 0 ..< self.shoutsValue.count {
                        if let dictValue: NSDictionary = self.shoutsValue[i] as? NSDictionary{
                            self.statusDict = (dictValue as? [String : Any])!
                        }
                        
                        if let valueName: String = self.statusDict["name"] as? String {
                            self.shotStatusName = valueName
                        }
                        self.shtName.append(self.shotStatusName)
                        
                        if let valueProfileIdVal: String = self.statusDict["profileId"] as? String {
                            self.shotProfileIdVal = valueProfileIdVal
                        }
                        self.shtProfID.append(self.shotProfileIdVal)
                        
                        if let valueProfileImg: String = self.statusDict["profileImage"] as? String {
                            self.shotProfileImgVal = valueProfileImg
                        }
                        self.shtProfImg.append(self.shotProfileImgVal)
                        
                        if let valueBrought: String = self.statusDict["hasbroughtby"] as? String {
                            self.shotBroughtVal = valueBrought
                        }
                        self.shtHasBroght.append(self.shotBroughtVal)
                        
                        if let valueIsShouted: Int = self.statusDict["isShout"] as? Int {
                            self.shotIsShoutedVal = valueIsShouted
                        }
                        self.shtISSHOt.append(self.shotIsShoutedVal)
                        
                        if let valueSubjectCust: String  = self.statusDict["subject"] as? String {
                            self.shotSubjectCust = valueSubjectCust
                        }
                        self.shtSUB.append(self.shotSubjectCust)
                        
                        if let valueUserLiked: String  = self.statusDict["isuserlike"] as? String {
                            self.shotIsUserLiked = valueUserLiked
                        }
                        self.shtISUSer.append(self.shotIsUserLiked)
                        
                        if let valueTimer: String  = self.statusDict["time"] as? String {
                            self.shotSendTime = valueTimer
                        }
                        self.shtTime.append(self.shotSendTime)
                        
                        if let valueMsgValue: String  = self.statusDict["message"] as? String {
                            self.shotMsgValue = valueMsgValue
                        }
                        self.shtMSG.append(self.shotMsgValue)
                        
                        if let valueShoutType: Int  = self.statusDict["shoutType"] as? Int {
                            self.shotShoutType = valueShoutType
                        }
                        self.shtTYPe.append(self.shotShoutType)
                        
                        if let valueBroughtBYval: String  = self.statusDict["broughtBy"] as? String {
                            self.shotBroughtBYval = valueBroughtBYval
                        }
                        self.shtBroghBY.append(self.shotBroughtBYval)
                        
                        if let valueCountComment: String  = self.statusDict["comments"] as? String {
                            self.shotCountComments = valueCountComment
                        }
                        self.shtComent.append(self.shotCountComments)
                        
                        if let valueCountLikes: String  = self.statusDict["likes"] as? String {
                            self.shotCountLikes = valueCountLikes
                        }
                        self.shtLike.append(self.shotCountLikes)
                        
                        if let valueCountsht: String  = self.statusDict["shouts"] as? String {
                            self.shotCountShouts = valueCountsht
                        }
                        self.shtSHOTS.append(self.shotCountShouts)
                        
                        if let valueCountSav: String  = self.statusDict["saved"] as? String {
                            self.shotCountSaves = valueCountSav
                        }
                        self.shtSAVed.append(self.shotCountSaves)
                        
                        
                        if let valueIsLiK: Int  = self.statusDict["isliked"] as? Int {
                            self.shotIsLikedVal = valueIsLiK
                        }
                        self.shtISLIKE.append(self.shotIsLikedVal)
                        
                        
                        if let valueIsShoutedVal: Int  = self.statusDict["isShouted"] as? Int {
                            self.shotIsShoutedVal = valueIsShoutedVal
                        }
                        self.shtISSHTED.append(self.shotIsShoutedVal)
                        
                        
                        if let valueShoutText: String  = self.statusDict["shoutText"] as? String {
                            self.shotShoutTestVal = valueShoutText
                        }
                        self.shtISSHTEXT.append(self.shotShoutTestVal)
                        
                        if let valueImgNamed: String  = self.statusDict["shoutimage"] as? String {
                            self.shotShotImgVal = valueImgNamed
                        }
                        
                        self.shtSHTIMG.append(self.shotShotImgVal)
                        
                        if let valueImgNamed: [String: Any]  = self.statusDict["additionalData"] as? [String: Any] {
                            self.shotAdditionData = valueImgNamed
                        }
                        
                        //shoutAddOffTake
                        
                        if let comAddOff : String = self.shotAdditionData["Offtake"] as? String{
                            self.shotAddOffTake = comAddOff
                        }
                        self.shtADDOff.append(self.shotAddOffTake)
                        
                        if let valueCommentData: [Any]  = self.statusDict["commentData"] as? [Any] {
                            self.shotCommentData = valueCommentData
                        }
                        self.shtADDComentData.append(self.shotCommentData)
                        
                        if let valueBroughtImage: [Any]  = self.statusDict["broughtByImages"] as? [Any] {
                            self.shotBroughtImgVal = valueBroughtImage
                        }
                        self.shtBroghtIMG.append(self.shotBroughtImgVal)
                        
                        if let valueShoutListVal: NSDictionary  = self.statusDict["shout"] as? NSDictionary {
                            self.shotShoutListVal = valueShoutListVal
                        }
                        
                        if let comShoutExclusive: String = self.shotShoutListVal["isExclusive"] as? String {
                            self.shotIsExclusiveAdd = comShoutExclusive
                        }
                        self.shtEXClVal.append(self.shotIsExclusiveAdd)
                        
                        if let comShoutMrpValue: String = self.shotShoutListVal["mrp"] as? String {
                            self.shotMrpValue = comShoutMrpValue
                        }
                        self.shtMRP.append(self.shotMrpValue)
                        
                        if let comShoutNew: String = self.shotShoutListVal["isnew"] as? String {
                            self.shotIsNewAdd = comShoutNew
                        }
                        self.shtISNewM.append(self.shotIsNewAdd)
                        
                        if let comShoutOffer: String = self.shotShoutListVal["Offer"] as? String {
                            self.shotOfferValr = comShoutOffer
                        }
                        self.shtOFFESHT.append(self.shotOfferValr)
                        
                        if let comShoutNameofPD: String = self.shotShoutListVal["name"] as? String {
                            self.shotNameOfProd = comShoutNameofPD
                        }
                        self.shtNameProd.append(self.shotNameOfProd)
                        
                        if let comShoutImgNamed: String = self.shotShoutListVal["image"] as? String {
                            self.shotImgNamed = comShoutImgNamed
                        }
                        self.shtProdIMG.append(self.shotImgNamed)
                        
                        if let comShoutMoqValue: String = self.shotShoutListVal["moq"] as? String {
                            self.shotMoqValue = comShoutMoqValue
                        }
                        self.shtMOQV.append(self.shotMoqValue)
                        
                        if let comShoutMoqValue: String = self.shotShoutListVal["off_price"] as? String {
                            self.shotOffPriceVsalu = comShoutMoqValue
                        }
                        self.shtOFFPRic.append(self.shotOffPriceVsalu)
                        
                        
                        if let comShoutPriceNormal: String = self.shotShoutListVal["price"] as? String {
                            self.shotPriceNormal = comShoutPriceNormal
                        }
                        self.shtPRicProd.append(self.shotPriceNormal)
                        
                        if let comShoutMarginValue: String = self.shotShoutListVal["margin"] as? String {
                            self.shotMarginValue = comShoutMarginValue
                        }
                        self.shtMArgVAl.append(self.shotMarginValue)
                        
                        if let comShoutTiemrRel: String = self.shotShoutListVal["time"] as? String {
                            self.shotTiemrRel = comShoutTiemrRel
                        }
                        self.shtTImeVal.append(self.shotTiemrRel)
                        
                        if let comShoutIsDealVal: String = self.shotShoutListVal["isDeal"] as? String {
                            self.shotIsDealVal = comShoutIsDealVal
                        }
                        self.shtISDeal.append(self.shotIsDealVal)
                        
                        if let comShoutIsExperVal: String = self.shotShoutListVal["isexperied"] as? String {
                            self.shotIsExperVal = comShoutIsExperVal
                        }
                        self.shtISEXP.append(self.shotIsExperVal)
                        
                        
                        if let comShoutExpText: String = self.shotShoutListVal["experied_text"] as? String {
                            self.shotExpText = comShoutExpText
                        }
                        self.shtEXPTxt.append(self.shotExpText)
                        
                        
                        if let comShoutIsCOMboVla: String = self.shotShoutListVal["iscombo"] as? String {
                            self.shotIsCOMboVla = comShoutIsCOMboVla
                        }
                        self.shtCOMBVal.append(self.shotIsCOMboVla)
                        
                        if let comShoutSaveAMount: String = self.shotShoutListVal["save_amount"] as? String {
                            self.shotSaveAMountVal = comShoutSaveAMount
                        }
                        self.shtSaveAMnt.append(self.shotSaveAMountVal)
                        
                        
                        if let comShoutComboTest: String = self.shotShoutListVal["combotext"] as? String {
                            self.shotComboTestVal = comShoutComboTest
                        }
                        self.shtCOMBTxtt.append(self.shotComboTestVal)
                        
                        if let comShoutComboImgVal: [Any] = self.shotShoutListVal["comboimages"] as? [Any] {
                            self.shotComboImgVal = comShoutComboImgVal
                        }
                        self.shtCMBIMGSS.append(self.shotComboImgVal)
                        
                        if let comShoutHsaOffTake: String = self.shotShoutListVal["hasofftake"] as? String {
                            self.shotHsaOffTake = comShoutHsaOffTake
                        }
                        self.shtHasTakOfS.append(self.shotHsaOffTake)
                        
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
