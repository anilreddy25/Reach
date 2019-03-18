//
//  EditProfileShoutVC.swift
//  AgentRestocks
//
//  Created by apple on 12/26/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire


class EditProfileShoutVC: UIViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource, UIScrollViewDelegate {

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var popView: UIView!
  
    @IBOutlet weak var ratedView: UIView!
    
    @IBOutlet weak var lblProfileName: UILabel!
    
    @IBOutlet weak var lblStoreandFancy: UILabel!
    
    @IBOutlet weak var lblLastSeen: UILabel!
    
    @IBOutlet weak var lblRated: UILabel!
    
    @IBOutlet weak var imgStar: UIImageView!
    
    
    @IBOutlet weak var btnCall: UIButton!
    
    @IBOutlet weak var btnCallRate: UIButton!
    
    @IBOutlet weak var btnChat: UIButton!
    
    @IBOutlet weak var btnChatRate: UIButton!
    
    @IBOutlet weak var businessView: UIView!
    
    @IBOutlet weak var lblBusiness: UILabel!
    
    @IBOutlet weak var lblTodayOpen: UILabel!
    
    @IBOutlet weak var lblHoursOnDay: UILabel!
    
    @IBOutlet weak var followView: UIView!
    
    
    @IBOutlet weak var followingView: UIView!
    
    @IBOutlet weak var btnFollowround: UIButton!
    
    @IBOutlet weak var lblFollowingCount: UILabel!
    
    @IBOutlet weak var followerView: UIView!
    
    @IBOutlet weak var lblFollowerCount: UILabel!
    
    @IBOutlet weak var sharedView: UIView!
    
    @IBOutlet weak var shoutView: UIView!
    
    @IBOutlet weak var colorShout: UIView!
    
    @IBOutlet weak var commentView: UIView!
    
    @IBOutlet weak var colorComment: UIView!
    
    @IBOutlet weak var likeView: UIView!
    
    @IBOutlet weak var colorLikes: UIView!
    
    @IBOutlet weak var colorMedia: UIView!
    @IBOutlet weak var mediaView: UIView!
    
    @IBOutlet weak var scrollPager: ScrollPagertwo!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var shoutClickView: UIView!
    
    @IBOutlet weak var commentClickView: UIView!
    
    @IBOutlet weak var likeClickView: UIView!
    
    @IBOutlet weak var mediaClickView: UIView!
    
    @IBOutlet weak var viewToAll: UIView!
    
    @IBOutlet weak var viewOfShout: UIView!
    
    @IBOutlet weak var lblTimeAgo: UILabel!
    
    @IBOutlet weak var lblNameProfle: UILabel!
    
    @IBOutlet weak var lblReshouted: UILabel!
    @IBOutlet weak var imgShout: UIImageView!
    
    @IBOutlet weak var imgProfileSet: UIImageView!
    
    @IBOutlet weak var imgDown: UIImageView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var lblCustomerFeed: UILabel!
    
    @IBOutlet weak var productShoutView: UIView!
    
    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var imgProducts: UIImageView!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblPercentage: UILabel!
    
    @IBOutlet weak var lblStrikePrice: UILabel!
    
    @IBOutlet weak var lblTimerValue: UILabel!
    
    @IBOutlet weak var lblDayStock: UILabel!
    
    @IBOutlet weak var lblNoOutBought: UILabel!
    
    @IBOutlet weak var imgDays: UIImageView!
    
    @IBOutlet weak var btnMShare: UIButton!
    
    @IBOutlet weak var btnMmute: UIButton!
    
    @IBOutlet weak var btnMBlock: UIButton!
    
    @IBOutlet weak var btnMReport: UIButton!
    
    var myagentTotalvalue = String()
    var Myauthorisationstringfinalvalue = String()
    var useridbiling =  String()
    
