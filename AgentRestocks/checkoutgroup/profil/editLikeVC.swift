//
//  editLikeVC.swift
//  AgentRestocks
//
//  Created by apple on 1/21/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire

class editLikeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableList: UITableView!
    
    var useridbiling =  String()
    var Myauthorisationstringfinalvalue =  String()
    var myagentTotalvalue =  String()
    
    
    var likesValue = [Any]()
    var statusValue = String()
    var statusDict = [String: Any]()
    
    //Likes
    var likStatusName = String()
    var likProfileIdVal = String()
    var likProfileImgVal = String()
    var likBroughtVal = String()
    var likSubjectCust = String()
    var likIsUserLiked = String()
    var likSendTime = String()
    var likMsgValue = String()
    var likShoutType = Int()
    var likBroughtBYval = String()
    var likCountComments = String()
    var likCountLikes =  String()
    var likCountShouts = String()
    var likCountSaves = String()
    var likIsLikedVal = Int()
    var likIsShoutedVal = Int()
    var likShoutTestVal = String()
    var likShotImgVal = String()
    var likBroughtImgVal = [Any]()
    var likShoutListVal = NSDictionary()
    var likCommentData = [Any]()
    var likAdditionData = [String: Any]()
    var likAddOffTake = String()
    //Like shout Dict
    var likIsExclusiveAdd = String()
    var likIsNewAdd = String()
    var likOfferValr = String()
    var likNameOfProd = String()
    var likImgNamed = String()
    var likMrpValue = String()
    var likMoqValue = String()
    var likOffPriceVsalu = String()
    var likPriceNormal = String()
    var likMarginValue = String()
    var likTiemrRel = String()
    var likIsDealVal = String()
    var likIsExperVal = String()
    var likExpText = String()
    var likIsCOMboVla = String()
    var likSaveAMountVal = String()
    var likComboTestVal = String()
    var likComboImgVal = [Any]()
    var likHsaOffTake = String()
    
    var LIKName = [Any]()
    var LIKProfID = [Any]()
    var LIKProfImg = [Any]()
    var LIKHasBroght = [Any]()
    var LIKISSHOt = [Any]()
    var LIKSUB = [Any]()
    var LIKISUSer = [Any]()
    var LIKTime = [Any]()
    var LIKMSG = [Any]()
    var LIKTYPe = [Any]()
    var LIKBroghBY = [Any]()
    var LIKComent = [Any]()
    var LIKLike = [Any]()
    var LIKSHOTS = [Any]()
    var LIKSAVed = [Any]()
    var LIKISLIKE = [Any]()
    var LIKISSHTED = [Any]()
    var LIKISSHTEXT = [Any]()
    var LIKSHTIMG = [Any]()
    var LIKADDOff = [Any]()
    var LIKADDComentData = [Any]()
    var LIKBroghtIMG = [Any]()
    var LIKEXClVal = [Any]()
    var LIKMRP = [Any]()
    var LIKISNewM = [Any]()
    var LIKOFFESHT = [Any]()
    var LIKNameProd = [Any]()
    var LIKProdIMG = [Any]()
    var LIKMOQV = [Any]()
    var LIKOFFPRic = [Any]()
    var LIKPRicProd = [Any]()
    var LIKMArgVAl = [Any]()
    var LIKTImeVal = [Any]()
    var LIKISDeal = [Any]()
    var LIKISEXP = [Any]()
    var LIKEXPTxt = [Any]()
    var LIKCOMBVal = [Any]()
    var LIKSaveAMnt = [Any]()
    var LIKCOMBTxtt = [Any]()
    var LIKCMBIMGSS = [Any]()
    var LIKHasTakOfS = [Any]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    tableList.delegate = self
    tableList.dataSource = self
    
        DispatchQueue.main.async {
            self.editLikeShowData()
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.likesValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : editLikeCell = tableList.dequeueReusableCell(withIdentifier: "editLikeCell") as! editLikeCell
        cell.lblProfile.text = self.LIKName[indexPath.row] as? String
        cell.lblSenderTime.text = self.LIKTime[indexPath.row] as? String
        cell.lblDistributor.text = self.LIKSUB[indexPath.row] as? String
        
        let url = URL(string: (self.LIKProfImg[indexPath.row] as? String)!)
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
        
        cell.lblProductName.text = self.LIKNameProd[indexPath.row] as? String
        
        let urlType = URL(string: (self.LIKProdIMG[indexPath.row] as? String)!)
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
        
        cell.lblMRPPrice.text = self.LIKMRP[indexPath.row] as? String
        cell.lblStrikePrice.text = self.LIKMOQV[indexPath.row] as? String
        cell.lblPercentMargin.text = self.LIKMArgVAl[indexPath.row] as? String
        cell.lblDays.text = self.LIKADDOff[indexPath.row] as? String
        cell.lblOutletBought.text = self.LIKBroghBY[indexPath.row] as? String
        cell.lblSenderMsg.text = self.LIKMSG[indexPath.row] as? String
        
        
        
        
        cell.lblCommentCount.text = self.LIKComent[indexPath.row] as? String
        cell.lblShare.text = self.LIKSAVed[indexPath.row] as? String
        cell.lblLikes.text = self.LIKLike[indexPath.row] as? String
        cell.lblShoutCount.text = self.LIKSHOTS[indexPath.row] as? String
        cell.lblSaveCount.text = self.LIKSAVed[indexPath.row] as? String
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
        
    }
    
    func editLikeShowData()  {
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlMarketShout)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
//        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
//        {
//            self.Myauthorisationstringfinalvalue = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NDc4MDY3MzAsImlzcyI6ImxvY2FsaG9zdCIsImV4cCI6MTU0NzgwNzYzMCwidXNlcklkIjoiQTcwMTUzIn0.QptNzqOxSEBYm_42oyj33Tt5S2hOVe-S0Kj8qBI9UNg"
//        }
        
        
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        
//        if let Reviewfinaluseroid:String = dafaults.value(forKey: "MyLoginfinalvalue")as?String
//        {
//            self.useridbiling = Reviewfinaluseroid
//        }

        
        
        
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
    
                    if let Value:[Any] = dict.value(forKey: "likes")as? [Any]{
                        self.likesValue = Value
                    }
                    for i in 0 ..< self.likesValue.count {
                        if let dictValue: [String : Any] = self.likesValue[i] as? [String : Any]{
                            self.statusDict = (dictValue as? [String : Any])!
                        }
                        
                        if let valueName: String = self.statusDict["name"] as? String {
                            self.likStatusName = valueName
                        }
                        self.LIKName.append(self.likStatusName)
                        
                        
                        if let valueProfileIdVal: String = self.statusDict["profileId"] as? String {
                            self.likProfileIdVal = valueProfileIdVal
                        }
                        self.LIKProfID.append(self.likProfileIdVal)
                        
                        if let valueProfileImg: String = self.statusDict["profileImage"] as? String {
                            self.likProfileImgVal = valueProfileImg
                        }
                        self.LIKProfImg.append(self.likProfileImgVal)
                        
                        if let valueBrought: String = self.statusDict["hasbroughtby"] as? String {
                            self.likBroughtVal = valueBrought
                        }
                        
                        self.LIKHasBroght.append(self.likBroughtVal)
                        
                        if let valueIsShouted: Int = self.statusDict["isShout"] as? Int {
                            self.likIsShoutedVal = valueIsShouted
                        }
                        self.LIKISSHOt.append(self.likIsShoutedVal)
                        
                        if let valueSubjectCust: String  = self.statusDict["subject"] as? String {
                            self.likSubjectCust = valueSubjectCust
                        }
                        self.LIKSUB.append(self.likSubjectCust)
                        
                        if let valueUserLiked: String  = self.statusDict["isuserlike"] as? String {
                            self.likIsUserLiked = valueUserLiked
                        }
                        self.LIKISUSer.append(self.likIsUserLiked)
                        
                        if let valueTimer: String  = self.statusDict["time"] as? String {
                            self.likSendTime = valueTimer
                        }
                        self.LIKTime.append(self.likSendTime)
                        
                        if let valueMsgValue: String  = self.statusDict["message"] as? String {
                            self.likMsgValue = valueMsgValue
                        }
                        self.LIKMSG.append(self.likMsgValue)
                        
                        if let valueShoutType: Int  = self.statusDict["shoutType"] as? Int {
                            self.likShoutType = valueShoutType
                        }
                        self.LIKTYPe.append(self.likShoutType)
                        
                        if let valueBroughtBYval: String  = self.statusDict["broughtBy"] as? String {
                            self.likBroughtBYval = valueBroughtBYval
                        }
                        self.LIKBroghBY.append(self.likBroughtBYval)
                        
                        if let valueCountComment: String  = self.statusDict["comments"] as? String {
                            self.likCountComments = valueCountComment
                        }
                        self.LIKComent.append(self.likCountComments)
                        
                        if let valueCountLikes: String  = self.statusDict["likes"] as? String {
                            self.likCountLikes = valueCountLikes
                        }
                        self.LIKLike.append(self.likCountLikes)
                        
                        if let valueCountsht: String  = self.statusDict["shouts"] as? String {
                            self.likCountShouts = valueCountsht
                        }
                        self.LIKSHOTS.append(self.likCountShouts)
                        
                        if let valueCountSav: String  = self.statusDict["saved"] as? String {
                            self.likCountSaves = valueCountSav
                        }
                        self.LIKSAVed.append(self.likCountSaves)
                        
                        if let valueIsLiK: Int  = self.statusDict["isliked"] as? Int {
                            self.likIsLikedVal = valueIsLiK
                        }
                        self.LIKISLIKE.append(self.likIsLikedVal)
                        
                        
                        if let valueIsShoutedVal: Int  = self.statusDict["isShouted"] as? Int {
                            self.likIsShoutedVal = valueIsShoutedVal
                        }
                        self.LIKISSHTED.append(self.likIsShoutedVal)
                        
                        if let valueShoutText: String  = self.statusDict["shoutText"] as? String {
                            self.likShoutTestVal = valueShoutText
                        }
                        self.LIKISSHTEXT.append(self.likShoutTestVal)
                        
                        if let valueImgNamed: String  = self.statusDict["shoutimage"] as? String {
                            self.likShotImgVal = valueImgNamed
                        }
                        self.LIKSHTIMG.append(self.likShotImgVal)
                        
                        if let valueImgNamed: [String: Any]  = self.statusDict["additionalData"] as? [String: Any] {
                            self.likAdditionData = valueImgNamed
                        }
                        //comAddOffTake
                        if let comAddOff : String = self.likAdditionData["Offtake"] as? String{
                            self.likAddOffTake = comAddOff
                        }
                        self.LIKADDOff.append(self.likAddOffTake)
                        
                        if let valueCommentData: [Any]  = self.statusDict["commentData"] as? [Any] {
                            self.likCommentData = valueCommentData
                        }
                        self.LIKADDComentData.append(self.likCommentData)
                        
                        if let valueBroughtImage: [Any]  = self.statusDict["broughtByImages"] as? [Any] {
                            self.likBroughtImgVal = valueBroughtImage
                        }
                        self.LIKBroghtIMG.append(self.likBroughtImgVal)
                        
                        if let valueShoutListVal: NSDictionary  = self.statusDict["shout"] as? NSDictionary {
                            self.likShoutListVal = valueShoutListVal
                        }
                        
                        if let comShoutExclusive: String = self.likShoutListVal["isExclusive"] as? String {
                            self.likIsExclusiveAdd = comShoutExclusive
                        }
                        self.LIKEXClVal.append(self.likIsExclusiveAdd)
                        
                        if let comShoutMrpValue: String = self.likShoutListVal["mrp"] as? String {
                            self.likMrpValue = comShoutMrpValue
                        }
                        self.LIKMRP.append(self.likMrpValue)
                        
                        if let comShoutNew: String = self.likShoutListVal["isnew"] as? String {
                            self.likIsNewAdd = comShoutNew
                        }
                        self.LIKISNewM.append(self.likIsNewAdd)
                        
                        if let comShoutOffer: String = self.likShoutListVal["Offer"] as? String {
                            self.likOfferValr = comShoutOffer
                        }
                        self.LIKOFFESHT.append(self.likOfferValr)
                        
                        if let comShoutNameofPD: String = self.likShoutListVal["name"] as? String {
                            self.likNameOfProd = comShoutNameofPD
                        }
                        self.LIKNameProd.append(self.likNameOfProd)
                        
                        if let comShoutImgNamed: String = self.likShoutListVal["image"] as? String {
                            self.likImgNamed = comShoutImgNamed
                        }
                        self.LIKProdIMG.append(self.likImgNamed)
                        
                        if let comShoutMoqValue: String = self.likShoutListVal["moq"] as? String {
                            self.likMoqValue = comShoutMoqValue
                        }
                        self.LIKMOQV.append(self.likMoqValue)
                        
                        if let comShoutMoqValue: String = self.likShoutListVal["off_price"] as? String {
                            self.likOffPriceVsalu = comShoutMoqValue
                        }
                        self.LIKOFFPRic.append(self.likOffPriceVsalu)
                        
                        if let comShoutPriceNormal: String = self.likShoutListVal["price"] as? String {
                            self.likPriceNormal = comShoutPriceNormal
                        }
                        self.LIKPRicProd.append(self.likPriceNormal)
                        
                        if let comShoutMarginValue: String = self.likShoutListVal["margin"] as? String {
                            self.likMarginValue = comShoutMarginValue
                        }
                        self.LIKMArgVAl.append(self.likMarginValue)
                        
                        if let comShoutTiemrRel: String = self.likShoutListVal["time"] as? String {
                            self.likTiemrRel = comShoutTiemrRel
                        }
                        self.LIKTImeVal.append(self.likTiemrRel)
                        
                        if let comShoutIsDealVal: String = self.likShoutListVal["isDeal"] as? String {
                            self.likIsDealVal = comShoutIsDealVal
                        }
                        self.LIKISDeal.append(self.likIsDealVal)
                        
                        if let comShoutIsExperVal: String = self.likShoutListVal["isexperied"] as? String {
                            self.likIsExperVal = comShoutIsExperVal
                        }
                        self.LIKISEXP.append(self.likIsExperVal)
                        
                        
                        if let comShoutExpText: String = self.likShoutListVal["experied_text"] as? String {
                            self.likExpText = comShoutExpText
                        }
                        
                        self.LIKEXPTxt.append(self.likExpText)
                        
                        if let comShoutIsCOMboVla: String = self.likShoutListVal["iscombo"] as? String {
                            self.likIsCOMboVla = comShoutIsCOMboVla
                        }
                        self.LIKCOMBVal.append(self.likIsCOMboVla)
                        
                        if let comShoutSaveAMount: String = self.likShoutListVal["save_amount"] as? String {
                            self.likSaveAMountVal = comShoutSaveAMount
                        }
                        self.LIKSaveAMnt.append(self.likSaveAMountVal)
                        
                        if let comShoutComboTest: String = self.likShoutListVal["combotext"] as? String {
                            self.likComboTestVal = comShoutComboTest
                        }
                        self.LIKCOMBTxtt.append(self.likComboTestVal)
                        
                        if let comShoutComboImgVal: [Any] = self.likShoutListVal["comboimages"] as? [Any] {
                            self.likComboImgVal = comShoutComboImgVal
                        }
                        self.LIKCMBIMGSS.append(self.likComboImgVal)
                        
                        if let comShoutHsaOffTake: String = self.likShoutListVal["hasofftake"] as? String {
                            self.likHsaOffTake = comShoutHsaOffTake
                        }
                        self.LIKHasTakOfS.append(self.likHsaOffTake)
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
