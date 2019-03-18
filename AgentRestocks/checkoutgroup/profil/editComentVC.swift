//
//  editComentVC.swift
//  AgentRestocks
//
//  Created by apple on 1/21/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire


class editComentVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableList: UITableView!
    
    var useridbiling =  String()
    var Myauthorisationstringfinalvalue =  String()
    var myagentTotalvalue =  String()
    
    
    var commentsValue = [Any]()
    var statusValue = String()
    var statusDict = [String: Any]()

    var comStatusName = String()
    var comProfileIdVal = String()
    var comProfileImgVal = String()
    var comBroughtVal = String()
    var comSubjectCust = String()
    var comIsUserLiked = String()
    var comSendTime = String()
    var comMsgValue = String()
    var comShoutType = Int()
    var comBroughtBYval = String()
    var comCountComments = String()
    var comCountLikes =  String()
    var comCountShouts = String()
    var comCountSaves = String()
    var comIsLikedVal = Int()
    var comIsShoutedVal = Int()
    var comShoutTestVal = String()
    var comShoutImgVal = String()
    var comBroughtImgVal = [Any]()
    var comShoutListVal = NSDictionary()
    var comCommentData = [Any]()
    var comAdditionData = [String: Any]()
    var comAddOffTake = String()
    //Comment shout Dict
    var comIsExclusiveAdd = String()
    var comIsNewAdd = String()
    var comOfferValr = String()
    var comNameOfProd = String()
    var comImgNamed = String()
    var comMrpValue = String()
    var comMoqValue = String()
    var comOffPriceVsalu = String()
    var comPriceNormal = String()
    var comMarginValue = String()
    var comTiemrRel = String()
    var comIsDealVal = String()
    var comIsExperVal = String()
    var comExpText = String()
    var comIsCOMboVla = String()
    var comSaveAMountVal = String()
    var comComboTestVal = String()
    var comComboImgVal = [Any]()
    var comHsaOffTake = String()
    
    
    var CMNTName = [Any]()
    var CMNTProfID = [Any]()
    var CMNTProfImg = [Any]()
    var CMNTHasBroght = [Any]()
    var CMNTISSHOt = [Any]()
    var CMNTSUB = [Any]()
    var CMNTISUSer = [Any]()
    var CMNTTime = [Any]()
    var CMNTMSG = [Any]()
    var CMNTTYPe = [Any]()
    var CMNTBroghBY = [Any]()
    var CMNTComent = [Any]()
    var CMNTLike = [Any]()
    var CMNTSHOTS = [Any]()
    var CMNTSAVed = [Any]()
    var CMNTISLIKE = [Any]()
    var CMNTISSHTED = [Any]()
    var CMNTISSHTEXT = [Any]()
    var CMNTSHTIMG = [Any]()
    var CMNTADDOff = [Any]()
    var CMNTADDComentData = [Any]()
    var CMNTBroghtIMG = [Any]()
    var CMNTEXClVal = [Any]()
    var CMNTMRP = [Any]()
    var CMNTISNewM = [Any]()
    var CMNTOFFESHT = [Any]()
    var CMNTNameProd = [Any]()
    var CMNTProdIMG = [Any]()
    var CMNTMOQV = [Any]()
    var CMNTOFFPRic = [Any]()
    var CMNTPRicProd = [Any]()
    var CMNTMArgVAl = [Any]()
    var CMNTTImeVal = [Any]()
    var CMNTISDeal = [Any]()
    var CMNTISEXP = [Any]()
    var CMNTEXPTxt = [Any]()
    var CMNTCOMBVal = [Any]()
    var CMNTSaveAMnt = [Any]()
    var CMNTCOMBTxtt = [Any]()
    var CMNTCMBIMGSS = [Any]()
    var CMNTHasTakOfS = [Any]()
    
    var valdSaved = [Any]()
    var valSHOUTS = [Any]()
    var valdComnts = [Any]()
    var valdLikeSS = [Any]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableList.delegate = self
        tableList.dataSource = self
        
        DispatchQueue.main.async {
            self.editCommentShowData()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentsValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : editCommentCell = tableList.dequeueReusableCell(withIdentifier: "editCommentCell") as! editCommentCell
        
        cell.lblProfile.text = self.CMNTName[indexPath.row] as? String
        cell.lblSenderTime.text = self.CMNTTime[indexPath.row] as? String
        cell.lblDistributor.text = self.CMNTSUB[indexPath.row] as? String

        let url = URL(string: (self.CMNTProfImg[indexPath.row] as? String)!)
//        let data = try? Data(contentsOf: url!)
//
//        if let imageData = data {
//            let imageVal = UIImage(data: imageData)
//            cell.imgProfile.image = imageVal
//        }
//
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
        
        
        
        
        cell.lblProductName.text = self.CMNTNameProd[indexPath.row] as? String

        let urlType = URL(string: (self.CMNTProdIMG[indexPath.row] as? String)!)
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

        cell.lblMRPPrice.text = self.CMNTMRP[indexPath.row] as? String
        cell.lblStrikePrice.text = self.CMNTMOQV[indexPath.row] as? String
        cell.lblPercentMargin.text = self.CMNTMArgVAl[indexPath.row] as? String
        cell.lblDays.text = self.CMNTADDOff[indexPath.row] as? String
        cell.lblOutletBought.text = self.CMNTBroghBY[indexPath.row] as? String
        cell.lblSenderMsg.text = self.CMNTMSG[indexPath.row] as? String
        
        
        
        
        
        cell.lblCommentCount.text = self.CMNTComent[indexPath.row] as? String
        cell.lblShare.text = self.CMNTSAVed[indexPath.row] as? String
        cell.lblLikes.text = self.CMNTLike[indexPath.row] as? String
        cell.lblShoutCount.text = self.CMNTSHOTS[indexPath.row] as? String
        cell.lblSaveCount.text = self.CMNTSAVed[indexPath.row] as? String
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let cell : editCommentCell = tableList.dequeueReusableCell(withIdentifier: "editCommentCell") as! editCommentCell
//
//        let commentData: commentVC = self.storyboard?.instantiateViewController(withIdentifier: "commentVC") as! commentVC
//            commentData.profileName = cell.lblProfile.text!
//            commentData.msgSender = cell.lblDistributor.text!
//          //  commentData.mrpPrice = Int(cell.lblMRPPrice.text!)!
//            self.present(commentData, animated: true, completion: nil)
//        
    }
    
    
    
    func editCommentShowData()  {
        
        
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
//        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
//        {
//            self.myagentTotalvalue = "A70153"
//        }
        
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
                    if let comValue:[Any] = dict.value(forKey: "comments") as? [Any] {
                     self.commentsValue = comValue
                   }
             for i in 0 ..< self.commentsValue.count {
                 if let dictValue: NSDictionary = self.commentsValue[i] as? NSDictionary{
                       self.statusDict = (dictValue as? [String : Any])!
                   }

            if let valueName: String = self.statusDict["name"] as? String {
                self.comStatusName = valueName
            }
            self.CMNTName.append(self.comStatusName)


            if let valueProfileIdVal: String = self.statusDict["profileId"] as? String {
                self.comProfileIdVal = valueProfileIdVal
            }
            self.CMNTProfID.append(self.comProfileIdVal)


            if let valueProfileImg: String = self.statusDict["profileImage"] as? String {
                self.comProfileImgVal = valueProfileImg
            }
            self.CMNTProfImg.append(self.comProfileImgVal)

            if let valueBrought: String = self.statusDict["hasbroughtby"] as? String {
                self.comBroughtVal = valueBrought
            }
            self.CMNTHasBroght.append(self.comBroughtVal)

            if let valueIsShouted: Int = self.statusDict["isShout"] as? Int {
                self.comIsShoutedVal = valueIsShouted
            }
            self.CMNTISSHOt.append(self.comIsShoutedVal)

            if let valueSubjectCust: String  = self.statusDict["subject"] as? String {
                self.comSubjectCust = valueSubjectCust
            }
            self.CMNTSUB.append(self.comSubjectCust)

            if let valueUserLiked: String  = self.statusDict["isuserlike"] as? String {
                self.comIsUserLiked = valueUserLiked
            }
            self.CMNTISUSer.append(self.comIsUserLiked)

            if let valueTimer: String  = self.statusDict["time"] as? String {
                self.comSendTime = valueTimer
            }
            self.CMNTTime.append(self.comSendTime)

            if let valueMsgValue: String  = self.statusDict["message"] as? String {
                self.comMsgValue = valueMsgValue
            }
            self.CMNTMSG.append(self.comMsgValue)
                
            if let valueShoutType: Int  = self.statusDict["shoutType"] as? Int {
                self.comShoutType = valueShoutType
            }
            self.CMNTTYPe.append(self.comShoutType)
                
            if let valueBroughtBYval: String  = self.statusDict["broughtBy"] as? String {
                self.comBroughtBYval = valueBroughtBYval
            }
            self.CMNTBroghBY.append(self.comBroughtBYval)
                
            if let valueCountComment: String  = self.statusDict["comments"] as? String {
                self.comCountComments = valueCountComment
            }
            self.CMNTComent.append(self.comCountComments)
                
            if let valueCountLikes: String  = self.statusDict["likes"] as? String {
                self.comCountLikes = valueCountLikes
            }
            self.CMNTLike.append(self.comCountLikes)
                
            if let valueCountsht: String  = self.statusDict["shouts"] as? String {
                self.comCountShouts = valueCountsht
            }
            self.CMNTSHOTS.append(self.comCountShouts)
                
            if let valueCountSav: String  = self.statusDict["saved"] as? String {
                self.comCountSaves = valueCountSav
            }
            self.CMNTSAVed.append(self.comCountSaves)
                
            if let valueIsLiK: Int  = self.statusDict["isliked"] as? Int {
                self.comIsLikedVal = valueIsLiK
            }
            self.CMNTISLIKE.append(self.comIsLikedVal)


            if let valueIsShoutedVal: Int  = self.statusDict["isShouted"] as? Int {
                self.comIsShoutedVal = valueIsShoutedVal
            }
            self.CMNTISSHTED.append(self.comIsShoutedVal)

            if let valueShoutText: String  = self.statusDict["shoutText"] as? String {
                self.comShoutTestVal = valueShoutText
            }
            self.CMNTISSHTEXT.append(self.comShoutTestVal)


            if let valueImgNamed: String  = self.statusDict["shoutimage"] as? String {
                self.comShoutImgVal = valueImgNamed
            }
            self.CMNTSHTIMG.append(self.comShoutImgVal)

            if let valueImgNamed: [String: Any]  = self.statusDict["additionalData"] as? [String: Any] {
                self.comAdditionData = valueImgNamed
            }
            //comAddOffTake
            if let comAddOff : String = self.comAdditionData["Offtake"] as? String{
                self.comAddOffTake = comAddOff
            }
            self.CMNTADDOff.append(self.comAddOffTake)

            if let valueCommentData: [Any]  = self.statusDict["commentData"] as? [Any] {
                self.comCommentData = valueCommentData
            }
            self.CMNTADDComentData.append(self.comCommentData)


            if let valueBroughtImage: [Any]  = self.statusDict["broughtByImages"] as? [Any] {
                self.comBroughtImgVal = valueBroughtImage
            }
            self.CMNTBroghtIMG.append(self.comBroughtImgVal)
                
            if let valueShoutListVal: NSDictionary  = self.statusDict["shout"] as? NSDictionary {
                self.comShoutListVal = valueShoutListVal
            }

            if let comShoutExclusive: String = self.comShoutListVal["isExclusive"] as? String {
                self.comIsExclusiveAdd = comShoutExclusive
            }
            self.CMNTEXClVal.append(self.comIsExclusiveAdd)

            if let comShoutMrpValue: String = self.comShoutListVal["mrp"] as? String {
                self.comMrpValue = comShoutMrpValue
            }
            self.CMNTMRP.append(self.comMrpValue)


            if let comShoutNew: String = self.comShoutListVal["isnew"] as? String {
                self.comIsNewAdd = comShoutNew
            }
            self.CMNTISNewM.append(self.comIsNewAdd)


            if let comShoutOffer: String = self.comShoutListVal["Offer"] as? String {
                self.comOfferValr = comShoutOffer
            }
            self.CMNTOFFESHT.append(self.comOfferValr)

            if let comShoutNameofPD: String = self.comShoutListVal["name"] as? String {
                self.comNameOfProd = comShoutNameofPD
            }
            self.CMNTNameProd.append(self.comNameOfProd)

            if let comShoutImgNamed: String = self.comShoutListVal["image"] as? String {
                self.comImgNamed = comShoutImgNamed
            }
            self.CMNTProdIMG.append(self.comImgNamed)

            if let comShoutMoqValue: String = self.comShoutListVal["moq"] as? String {
                self.comMoqValue = comShoutMoqValue
            }
            self.CMNTMOQV.append(self.comMoqValue)

            if let comShoutMoqValue: String = self.comShoutListVal["off_price"] as? String {
                self.comOffPriceVsalu = comShoutMoqValue
            }
            self.CMNTOFFPRic.append(self.comOffPriceVsalu)

            if let comShoutPriceNormal: String = self.comShoutListVal["price"] as? String {
                self.comPriceNormal = comShoutPriceNormal
            }
            self.CMNTPRicProd.append(self.comPriceNormal)

            if let comShoutMarginValue: String = self.comShoutListVal["margin"] as? String {
                self.comMarginValue = comShoutMarginValue
            }
            self.CMNTMArgVAl.append(self.comMarginValue)
                
            if let comShoutTiemrRel: String = self.comShoutListVal["time"] as? String {
                self.comTiemrRel = comShoutTiemrRel
            }
            self.CMNTTImeVal.append(self.comTiemrRel)

            if let comShoutIsDealVal: String = self.comShoutListVal["isDeal"] as? String {
                self.comIsDealVal = comShoutIsDealVal
            }
            self.CMNTISDeal.append(self.comIsDealVal)

            if let comShoutIsExperVal: String = self.comShoutListVal["isexperied"] as? String {
                self.comIsExperVal = comShoutIsExperVal
            }
            self.CMNTISEXP.append(self.comIsExperVal)
                
            if let comShoutExpText: String = self.comShoutListVal["experied_text"] as? String {
                self.comExpText = comShoutExpText
            }
            self.CMNTEXPTxt.append(self.comExpText)
                
            if let comShoutIsCOMboVla: String = self.comShoutListVal["iscombo"] as? String {
                self.comIsCOMboVla = comShoutIsCOMboVla
            }
            self.CMNTCOMBVal.append(self.comIsCOMboVla)
                
            if let comShoutSaveAMount: String = self.comShoutListVal["save_amount"] as? String {
                self.comSaveAMountVal = comShoutSaveAMount
            }
            self.CMNTSaveAMnt.append(self.comSaveAMountVal)
                
            if let comShoutComboTest: String = self.comShoutListVal["combotext"] as? String {
                self.comComboTestVal = comShoutComboTest
            }
            self.CMNTCOMBTxtt.append(self.comComboTestVal)

            if let comShoutComboImgVal: [Any] = self.comShoutListVal["comboimages"] as? [Any] {
                self.comComboImgVal = comShoutComboImgVal
            }
            self.CMNTCMBIMGSS.append(self.comComboImgVal)

            if let comShoutHsaOffTake: String = self.comShoutListVal["hasofftake"] as? String {
                self.comHsaOffTake = comShoutHsaOffTake
            }
            self.CMNTHasTakOfS.append(self.comHsaOffTake)

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