    var statusValue = String()
    var commentValue = [Any]()
    var shoutValue = [Any]()
    var businessTime = [Any]()
    var likedValues = [Any]()
    var profileValue = [String: Any]()
    var isVerifyID = String()
    var isratingID =  Int()
    var verifyStatus = String()
    var profileimageStatus =  String()
    var profileDayStatus = String()
    var profileStatus = Int()
    var agentValue = String()
    var mobileNo = String()
    var businesVtime = String()
    var nameEstablish = String()
    var distributorName = String()
    var statusDict = [String: Any]()
    var statusPend = Int()
    var statusFollowers = Int()
    var statusFollowing = Int()
    var valueArr = [Any]()
    var stufDict = [String: Any]()
    var statValue = String()
    
    
    
    // Comments
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
    
    
    
    
    
    //Shouts
    
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
    
    private var pageController: UIPageViewController!
    private var arrVC:[UIViewController] = []
    private var currentPage: Int!
    var segmentedControl: CustomSegmentedContrl!
    
    
    /// Instantiate ViewControllers Here With Lazy Keyword
    
    // MARK: Order ViewController
    lazy var editShout: editShoutVC = {
        
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "editShoutVC") as! editShoutVC
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    // MARK: MARKET ViewController
    
    lazy var editComent: editComentVC = {
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "editComentVC") as! editComentVC
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    // MARK: GRAPH ViewController
    
    lazy var editLike: editLikeVC = {
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "editLikeVC") as! editLikeVC
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
    
    lazy var editShare: editShareVC = {
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "editShareVC") as! editShareVC
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
    
    lazy var editMedia: editMediaVC = {
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "editMediaVC") as! editMediaVC
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnFollowround.layer.cornerRadius = 25.0
        btnFollowround.clipsToBounds = true
        
        
//    btnFollowround.roundCornerButton(sender: btnFollowround)
        
//    productShoutView.layer.borderWidth = 1.0
//    productShoutView.layer.borderColor = UIColor.lightGray.cgColor
//    productShoutView.layer.cornerRadius = 5.0
        
        
    sharedView.layer.borderWidth = 1.0
    sharedView.layer.borderColor = UIColor.lightGray.cgColor
        
    followView.layer.borderWidth = 1.0
    followView.layer.borderColor = UIColor.lightGray.cgColor
        
    businessView.layer.borderWidth = 1.0
    businessView.layer.borderColor = UIColor.lightGray.cgColor
        
        btnMmute.layer.cornerRadius = 25.0
        btnMmute.clipsToBounds = true
        
        btnMBlock.layer.cornerRadius = 25.0
        btnMBlock.clipsToBounds = true
        btnMShare.layer.cornerRadius = 25.0
        btnMShare.clipsToBounds = true
        btnMReport.layer.cornerRadius = 25.0
        btnMReport.clipsToBounds = true
        
    
        self.editProfileScroll()
        currentPage = 0
        createPageViewController()
        
        arrVC.append(editComent)
        arrVC.append(editShout)
        arrVC.append(editLike)
        arrVC.append(editShare)
        arrVC.append(editMedia)

        
        
