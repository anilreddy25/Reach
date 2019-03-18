//
//  editSaveVC.swift
//  AgentRestocks
//
//  Created by apple on 1/21/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire

class editSaveVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableList: UITableView!
    
    
    
    var useridbiling =  String()
    var Myauthorisationstringfinalvalue =  String()
    var myagentTotalvalue =  String()
    
    
    var saveValue = [Any]()
    var statusValue = String()
    var statusDict = [String: Any]()
    
    
    var saveStatusName = String()
    var saveProfileIdVal = String()
    var saveProfileImgVal = String()
    var saveBroughtVal = String()
    var saveSubjectCust = String()
    var saveIsUserLiked = String()
    var saveSendTime = String()
    var saveMsgValue = String()
    var saveShoutType = Int()
    var saveBroughtBYval = String()
    var saveCountComments = String()
    var saveCountLikes =  String()
    var saveCountShouts = String()
    var saveCountSaves = String()
    var saveIsLikedVal = Int()
    var saveIsShoutedVal = Int()
    var saveShoutTestVal = String()
    var saveShotImgVal = String()
    var saveBroughtImgVal = [Any]()
    var saveShoutListVal = NSDictionary()
    var saveCommentData = [Any]()
    var saveAdditionData = [String: Any]()
    var saveAddOffTake = String()
    //Save shout Dict
    var saveIsExclusiveAdd = String()
    var saveIsNewAdd = String()
    var saveOfferValr = String()
    var saveNameOfProd = String()
    var saveImgNamed = String()
    var saveMrpValue = String()
    var saveMoqValue = String()
    var saveOffPriceVsalu = String()
    var savePriceNormal = String()
    var saveMarginValue = String()
    var saveTiemrRel = String()
    var saveIsDealVal = String()
    var saveIsExperVal = String()
    var saveExpText = String()
    var saveIsCOMboVla = String()
    var saveSaveAMountVal = String()
    var saveComboTestVal = String()
    var saveComboImgVal = [Any]()
    var saveHsaOffTake = String()
    
    var SAVName = [Any]()
    var SAVProfID = [Any]()
    var SAVProfImg = [Any]()
    var SAVHasBroght = [Any]()
    var SAVISSHOt = [Any]()
    var SAVSUB = [Any]()
    var SAVISUSer = [Any]()
    var SAVTime = [Any]()
    var SAVMSG = [Any]()
    var SAVTYPe = [Any]()
    var SAVBroghBY = [Any]()
    var SAVComent = [Any]()
    var SAVLike = [Any]()
    var SAVSHOTS = [Any]()
    var SAVSAVed = [Any]()
    var SAVISLIKE = [Any]()
    var SAVISSHTED = [Any]()
    var SAVISSHTEXT = [Any]()
    var SAVSHTIMG = [Any]()
    var SAVADDOff = [Any]()
    var SAVADDComentData = [Any]()
    var SAVBroghtIMG = [Any]()
    var SAVEXClVal = [Any]()
    var SAVMRP = [Any]()
    var SAVISNewM = [Any]()
    var SAVOFFESHT = [Any]()
    var SAVNameProd = [Any]()
    var SAVProdIMG = [Any]()
    var SAVMOQV = [Any]()
    var SAVOFFPRic = [Any]()
    var SAVPRicProd = [Any]()
    var SAVMArgVAl = [Any]()
    var SAVTImeVal = [Any]()
    var SAVISDeal = [Any]()
    var SAVISEXP = [Any]()
    var SAVEXPTxt = [Any]()
    var SAVCOMBVal = [Any]()
    var SAVSaveAMnt = [Any]()
    var SAVCOMBTxtt = [Any]()
    var SAVCMBIMGSS = [Any]()
    var SAVHasTakOfS = [Any]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableList.delegate = self
        tableList.dataSource = self
        
        DispatchQueue.main.async {
            self.editSaveShowData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.saveValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : editSaveCell = tableList.dequeueReusableCell(withIdentifier: "editSaveCell") as! editSaveCell
        cell.lblProfile.text = self.SAVName[indexPath.row] as? String
        cell.lblSenderTime.text = self.SAVTime[indexPath.row] as? String
        cell.lblDistributor.text = self.SAVSUB[indexPath.row] as? String

        let url = URL(string: (self.SAVProfImg[indexPath.row] as? String)!)
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
        
        cell.lblProductName.text = self.SAVNameProd[indexPath.row] as? String

        let urlType = URL(string: (self.SAVProdIMG[indexPath.row] as? String)!)
//        let data2 = try? Data(contentsOf: urlType!)
//
//        if let imageData2 = data2 {
//            let imageVal2 = UIImage(data: imageData2)
//            cell.imgProductShout.image = imageVal2
//        }
        
        cell.imgProductShout?.sd_setImage(with: urlType) { (image, error, cache, urls) in
            if (error != nil) {
                cell.imgProductShout.image = #imageLiteral(resourceName: "default_img")
            } else {
                cell.imgProductShout.image = image
            }
        }

        cell.lblMRPPrice.text = self.SAVMRP[indexPath.row] as? String
        cell.lblStrikePrice.text = self.SAVMOQV[indexPath.row] as? String
        cell.lblPercentMargin.text = self.SAVMArgVAl[indexPath.row] as? String
        cell.lblDays.text = self.SAVADDOff[indexPath.row] as? String
        cell.lblOutletBought.text = self.SAVBroghBY[indexPath.row] as? String
        cell.lblSenderMsg.text = self.SAVMSG[indexPath.row] as? String

//        cell.viewProduct.layer.cornerRadius = 5.0
//        cell.viewProduct.layer.borderWidth = 1.0
//        cell.viewProduct.layer.borderColor = UIColor.lightGray.cgColor
//        
        
        cell.lblCommentCount.text = self.SAVComent[indexPath.row] as? String
        cell.lblShare.text = self.SAVSAVed[indexPath.row] as? String
        cell.lblLikes.text = self.SAVLike[indexPath.row] as? String
        cell.lblShoutCount.text = self.SAVSHOTS[indexPath.row] as? String
        cell.lblSaveCount.text = self.SAVSAVed[indexPath.row] as? String
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func editSaveShowData() {
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
        }
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.useridbiling = Reviewfinaluseroid
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
                    
                    if let validSave = dict.value(forKey: "saves")as? [Any] {
                        self.saveValue = validSave
                    }
                    
                    for i in 0 ..< self.saveValue.count {
                        if let dictValue: NSDictionary = self.saveValue[i] as? NSDictionary{
                            self.statusDict = (dictValue as? [String : Any])!
                        }
                        
                        if let valueName: String = self.statusDict["name"] as? String {
                            self.saveStatusName = valueName
                        }
                        self.SAVName.append(self.saveStatusName)
                        
                        if let valueProfileIdVal: String = self.statusDict["profileId"] as? String {
                            self.saveProfileIdVal = valueProfileIdVal
                        }
                        self.SAVProfID.append(self.saveProfileIdVal)
                        
                        if let valueProfileImg: String = self.statusDict["profileImage"] as? String {
                            self.saveProfileImgVal = valueProfileImg
                        }
                        self.SAVProfImg.append(self.saveProfileImgVal)
                        
                        if let valueBrought: String = self.statusDict["hasbroughtby"] as? String {
                            self.saveBroughtVal = valueBrought
                        }
                        self.SAVHasBroght.append(self.saveBroughtVal)
                        
                        if let valueIsShouted: Int = self.statusDict["isShout"] as? Int {
                            self.saveIsShoutedVal = valueIsShouted
                        }
                        self.SAVISSHOt.append(self.saveIsShoutedVal)
                        
                        if let valueSubjectCust: String  = self.statusDict["subject"] as? String {
                            self.saveSubjectCust = valueSubjectCust
                        }
                        self.SAVSUB.append(self.saveSubjectCust)
                        
                        if let valueUserLiked: String  = self.statusDict["isuserlike"] as? String {
                            self.saveIsUserLiked = valueUserLiked
                        }
                        self.SAVISUSer.append(self.saveIsUserLiked)
                        
                        if let valueTimer: String  = self.statusDict["time"] as? String {
                            self.saveSendTime = valueTimer
                        }
                        self.SAVTime.append(self.saveSendTime)
                        
                        if let valueMsgValue: String  = self.statusDict["message"] as? String {
                            self.saveMsgValue = valueMsgValue
                        }
                        self.SAVMSG.append(self.saveMsgValue)
                        
                        if let valueShoutType: Int  = self.statusDict["shoutType"] as? Int {
                            self.saveShoutType = valueShoutType
                        }
                        self.SAVTYPe.append(self.saveShoutType)
                        
                        if let valueBroughtBYval: String  = self.statusDict["broughtBy"] as? String {
                            self.saveBroughtBYval = valueBroughtBYval
                        }
                        self.SAVBroghBY.append(self.saveBroughtBYval)
                        
                        if let valueCountComment: String  = self.statusDict["comments"] as? String {
                            self.saveCountComments = valueCountComment
                        }
                        self.SAVComent.append(self.saveCountComments)
                        
                        if let valueCountLikes: String  = self.statusDict["likes"] as? String {
                            self.saveCountLikes = valueCountLikes
                        }
                        self.SAVLike.append(self.saveCountLikes)
                        
                        if let valueCountsht: String  = self.statusDict["shouts"] as? String {
                            self.saveCountShouts = valueCountsht
                        }
                        self.SAVSHOTS.append(self.saveCountShouts)
                        
                        if let valueCountSav: String  = self.statusDict["saved"] as? String {
                            self.saveCountSaves = valueCountSav
                        }
                        self.SAVSAVed.append(self.saveCountSaves)
                        
                        if let valueIsLiK: Int  = self.statusDict["isliked"] as? Int {
                            self.saveIsLikedVal = valueIsLiK
                        }
                        self.SAVISLIKE.append(self.saveIsLikedVal)
                        
                        if let valueIsShoutedVal: Int  = self.statusDict["isShouted"] as? Int {
                            self.saveIsShoutedVal = valueIsShoutedVal
                        }
                        self.SAVISSHTED.append(self.saveIsShoutedVal)
                        
                        if let valueShoutText: String  = self.statusDict["shoutText"] as? String {
                            self.saveShoutTestVal = valueShoutText
                        }
                        self.SAVISSHTEXT.append(self.saveShoutTestVal)
                        
                        if let valueImgNamed: String  = self.statusDict["shoutimage"] as? String {
                            self.saveShotImgVal = valueImgNamed
                        }
                        self.SAVSHTIMG.append(self.saveShotImgVal)
                        
                        if let valueImgNamed: [String: Any]  = self.statusDict["additionalData"] as? [String: Any] {
                            self.saveAdditionData = valueImgNamed
                        }
                        //saveAddOffTake
                        
                        if let comAddOff : String = self.saveAdditionData["Offtake"] as? String{
                            self.saveAddOffTake = comAddOff
                        }
                        self.SAVADDOff.append(self.saveAddOffTake)
                        
                        
                        if let valueCommentData: [Any]  = self.statusDict["commentData"] as? [Any] {
                            self.saveCommentData = valueCommentData
                        }
                        
                        self.SAVADDComentData.append(self.saveCommentData)
                        
                        if let valueBroughtImage: [Any]  = self.statusDict["broughtByImages"] as? [Any] {
                            self.saveBroughtImgVal = valueBroughtImage
                        }
                        self.SAVBroghtIMG.append(self.saveBroughtImgVal)
                        
                        
                        if let valueShoutListVal: NSDictionary  = self.statusDict["shout"] as? NSDictionary {
                            self.saveShoutListVal = valueShoutListVal
                        }
                        
                        if let comShoutExclusive: String = self.saveShoutListVal["isExclusive"] as? String {
                            self.saveIsExclusiveAdd = comShoutExclusive
                        }
                        self.SAVEXClVal.append(self.saveIsExclusiveAdd)
                        
                        if let comShoutMrpValue: String = self.saveShoutListVal["mrp"] as? String {
                            self.saveMrpValue = comShoutMrpValue
                        }
                        self.SAVMRP.append(self.saveMrpValue)
                        
                        if let comShoutNew: String = self.saveShoutListVal["isnew"] as? String {
                            self.saveIsNewAdd = comShoutNew
                        }
                        self.SAVISNewM.append(self.saveIsNewAdd)
                        
                        if let comShoutOffer: String = self.saveShoutListVal["Offer"] as? String {
                            self.saveOfferValr = comShoutOffer
                        }
                        self.SAVOFFESHT.append(self.saveOfferValr)
                        
                        if let comShoutNameofPD: String = self.saveShoutListVal["name"] as? String {
                            self.saveNameOfProd = comShoutNameofPD
                        }
                        self.SAVNameProd.append(self.saveNameOfProd)
                        
                        if let comShoutImgNamed: String = self.saveShoutListVal["image"] as? String {
                            self.saveImgNamed = comShoutImgNamed
                        }
                        self.SAVProdIMG.append(self.saveImgNamed)
                        
                        if let comShoutMoqValue: String = self.saveShoutListVal["moq"] as? String {
                            self.saveMoqValue = comShoutMoqValue
                        }
                        self.SAVMOQV.append(self.saveMoqValue)
                        
                        if let comShoutMoqValue: String = self.saveShoutListVal["off_price"] as? String {
                            self.saveOffPriceVsalu = comShoutMoqValue
                        }
                        self.SAVOFFPRic.append(self.saveOffPriceVsalu)
                        
                        if let comShoutPriceNormal: String = self.saveShoutListVal["price"] as? String {
                            self.savePriceNormal = comShoutPriceNormal
                        }
                        self.SAVPRicProd.append(self.savePriceNormal)
                        
                        if let comShoutMarginValue: String = self.saveShoutListVal["margin"] as? String {
                            self.saveMarginValue = comShoutMarginValue
                        }
                        self.SAVMArgVAl.append(self.saveMarginValue)
                        
                        if let comShoutTiemrRel: String = self.saveShoutListVal["time"] as? String {
                            self.saveTiemrRel = comShoutTiemrRel
                        }
                        self.SAVTImeVal.append(self.saveTiemrRel)
                        
                        if let comShoutIsDealVal: String = self.saveShoutListVal["isDeal"] as? String {
                            self.saveIsDealVal = comShoutIsDealVal
                        }
                        self.SAVISDeal.append(self.saveIsDealVal)
                        
                        if let comShoutIsExperVal: String = self.saveShoutListVal["isexperied"] as? String {
                            self.saveIsExperVal = comShoutIsExperVal
                        }
                        self.SAVISEXP.append(self.saveIsExperVal)
                        
                        if let comShoutExpText: String = self.saveShoutListVal["experied_text"] as? String {
                            self.saveExpText = comShoutExpText
                        }
                        self.SAVEXPTxt.append(self.saveExpText)
                        
                        if let comShoutIsCOMboVla: String = self.saveShoutListVal["iscombo"] as? String {
                            self.saveIsCOMboVla = comShoutIsCOMboVla
                        }
                        self.SAVCOMBVal.append(self.saveIsCOMboVla)
                        
                        if let comShoutSaveAMount: String = self.saveShoutListVal["save_amount"] as? String {
                            self.saveSaveAMountVal = comShoutSaveAMount
                        }
                        self.SAVSaveAMnt.append(self.saveSaveAMountVal)
                        
                        if let comShoutComboTest: String = self.saveShoutListVal["combotext"] as? String {
                            self.saveComboTestVal = comShoutComboTest
                        }
                        self.SAVCOMBTxtt.append(self.saveComboTestVal)
                        
                        if let comShoutComboImgVal: [Any] = self.saveShoutListVal["comboimages"] as? [Any] {
                            self.saveComboImgVal = comShoutComboImgVal
                        }
                        self.SAVCMBIMGSS.append(self.saveComboImgVal)
                        
                        if let comShoutHsaOffTake: String = self.saveShoutListVal["hasofftake"] as? String {
                            self.saveHsaOffTake = comShoutHsaOffTake
                        }
                        self.SAVHasTakOfS.append(self.saveHsaOffTake)
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