        DispatchQueue.main.async {
            self.otherProfileShout()
        }
    }
    
    
    
    func editProfileScroll() {
        segmentedControl = CustomSegmentedContrl.init(frame: CGRect.init(x: 0, y: self.view.frame.height - 350, width: self.view.frame.width, height: 45))
        //        segmentedControl
        
        segmentedControl.backgroundColor = .white
        segmentedControl.commaSeperatedButtonTitles = "Coments, Shouts, Likes, Shares, Media"
        segmentedControl.addTarget(self, action: #selector(onChangeOfSegment(_:)), for: .valueChanged)
        
        self.view.addSubview(segmentedControl)
        
    }
    
    
    @IBAction func btnBackPopAction(_ sender: Any) {
    
    
    }
    
    @IBAction func btnMenuDotAction(_ sender: UIButton) {
        
        let btn = sender
        
        if btn.isSelected {
            viewToAll.isHidden = true
            btn.isSelected = false
        }else{
            viewToAll.isHidden = false
            btn.isSelected = true
        }
        
    }
    
    @IBAction func btnCallAction(_ sender: Any) {
    
     }
    

    @IBAction func btnChatAction(_ sender: Any) {
    
  
    }
    

    @IBAction func btnBusinessTimeAction(_ sender: Any) {
  
    }
    
    @IBAction func btnFollowAction(_ sender: UIButton) {
    
        let btn = sender
        
        if btn.isSelected {
            btn.setTitle("Follow", for: .normal)
            btn.backgroundColor = UIColor(displayP3Red: 101/255, green: 170/255, blue: 228/255, alpha: 1.0)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.isSelected = false
           
        }else{
            btn.setTitle("Requested", for: .normal)
            btn.backgroundColor = UIColor.clear
            btn.tintColor = UIColor.gray
            btn.addTarget(self, action: #selector(addRequestItem), for: .touchUpInside)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.isSelected = true
        }
    }
    @objc func addRequestItem(sender: UIButton)  {
            let btn =  sender
        btn.setTitle("Unfollow", for: .normal)
        btn.tintColor = UIColor.gray
    
    
    
    }
    
    @IBAction func btnShoutAction(_ sender: UIButton) {
    
            shoutClickView.isHidden = false
            colorShout.backgroundColor = UIColor.red
            colorMedia.backgroundColor = UIColor.lightGray
            colorLikes.backgroundColor = UIColor.lightGray
            colorComment.backgroundColor = UIColor.lightGray
            self.otherProfileShout()
        
    }
    

    @IBAction func btnCommentAction(_ sender: Any) {
        shoutClickView.isHidden = true
        commentClickView.isHidden = false
        colorComment.backgroundColor = UIColor.red
        colorShout.backgroundColor = UIColor.lightGray
        colorMedia.backgroundColor = UIColor.lightGray
        colorLikes.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func btnLikesAction(_ sender: Any) {

        shoutClickView.isHidden = true
        likeClickView.isHidden = false
        colorLikes.backgroundColor = UIColor.red
        colorShout.backgroundColor = UIColor.lightGray
        colorComment.backgroundColor = UIColor.lightGray
        colorMedia.backgroundColor = UIColor.lightGray
    }
    


    @IBAction func btnMediaAction(_ sender: Any) {
        shoutClickView.isHidden = true

        mediaClickView.isHidden = false
        colorMedia.backgroundColor = UIColor.red
        colorShout.backgroundColor = UIColor.lightGray
        colorLikes.backgroundColor = UIColor.lightGray
        colorComment.backgroundColor = UIColor.lightGray
 
    }


    @IBAction func btnVCommentAction(_ sender: Any) {
    
    
    }
    
    @IBAction func btnVShoutAction(_ sender: Any) {
    
        self.otherProfileShout()

    }
    
    @IBAction func btnVShareAction(_ sender: Any) {
    
    
    }
    
    @IBAction func btnVSaveLaterAction(_ sender: Any) {
    
    
    }
    
    @IBAction func btnVLikeAction(_ sender: Any) {
   
    
    }
    

    @IBAction func btnDotShareAction(_ sender: Any) {
    
    
    }
    
    @IBAction func btnDotMuteAction(_ sender: Any) {
   
    
    }
    
    @IBAction func btnDotBlockAction(_ sender: Any) {
    
    }
    
    @IBAction func btnDotReportAction(_ sender: Any) {
    
        
    }
    
    
    
    func otherProfileShout() {
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlEditShout)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1NDgwNDk1NzcsImlzcyI6ImxvY2FsaG9zdCIsImV4cCI6MTU0ODA1MDQ3NywidXNlcklkIjoiQTcwMTUzIn0.DzfgchlGrKPtC-OxEVoCdlrQxQWy06iPSaWopBEO1mA"
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = "A70153"
        }
        let postStringfinlavalue =  String(format: "agentId=%@&userid=%@&type=%@&Authorization=%@&AgentID=%@","127","127","shout",self.Myauthorisationstringfinalvalue,self.myagentTotalvalue)
        
        
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling, forHTTPHeaderField:"AgentID")
        
        request.httpBody = postStringfinlavalue.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
            
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    if let statusID: String = dict["Status"] as? String{
                        self.statusValue = statusID
                    }
                    

                    if let businessVal: [Any] = dict["followers"] as? [Any] {
                        self.businessTime = businessVal
                    }
                    
                      for i in 0 ..< self.businessTime.count {
                        if let dictValue: NSDictionary = self.businessTime[i] as? NSDictionary{
                            self.statusDict = (dictValue as? [String : Any])!
                        }
                        if let valuePend: Int = self.statusDict["pending"] as? Int {
                            self.statusPend = valuePend
                        }
                        if let valueFollower: Int = self.statusDict["followers"] as? Int {
                            self.statusFollowers = valueFollower
                        }
                        self.lblFollowerCount.text = String(self.statusFollowers)
                        
                        if let valueFollowing: Int = self.statusDict["following"] as? Int {
                            self.statusFollowing = valueFollowing
                        }
                        self.lblFollowingCount.text = String(self.statusFollowing)
                        
                        if let valueFollStatus : [Any] = self.statusDict["followstatus"] as? [Any] {
                            self.valueArr = valueFollStatus
                        }
                        for  j in 0 ..< self.valueArr.count {
                            if let dicValue: NSDictionary = self.valueArr[j] as? NSDictionary{
                                self.stufDict = (dicValue as? [String : Any])!
                            }
                            if let valueStat : String = self.stufDict["status"] as? String {
                                self.statValue = valueStat
                            }
                        }
                    }
                    
                   

                    if let profileVal : [String: Any] = dict["profileData"] as? [String: Any] {
                        self.profileValue = profileVal
                    }
                    
                    if let verifyID : String = self.profileValue["IsVerify"] as? String {
                        self.isVerifyID = verifyID
                    }
                
                    if let ratingID : Int = self.profileValue["rating"] as? Int {
                        self.isratingID = ratingID
                    }
                    
                    self.lblRated.text = String(self.isratingID)

                    //verifiedStatus
                 
                    if let verifyStatusID : String = self.profileValue["verifiedStatus"] as? String {
                        self.verifyStatus = verifyStatusID
                    }
                    //self..text = self.verifyStatus

                    
                    //agentprofileimage
                    if let profileimageID : String = self.profileValue["agentprofileimage"] as? String {
                        self.profileimageStatus = profileimageID
                    }
                    let url = URL(string: self.profileimageStatus)
                    let data = try? Data(contentsOf: url!)
                    
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        self.imgProfile.image = image
                    }
                    
                   
                    if let Businesshoursvalue: String = self.profileValue["BusinessHours"] as? String
                    {
                        self.businesVtime = Businesshoursvalue
                    }
                    var eventStr: NSAttributedString? = nil

                    if let anEncoding = self.businesVtime.data(using: .utf8) {
                        eventStr = try? NSAttributedString(data: anEncoding, options: [.documentType: NSAttributedString.DocumentType.html.rawValue, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
                    }
                   self.lblTodayOpen.attributedText = eventStr

                    //today
                    
                    if let dayStatus : String = self.profileValue["today"] as? String {
                        self.profileDayStatus = dayStatus
                    }
                    
                    //status
                    if let prStatus : Int = self.profileValue["status"] as? Int {
                        self.profileStatus = prStatus
                    }
                    //IdAgents
                    if let agentID : String = self.profileValue["IdAgents"] as? String {
                        self.agentValue = agentID
                    }
                    //MobileNo
                    if let mobileID : String = self.profileValue["MobileNo"] as? String {
                        self.mobileNo = mobileID
                    }
                    
                    if let establishName : String = self.profileValue["NameofEstablishment"] as? String {
                        self.nameEstablish = establishName
                    }
                    self.lblStoreandFancy.text = self.nameEstablish

                    if let distName : String = self.profileValue["name"] as? String {
                        self.distributorName = distName
                    }
                    self.lblProfileName.text = self.distributorName
                    
                    if let likeVal: [Any] = dict["likes"] as? [Any] {
                        self.likedValues = likeVal
                    }
                    
                    for i in 0 ..< self.likedValues.count {
                        if let dictValue: [String : Any] = self.likedValues[i] as? [String : Any]{
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
                    
                    if let commentID: [Any] = dict["comments"] as? [Any]{
                        self.commentValue = commentID
                    }
                    
                    for i in 0 ..< self.commentValue.count {
                        if let dictValue: NSDictionary = self.commentValue[i] as? NSDictionary{
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
                    
                    
                    
                    
                    
                    
                    
                    if let shoutID: [Any] = dict["shouts"] as? [Any]{
                        self.shoutValue = shoutID
                    }
                    for i in 0 ..< self.shoutValue.count {
                        if let dictValue: NSDictionary = self.shoutValue[i] as? NSDictionary{
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
                    
                    
                }

                break
            case .failure(_):
                print("anil reddy")
            }
        }
        
    }
    
    private func createPageViewController() {
        
        pageController = UIPageViewController.init(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: nil)
        
        pageController.view.backgroundColor = UIColor.clear
        pageController.delegate = self
        pageController.dataSource = self
        
        for svScroll in pageController.view.subviews as! [UIScrollView] {
            svScroll.delegate = self
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.pageController.view.frame = CGRect(x: 0, y: self.segmentedControl.frame.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
        }
        
        // arrVC = [vc1, vc2, vc3]
        
        pageController.setViewControllers([editComent], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
        self.addChildViewController(pageController)
        self.view.addSubview(pageController.view)
        pageController.didMove(toParentViewController: self)
    }
    
    
    private func indexofviewController(viewCOntroller: UIViewController) -> Int {
        if(arrVC .contains(viewCOntroller)) {
            return arrVC.index(of: viewCOntroller)!
        }
        
        return -1
    }
    
    
    //MARK: - Pagination Delegate Methods
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = indexofviewController(viewCOntroller: viewController)
        
        if(index != -1) {
            index = index - 1
        }
        
        if(index < 0) {
            return nil
        }
        else {
            return arrVC[index]
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = indexofviewController(viewCOntroller: viewController)
        
        if(index != -1) {
            index = index + 1
        }
        
        if(index >= arrVC.count) {
            return nil
        }
        else {
            return arrVC[index]
        }
        
    }
    
    func pageViewController(_ pageViewController1: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if(completed) {
            currentPage = arrVC.index(of: (pageViewController1.viewControllers?.last)!)
            // self.segmentedControl.selectedSegmentIndex = currentPage
            
            self.segmentedControl.updateSegmentedControlSegs(index: currentPage)
            
        }
        
    }
    
    @objc func onChangeOfSegment(_ sender: CustomSegmentedContrl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0:
            pageController.setViewControllers([arrVC[0]], direction: UIPageViewControllerNavigationDirection.reverse, animated: true, completion: nil)
            currentPage = 0
            
        case 1:
            if currentPage > 1{
                pageController.setViewControllers([arrVC[1]], direction: UIPageViewControllerNavigationDirection.reverse, animated: true, completion: nil)
                currentPage = 1
            }else{
                pageController.setViewControllers([arrVC[1]], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
                currentPage = 1
                
            }
        case 2:
            if currentPage < 2 {
                pageController.setViewControllers([arrVC[2]], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
                currentPage = 2
                
                
            }else{
                pageController.setViewControllers([arrVC[2]], direction: UIPageViewControllerNavigationDirection.reverse, animated: true, completion: nil)
                currentPage = 2
                
            }
        case 3:
            if currentPage < 3 {
                pageController.setViewControllers([arrVC[3]], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
                currentPage = 3
                
                
            }else{
                pageController.setViewControllers([arrVC[3]], direction: UIPageViewControllerNavigationDirection.reverse, animated: true, completion: nil)
                currentPage = 3
            }
        case 4:
            if currentPage < 4 {
                pageController.setViewControllers([arrVC[4]], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
                currentPage = 4
                
                
            }else{
                pageController.setViewControllers([arrVC[4]], direction: UIPageViewControllerNavigationDirection.reverse, animated: true, completion: nil)
                currentPage = 4
            }
            
            
            
            
        default:
            break
        }
        
        
    }
    
}



extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.frame = self.bounds
        mask.path = path.cgPath
        layer.mask = mask
    }
}

