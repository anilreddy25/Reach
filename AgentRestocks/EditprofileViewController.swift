//
//  EditprofileViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 04/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation
import Photos
import AssetsLibrary
import Alamofire
import AlamofireImage
import SDWebImage
import AFNetworking
import Photos
import AssetsLibrary
import WebKit
import CoreLocation
import Alamofire
import AlamofireImage
import AFNetworking


class EditprofileViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate,ScrollPagerDelegatetwo, UIScrollViewDelegate,UIPageViewControllerDataSource, UIPageViewControllerDelegate, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var imageone: UIImageView!
    @IBOutlet weak var selectbusinessname: UILabel!
    @IBOutlet weak var selectbusinessowner: UILabel!
    @IBOutlet weak var phonenumberlabel: UILabel!
    @IBOutlet weak var Kycpendinglabel: UILabel!
    @IBOutlet weak var privateaccountlabel: UILabel!
    var selectbusinessnamestring = String()
    var selectbusinessownerstring = [String]()
    var selectphonenumberlabelstring = [String]()
    var Kycpendinglabelstring = [String]()
    var businesshoursstringlabel = [String]()
    @IBOutlet weak var swicth: UISwitch!
    @IBOutlet weak var followinglabel: UILabel!
    @IBOutlet weak var follwerslabel: UILabel!
    @IBOutlet weak var pendinglabel: UILabel!
    @IBOutlet weak var businesshourslabel: UILabel!
    var myPickerController = UIImagePickerController()
    @IBOutlet weak var scrollView: UIScrollView!
    
     var tableList = UITableView()
    
    @IBOutlet weak var satrlabel: UILabel!
    var starstring = [String]()
    var followinglabelstring = [String]()
    var follwerslabelstring = [String]()
    var pendinglabelstring = [String]()
    var privateaccountlabelstring = [String]()
    @IBOutlet weak var myscrollpagertwo: ScrollPagertwo!
    @IBOutlet weak var editprofilescrollview: UIScrollView!
    var CombofirstView  = UIView()
    var CombosecondView  = UIView()
    var Combothiredview  = UIView()
    var Combofourthview  = UIView()
    var ComboFifthView = UIView()
    @IBOutlet weak var viewImgLbl: UIView!
    @IBOutlet weak var viewHourLbl: UIView!
    
    @IBOutlet weak var viewFollowBtn: UIView!
    @IBOutlet weak var combofirstviewone: UIView!
    @IBOutlet weak var combosecondviewtwo: UIView!
    @IBOutlet weak var combothirdviewone: UIView!
    @IBOutlet weak var combofourthviewone: UIView!
    @IBOutlet weak var combofifthViewSave: UIView!
    
    @IBOutlet weak var viewFollowerAction: UIView!
    
    @IBOutlet weak var viewAllBtnAction: UIView!
    @IBOutlet weak var myshoutbutton: UIButton!
    @IBOutlet weak var mycommentsbutton: UIButton!
    @IBOutlet weak var myLikesbuttton: UIButton!
    @IBOutlet weak var mysharebutton: UIButton!
    @IBOutlet weak var mySavebutton: UIButton!
    
    @IBOutlet weak var singelviewone: UIView!
    @IBOutlet weak var singelviewtwo: UIView!
    @IBOutlet weak var singelviewthree: UIView!
    @IBOutlet weak var singelviewfour: UIView!
    @IBOutlet weak var singelviewfive: UIView!
    
    var coverView = UIView()
    var imageView = UIImageView()
    
    @IBOutlet weak var btnNotify: UIButton!
    @IBOutlet weak var btnFollowing: UIButton!
    
    @IBOutlet weak var chatsviewone: UIView!
    
    @IBOutlet weak var cahtsbuttonone: UIButton!
    
    @IBOutlet weak var chatssingelview: UIView!
    
    
    @IBOutlet weak var compiantsview: UIView!
    
    @IBOutlet weak var Complaintsbuttonone: UIButton!
    
    @IBOutlet weak var compliantssingelview: UIView!
    
    @IBOutlet weak var AMrketingviewone: UIView!
    
    @IBOutlet weak var marketingbuttonone: UIButton!
    
    @IBOutlet weak var marketingsingellineview: UIView!
    
    
    private var pageController: UIPageViewController!
    private var arrVC:[UIViewController] = []
    private var currentPage: Int!
    var segmentedControl: CustomSegmentedContrl!

    
    var EditprofiledescriptionViewall = String()
    
    var MymobilenumbervalueViewall = String()
  
    var Businesshours = String()
    var BusinessIdAgents = String()
    var BusinessIsVerify = String()
    var BusinessIsMobileNo = String()
    var BusinessNameofEstablishment = String()
    var BusinessNameagentprofileimage = String()
    var BusinessNameagentname = String()
    var BusinessNameagentrating = String()
    var BusinessNameagentstatus = String()
    var BusinessNameagenttoday = String()
    var BusinessNameverifiedStatus = String()
    
    
    var useridbiling =  String()
    var Myauthorisationstringfinalvalue =  String()
    var myagentTotalvalue =  String()
    var Dictfinal  = NSMutableDictionary()
    
    //Data
    var profileDataValue = [String: Any]()
    var followersValue = [Any]()
    var commentsValue = [Any]()
    var statusValue = String()
    var likesValue = [Any]()
    var shoutsValue = [Any]()
    var saveValue = [Any]()
    
    //followers
    var statusDict = [String: Any]()
    var statusName = String()
    var statusPend = Int()
    var statusFollowers = String()
    var statusFollowing = String()
    var valueArr = [Any]()
    var stufDict = [String: Any]()
    var statValue = String()
    
    //ProfileData
    var isVerifyID = String()
    var isratingID =  Int()
    var verifyStatus = String()
    var profileimageStatus =  String()
    var profileDayStatus = String()
    var profileStatus = Int()
    var agentValue = String()
    var mobileNo = String()
    var nameEstablish = String()
    var distributorName = String()
    
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
    
    
    
    //Save Value
    
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
    var filecattypestring = String()
    var FileTypestring = String()
    var ImageTypestring = String()
    var StatusTypestring = String()
    var StatusCodestring = String()
    var uploadstring = [String]()
    
    /// Instantiate ViewControllers Here With Lazy Keyword

    // MARK: Shout ViewController
    
    var androidSwitchSmall : MJMaterialSwitch!
    let kSmallSwitch = 1
    let kMediumSwitch = 2
    let kLargeSwitch = 3
    
    
    @IBOutlet weak var HomeScrollviewfinal: UIScrollView!
    
    @IBOutlet weak var Editlabelfinalavalue: UILabel!
    @IBOutlet weak var mycamerabutton: UIButton!
    
    @IBOutlet weak var Editbutton: UIButton!

    @IBOutlet weak var myimage: UIImageView!
    
    @IBOutlet weak var myedittotalviefinal: UIView!
    
    @IBOutlet weak var seconviewtotalvalue: UIView!
    
    
    @IBOutlet weak var myeditcamerabutton: UIButton!
    @IBOutlet weak var myeditbutton: UIButton!
    @IBOutlet weak var myEditnamelabel: UILabel!
    @IBOutlet weak var myeditimageview: UIImageView!
    
    
    ///// Edit account Deatils values
    
    
    var businessDict = NSDictionary()
    var businessDictsingel = NSDictionary()
    var businessDicttwo = NSDictionary()
    
    var businessname =  String()
    var businessemail_id = String()
    var businessnumber = String()
    var businessgender = String()
    var businessdate_of_birth = String()
    var businesspassword = String()
    var businesspan = String()
    var businessgst = String()
    var Editbusiness =  String()
    var dictfinalvalue = NSDictionary()
    var Editaccounttimer = Timer()
    var Busineesimagefinalvalue =  [String]()
    var Businesautharry =  [String]()
    var businessImageDictfinalvalue = NSDictionary()
    var Uploadauthorisiationdocueemnt = NSDictionary()
    var uploadidproof = NSDictionary()
    var businessDictarray = NSArray()
    var Uploadauthorisiationdocueemntarray = NSArray()
    var uploadidproofarray = NSArray()
    
    var uploadtextbusinessnamelvalue = String()
    var uploadtextauth_documentvalue = String()
    var uploadtextid_proofvalue = String()
    
    var othersstring = NSArray()
    //    var othersstringhelp = NSDictionary()
    
    var othersstringhelp = NSArray()
    
    var othersdictfinal = NSDictionary()
    
    //    var othersstringid = NSString()
    
    var othersstringid = NSArray()
    var othersstringhelpName = NSArray()
    
    var Recomendeddictvalue = NSDictionary()
    
    var Questionfinalvalue = [String]()
    var Answervalue = [String]()
    
    var catgeroryfinalvalue = [String]()
    
    var billingJSON = NSDictionary()
    var billingJSONadresslocation = String()
    var billingJSONasaveAsfinalvalue = String()
    
    
    var auhthDocuementcatageory  = String()
    
    var id_prooffilecatageory  = String()
    
    var Businesslicencecatageory  = String()
    
    var BusinesslicencecatageoryImage  = String()
    var BusinesslicencecatageoryimageName  = String()
        var authorisationcatageoryImage  = String()
    var authorisationcatageoryimageName  = String()
    var id_proofcatageoryImage  = String()
    var id_proofimageName  = String()
    var BillingDictone = NSDictionary()
    var BillingDicttwo = NSDictionary()
    var DeliveryDictone = NSDictionary()
    var DeliveryDicttwo = NSDictionary()
    var DeliveryaccountDictfinal  = NSMutableDictionary()
    var Deliveryadressone = NSDictionary()
    var DeliveryadressTwofinalvalue = NSDictionary()
    var Deliveryadresslocation = String()
    var deliveryJSONasaveAsfinalvalue = String()
    var DeliveryDicthtree = NSDictionary()
    var DeliveryDictfour = NSDictionary()
    var Deliveryadresslocationtwo = String()
    var deliveryJSONasaveAsfinalvaluetwo = String()
    var Mobilevericationvalue = String()
    var Mobilevericationcolor = String()
    var uploadauthone  = String()
    var uploadauthonecolor  = String()
    var uploadauthtwo  = String()
    var uploadauthtwocolor  = String()
    var uploadauththree  = String()
    var uploadauththreecolor  = String()
    var Editdefaults = UserDefaults.standard
    var mobilenumber = String()
    
    
    
    //// Editprofile details
    
    
    var Editname = String()
    var EditNameofEstablishment = String()
    var EditMobileNo = String()
    var EditIdAgents = String()
    var Editstatus = String()

    var EditKycapproved = String()
    var EditBusineshours = String()
    var Editrating = String()
    var Editrating1 = NSNumber()
    var EdiIsVerify = String()
    var EdiIsverifiedStatus = String()
    var EdiIsverifiedagentprofileimage = String()

    @IBOutlet weak var viewPendingS: UIView!
    @IBOutlet weak var viewFollowingS: UIView!
    @IBOutlet weak var viewFOllowerS: UIView!
    
    var strID = String()
    var listOfID = [Any]()
    var dictProfile = [String:Any]()
    var strButton = String()
    var isboolPending = Bool()
    var notifyValue = String()
    
    @IBOutlet weak var btnFollow: UIButton!
    
    @IBOutlet weak var btnRequested: UIButton!
         var valueID = Int()
    
    var useridbiling1  = String()
    
    var productdescriptionuseridbiling  = String()
    
    var folloowpostString = String()
    
    
    @IBOutlet weak var mycameratabelview: UITableView!
    
    @IBOutlet weak var dropviewtotal: UIView!
    
    @IBOutlet weak var roundshadow: UIView!
    
    @IBOutlet weak var popupscrollview: UIScrollView!
    
    var selectCameraproofstring = [String]()

    
    @IBOutlet weak var finalviewtwo: UIView!
    
     var profileselectedIndex :Int?

    
    var Tickedstringfinal = String()
    
    
    var lattitude = Double()
    var longitude = Double()
    let locationManager = CLLocationManager()
    var address = NSString()

    @IBOutlet weak var singellineviewTotal: UIView!
    
    var AcessTokenfinalstring = String()
    

    
    lazy var editShout: editShoutVC = {
        
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "editShoutVC") as! editShoutVC
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    // MARK: Comment ViewController
    
    lazy var editComent: editComentVC = {
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "editComentVC") as! editComentVC
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
    }()
    
    // MARK: Like ViewController
    
    lazy var editLike: editLikeVC = {
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "editLikeVC") as! editLikeVC
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
    
    // MARK: Share ViewController

    
    lazy var editShare: editShareVC = {
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "editShareVC") as! editShareVC
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
    
    // MARK: Save ViewController

    lazy var editSave: editSaveVC = {
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: "editSaveVC") as! editSaveVC
        //self.addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        privateaccountlabelstring = ["Private account"]
        privateaccountlabel.text = privateaccountlabelstring[0]
        
        self.editElementsValue()
        currentPage = 0
        self.createPageViewController()
        print(self.strID)
        
        arrVC.append(editShout)
        arrVC.append(editComent)
        arrVC.append(editLike)
       // arrVC.append(editShare)
        arrVC.append(editSave)
        
        tableList.delegate = self
        tableList.dataSource = self
        
       btnRequested.isHidden = true
    
        btnFollow.isHidden = true
     

        if self.view.frame.size.height < 800
        {
            HomeScrollviewfinal.delegate = self
            HomeScrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0,1000, 0)
            HomeScrollviewfinal.isScrollEnabled = true
            HomeScrollviewfinal.showsVerticalScrollIndicator = false
        }
        myimage.layer.borderWidth = 1
        myimage.layer.masksToBounds = false
        myimage.layer.borderColor = UIColor.white.cgColor
        myimage.layer.cornerRadius = myimage.frame.height/2
        myimage.clipsToBounds = true

        self.singellineviewTotal.layer.cornerRadius = 5.0
        self.singellineviewTotal.clipsToBounds = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleviewPendingSTap(_:)))
        
        viewPendingS.addGestureRecognizer(tap)
        
        viewPendingS.isUserInteractionEnabled = true
        
        
        
        let taptwo = UITapGestureRecognizer(target: self, action: #selector(self.viewFollowingShandleTap(_:)))
        
        viewFollowingS.addGestureRecognizer(taptwo)
        
        viewFollowingS.isUserInteractionEnabled = true
        
        let tapthree = UITapGestureRecognizer(target: self, action: #selector(self.viewFOllowerSShandleTap(_:)))
        
        viewFOllowerS.addGestureRecognizer(tapthree)
        
        viewFOllowerS.isUserInteractionEnabled = true
   
        if isboolPending == true
        {
            
            self.viewHourLbl.isHidden = true
            self.viewFollowBtn.isHidden = true
            
            self.viewPendingS.isHidden = true
            self.viewFollowingS.frame = CGRect(x: 0, y: 0, width: 125, height: 40)
            self.viewFOllowerS.frame = CGRect(x: 130, y: 0, width: 125, height: 40)
            self.viewFollowerAction.frame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 45)
            segmentedControl = CustomSegmentedContrl.init(frame: CGRect.init(x: 0, y: self.HomeScrollviewfinal.frame.height - 500, width: self.HomeScrollviewfinal.frame.width, height: 45))
            
            segmentedControl.backgroundColor = .white
            segmentedControl.commaSeperatedButtonTitles = "Shouts,Comments,Likes, Media"
            segmentedControl.addTarget(self, action: #selector(onChangeOfSegment(_:)), for: .valueChanged)
            self.HomeScrollviewfinal.addSubview(segmentedControl)
            mycamerabutton.isHidden = true
            Editbutton.isHidden = true
            myeditcamerabutton.isHidden = true
            myeditbutton.isHidden = true
            
            if self.strButton == "Requested" {
                btnRequested.isHidden = false
                btnRequested.layer.cornerRadius = 12.0
                btnRequested.clipsToBounds = true
                btnRequested.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
                btnRequested.layer.borderWidth = 1.0
                
            }
            
            if self.strButton == "Follow" {
                btnFollow.isHidden = false
                btnFollow.layer.cornerRadius = 12.0
                btnFollow.clipsToBounds = true
                btnRequested.layer.borderWidth = 1.0
                btnFollow.addTarget(self, action: #selector(btnFollowAction), for: .touchUpInside)
            }
            
            if self.strButton == "Following" {
                btnFollowing.isHidden = false
                btnFollowing.layer.cornerRadius = 12.0
                btnFollowing.clipsToBounds = true
                btnFollowing.layer.borderWidth = 1.0
                btnFollowing.addTarget(self, action: #selector(btnFollowingActionType), for: .touchUpInside)
                btnNotify.isHidden = false
                
                if self.notifyValue == "1" {
                    btnNotify.setBackgroundImage(#imageLiteral(resourceName: "notifyMe"), for: .normal)
                }
                if self.notifyValue == "0" {
                 btnNotify.setBackgroundImage(#imageLiteral(resourceName: "notify"), for: .normal)
                }
                btnNotify.addTarget(self, action: #selector(btnNotifiedAction), for: .touchUpInside)
            }
            
            
            DispatchQueue.main.async
                {
                    if self.isboolPending == true
                    {
                        self.Editpendingaccountvalue()
                    }
            }
        }
        else if  isboolPending == false
        {
            DispatchQueue.main.async {
                self.editShoutLike()
                
            }
        }
        
//
//        let bottomSheettwo = JXBottomSheetView(contentView:(popupscrollview)!)
//        bottomSheettwo.defaultMaxinumDisplayHeight  = 550
//        bottomSheettwo.defaultMininumDisplayHeight = 0
//        bottomSheettwo.displayState = .maxDisplay
//        self.finalviewtwo.addSubview(bottomSheettwo)
        self.dropviewtotal.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        
    self.roundshadow.roundedButton()
 
        
        selectCameraproofstring = ["Camera","Gallery"]
//        self.selectcamerabottomview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:1.0)
        self.mycameratabelview.dataSource = self
        self.mycameratabelview.delegate = self

    }
    @objc func handleviewPendingSTap(_ sender: UITapGestureRecognizer)
    {
        DispatchQueue.main.async
            {
       let editPendingVCtotal = self.storyboard?.instantiateViewController(withIdentifier:"editPendingVC")as!editPendingVC
        self.present(editPendingVCtotal, animated:true, completion:nil)
        }
    }
    
    @objc func viewFollowingShandleTap(_ sender: UITapGestureRecognizer)
    {
       DispatchQueue.main.async
        {
            let editFollowingVCtotal = self.storyboard?.instantiateViewController(withIdentifier:"editFollowingVC")as!editFollowingVC
            self.present(editFollowingVCtotal, animated:true, completion:nil)
        }
        
    }
    @objc func viewFOllowerSShandleTap(_ sender: UITapGestureRecognizer)
    {
        DispatchQueue.main.async
            {
                let editFollowerVCtotal = self.storyboard?.instantiateViewController(withIdentifier:"editFollowerVC")as!editFollowerVC
                self.present(editFollowerVCtotal, animated:true, completion:nil)
        }
    }
    
    
    //MARK: - Button Action
    
    @objc func btnFollowAction(_ sender:UIButton)
    {
        let btnTag = sender
        
        
        sender.layer.cornerRadius = 12.0
        sender.clipsToBounds = true
        sender.layer.borderWidth = 1.0
        sender.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        valueID = btnTag.tag
        
        // self.listofSuggested.remove(at: valueID)
        
        DispatchQueue.main.async {
            self.actionFollow()
        }
      
    }
    
    @objc func btnFollowingActionType(sender: UIButton)
    {
        let btnTag = sender
        sender.layer.cornerRadius = 12.0
        sender.clipsToBounds = true
        sender.layer.borderWidth = 1.0
        sender.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        valueID = btnTag.tag
       
        DispatchQueue.main.async {
            self.actionFollow()
        }
    }
    
    @objc func btnNotifiedAction(sender: UIButton)
    {
        let btnTag = sender
        print(btnTag.tag)
        let notified : notifyVC = self.storyboard?.instantiateViewController(withIdentifier: "notifyVC") as! notifyVC
        
         // notified.strName =
         notified.notifyValue = self.notifyValue
        self.present(notified, animated: true, completion: nil)
    }
   
    @IBAction func buttonfollow(_ sender: UIButton)
    {
        btnFollow.layer.cornerRadius = 12.0
        btnFollow.clipsToBounds = true
        btnFollow.layer.borderWidth = 1.0
        btnFollow.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        DispatchQueue.main.async
        {
            self.FollwproductMarketmethod()
        }
    }
    @IBAction func butonrequested(_ sender: UIButton)
    {
        
    }
    func actionFollow()  {
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.EditprofiledescriptionViewall = Reviewfinaluseroid
        }
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlMarketShout)!)
        request.httpMethod = "POST"
        
        self.useridbiling =  self.strID
        
        
        let postString =  String(format: "method=%@&agentid=%@&followerid=%@","followagent","69948",self.useridbiling)
        
        print(postString)
        
        request.httpBody = postString.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                }
                break
            case .failure(_):
                print("anilreddy")
            }
        }
        
    }

    @objc func switchStateChanged(_ mjSwitch: MJMaterialSwitch)
    {
        if mjSwitch.tag == kSmallSwitch
        {
            print(mjSwitch.isOn, mjSwitch.tag, "Small")
        }
    }
    
    func scrollPager(scrollPager: ScrollPager, changedIndex: Int)
    {
        print("scrollPager index changed: \(changedIndex)")
        if scrollPager == scrollPager
        {
            if changedIndex == 0
            {
                CombofirstView.isHidden = false
                singelviewone.isHidden = false

            }
            if changedIndex == 1
            {
                CombosecondView.isHidden =  false
                singelviewtwo.isHidden = false
            }
            if changedIndex == 2
            {
                
                Combothiredview.isHidden =  false
                singelviewthree.isHidden = false
            }
            if changedIndex == 3
            {
                Combofourthview.isHidden =  false
                singelviewfour.isHidden = false
            }
            if changedIndex == 4
            {
                Combofourthview.isHidden =  false
                singelviewfour.isHidden = false
            }
        }
    }
  
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
  
    @IBAction func btnFollowingAction(_ sender: UIButton)
    {
        let btnValed = sender
        print(btnValed.tag)
       }
    @IBAction func btnNotifyAction(_ sender: UIButton)
    {
        let btnValed = sender
        print(btnValed.tag)
        let notified : notifyVC = self.storyboard?.instantiateViewController(withIdentifier: "notifyVC") as! notifyVC
        notified.notifyValue = self.notifyValue
        self.present(notified, animated: true, completion: nil)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        print(HomeScrollviewfinal.contentOffset.y)
         if scrollView == HomeScrollviewfinal
        {
            if   HomeScrollviewfinal.contentOffset.y >= 175
            {
               self.HomeScrollviewfinal.contentOffset.y = 175
               let value = selectbusinessname.text
                Editlabelfinalavalue.text = value
                 myimage.image =  imageone.image
                seconviewtotalvalue.isHidden = true
                myedittotalviefinal.isHidden = false
                Editlabelfinalavalue.isHidden = false
                myimage.isHidden = false
                mycamerabutton.isHidden = true
                Editbutton.isHidden = true
                myeditcamerabutton.isHidden = true
                myeditbutton.isHidden = true
                myEditnamelabel.isHidden = false
                myeditimageview.isHidden = false
                myedittotalviefinal.backgroundColor = UIColor.white
                myEditnamelabel.text = value
                myEditnamelabel.textColor = UIColor.black
                myeditimageview.image =  imageone.image
                
                myeditimageview.layer.borderWidth = 1
                myeditimageview.layer.masksToBounds = false
                myeditimageview.layer.borderColor = UIColor.gray.cgColor
                myeditimageview.layer.cornerRadius = myimage.frame.height/2
                myeditimageview.clipsToBounds = true
            }
            else
            {
                myedittotalviefinal.isHidden = true
                Editlabelfinalavalue.isHidden = true
                myimage.isHidden = true
                mycamerabutton.isHidden = false
                Editbutton.isHidden = false
                seconviewtotalvalue.isHidden = false
                myeditcamerabutton.isHidden = false
                myeditbutton.isHidden = false
                myEditnamelabel.isHidden = true
                myeditimageview.isHidden = true
                let value = selectbusinessname.text
                myEditnamelabel.text = value
                myeditimageview.image =  imageone.image
            }
        }
    }

    func editElementsValue()
    {
        segmentedControl = CustomSegmentedContrl.init(frame: CGRect.init(x: 0, y: self.HomeScrollviewfinal.frame.height - 325, width: self.HomeScrollviewfinal.frame.width, height: 45))
        //        segmentedControl
       segmentedControl.backgroundColor = .white
       segmentedControl.commaSeperatedButtonTitles = "Shouts,Comments,Likes,Saved"
       segmentedControl.addTarget(self, action: #selector(onChangeOfSegment(_:)), for: .valueChanged) 
       self.HomeScrollviewfinal.addSubview(segmentedControl)
    }
   
    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    @IBAction func Editbuttonfinalvalue(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let viewsingel =  self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
            self.present(viewsingel, animated: true, completion:nil)
            
        }
    }
    @IBAction func selectbusinesshours(_ sender: UIButton)
    {
        DispatchQueue.main.async
        {
            let BusinessTimeVCfinal =  self.storyboard?.instantiateViewController(withIdentifier:"BusinessTimeVC")as!BusinessTimeVC
            self.present(BusinessTimeVCfinal, animated: true, completion:nil)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        
        
        if Tickedstringfinal ==  "2" {
            
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
            {
                let image = info[UIImagePickerControllerOriginalImage] as! UIImage
                imageone.image = image
                if let asset = info["UIImagePickerControllerPHAsset"] as? PHAsset
                {
                    if let fileName = asset.value(forKey: "filename") as? String{
                
                    }
                }
                let resizeImage =  ValidateValues.ResizeImage(image: image, targetSize:CGSize(width:200,height:200))
                let imageData = UIImageJPEGRepresentation(resizeImage, 0.01)!
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
                let myString = formatter.string(from: Date())
                let yourDate = formatter.date(from: myString)
                formatter.dateFormat = "dd-MMM-yyyy hh:mm a"
                let photoDateAndTimeSTR = formatter.string(from: yourDate!)
                let agentImageUpload = "agentImageUpload"
                //            defaults.set(self.mobileNumber.text!, forKey: "Mymobilenumbervalue")
                let defaults = UserDefaults.standard
                let finalvalueis = defaults.value(forKey:"Mymobilenumbervalue")
                let params1 = ["method":agentImageUpload,"MobileNo":finalvalueis!,"filetype":"jpg","filecat":"OwnerSelfie","Longitude":self.longitude,"Latitude":self.lattitude,"address":self.address,"Timestamp":photoDateAndTimeSTR,"type_id":"112","id":"571"] as [String : Any]
                print(params1)
                let manager : AFHTTPSessionManager = AFHTTPSessionManager()
                manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
                manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
                let operation = manager.post(AgentConstants.baseUrltwo, parameters: params1, constructingBodyWith: { (formData: AFMultipartFormData!) -> Void in
                    formData.appendPart(withFileData: imageData, name: "Image", fileName: "ProofIDDocument.jpg", mimeType: "image/jpg")
                    
                }, success: { (operation, responseObject) -> Void in
                    
                    print(operation)
                    print(responseObject ?? "")
                    
                    let Result = responseObject as! NSDictionary
                    let StatusCode = Result.object(forKey: "StatusCode") as! Int
                    
                    print(Result)
                    print(StatusCode)
                    
                    if StatusCode == 1
                    {
                        let defaultssinglvalue = UserDefaults.standard
                        self.ImageTypestring = Result.value(forKey:"Image")as!String
                        self.FileTypestring = Result.value(forKey:"FileType")as!String
                        self.filecattypestring = Result.value(forKey:"FileCat")as!String
                        defaultssinglvalue.set(self.ImageTypestring, forKey:"Myimagetypestring")
                        defaultssinglvalue.set(self.FileTypestring, forKey:"MyFileTypestring")
                        defaultssinglvalue.set(self.filecattypestring, forKey:"MyFilecattypestring")
                        defaultssinglvalue.synchronize()
                        self.popupscrollview.isHidden = true
                        let bottomSheettwo = JXBottomSheetView(contentView:(self.popupscrollview)!)
                        bottomSheettwo.defaultMaxinumDisplayHeight  = 676
                        bottomSheettwo.defaultMininumDisplayHeight = 0
                        bottomSheettwo.frame = self.view.bounds
                        bottomSheettwo.displayState = .minDisplay
                        self.finalviewtwo.addSubview(bottomSheettwo)
                    }
                    else{
                        
                    }
                    
                }) { (operation, error) -> Void in
                    print(error)
                }
                
                
                
                if #available(iOS 11.0, *) {
                    if let imageURL = info[UIImagePickerControllerImageURL] as? URL {
                        print(imageURL)
                        
                        print(imageURL.typeIdentifier ?? "unknown UTI")  // this will print public.jpeg or another file UTI
                        let assetPath = info[UIImagePickerControllerReferenceURL] as! NSURL
                        print(assetPath)
                        if (imageURL.absoluteString.hasSuffix("JPG")) {
                            print("JPG")
                        }
                        if (imageURL.absoluteString.hasSuffix("jpeg")) {
                            print("jpeg")
                        }
                        else if (imageURL.absoluteString.hasSuffix("PNG"))
                        {
                            print("PNG")
                        }
                        else if (imageURL.absoluteString.hasSuffix("GIF"))
                        {
                            print("GIF")
                        }
                    }
                }
                
                picker.dismiss(animated: true, completion: nil)
                
                
            }
        }
        
        if Tickedstringfinal ==  "1"
        {
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                let deviceID = UIDevice.current.identifierForVendor!.uuidString
                print(deviceID)
                let imageName:String = deviceID + ".jpg"
                let documentsPath = NSHomeDirectory().appending("/Documents/Icon/")
                let imagePath = documentsPath.appending(imageName)
                let imageUrl = URL(fileURLWithPath: imagePath)
                print("imageUrl is here:\(imageUrl)")
                let image = info[UIImagePickerControllerOriginalImage] as! UIImage
                imageone.image = image
                let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
                let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
                let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
                if let dirPath          = paths.first
                {
                    print(dirPath)
                    let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("Image2.png")
                    print(imageURL)
                    let image    = UIImage(contentsOfFile: imageURL.path)
                    print(image)
                }
                if let asset = info["UIImagePickerControllerPHAsset"] as? PHAsset{
                    if let fileName = asset.value(forKey: "filename") as? String{
                     
                    }
                }
                let resizeImage =  ValidateValues.ResizeImage(image: image, targetSize:CGSize(width:200,height:200))
                let imageData = UIImageJPEGRepresentation(resizeImage, 0.01)!
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
                let myString = formatter.string(from: Date())
                let yourDate = formatter.date(from: myString)
                formatter.dateFormat = "dd-MMM-yyyy hh:mm a"
                let photoDateAndTimeSTR = formatter.string(from: yourDate!)
                let agentImageUpload = "agentImageUpload"
                let defaults = UserDefaults.standard
                let finalvalueis = defaults.value(forKey:"Mymobilenumbervalue")
                let params1 = ["method":agentImageUpload,"MobileNo":finalvalueis!,"filetype":"jpg","filecat":"OwnerSelfie","Longitude":self.longitude,"Latitude":self.lattitude,"address":self.address,"Timestamp":photoDateAndTimeSTR,"type_id":"123","id":"571"] as [String : Any]
                print(params1)
                let manager : AFHTTPSessionManager = AFHTTPSessionManager()
                manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
                manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
                let operation = manager.post(AgentConstants.baseUrltwo, parameters: params1, constructingBodyWith: { (formData: AFMultipartFormData!) -> Void in
                formData.appendPart(withFileData: imageData, name: "Image", fileName: "ProofIDDocument.jpg", mimeType: "image/jpg")
                    
                }, success: { (operation, responseObject) -> Void in
                    print(responseObject ?? "")
                    
                    let Result = responseObject as! NSDictionary
                    let StatusCode = Result.object(forKey: "StatusCode") as! Int
                    
                    print(Result)
                    print(StatusCode)
                    
                    if StatusCode == 1
                    {
                        let defaultssinglvalue = UserDefaults.standard
                        self.ImageTypestring = Result.value(forKey:"Image")as!String
                        self.FileTypestring = Result.value(forKey:"FileType")as!String
                        self.filecattypestring = Result.value(forKey:"FileCat")as!String
                        defaultssinglvalue.set(self.ImageTypestring, forKey:"Myimagetypestring")
                        defaultssinglvalue.set(self.FileTypestring, forKey:"MyFileTypestring")
                        defaultssinglvalue.set(self.filecattypestring, forKey:"MyFilecattypestring")
                        defaultssinglvalue.synchronize()
                        
                        self.popupscrollview.isHidden = true
                        let bottomSheettwo = JXBottomSheetView(contentView:(self.popupscrollview)!)
                        bottomSheettwo.defaultMaxinumDisplayHeight  = 676
                        bottomSheettwo.defaultMininumDisplayHeight = 0
                        bottomSheettwo.frame = self.view.bounds
                        bottomSheettwo.displayState = .minDisplay
                        self.finalviewtwo.addSubview(bottomSheettwo)
                    }
                    else
                    {
                    }
                }) { (operation, error) -> Void in
                    print(error)
                }
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated:  true, completion: nil)
        
    }
    @IBAction func `switch`(_ sender: UISwitch)
    {
        if (sender.isOn == true){
            print("UISwitch state is now ON")
        }
        else{
            print("UISwitch state is now Off")
        }
    }
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            print("Access is granted by user")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
                    print("success")
                }
            })
            print("It is not determined until now")
        case .restricted:
            // same same
            print("User do not have access to photo album.")
        case .denied:
            // same same
            print("User has denied the permission.")
        }
    }
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .camera
            myPickerController.allowsEditing = true
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    @IBAction func Camerabutton(_ sender: UIButton)
    {
     self.openCamera()
    }
    
    private func indexofviewController(viewCOntroller: UIViewController) -> Int {
        if(arrVC .contains(viewCOntroller)) {
            return arrVC.index(of: viewCOntroller)!
        }
        
        return -1
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
        pageController.setViewControllers([editShout], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
        self.addChildViewController(pageController)
        self.HomeScrollviewfinal.addSubview(pageController.view)
        pageController.didMove(toParentViewController: self)
    }
    // MARK: - Pagination Delegate Methods

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == mycameratabelview
        {
            return self.selectCameraproofstring.count

        }
        else
        {
            return self.shoutsValue.count

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == mycameratabelview
        {

            let cell  = mycameratabelview.dequeueReusableCell(withIdentifier: "ProofsTableViewCell", for: indexPath) as! ProofsTableViewCell
            cell.businesslabel.text = self.selectCameraproofstring[indexPath.row]
            if self.selectCameraproofstring.count-1 == indexPath.row {
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

            let cell : editShoutCell = tableList.dequeueReusableCell(withIdentifier: "editShoutCell") as! editShoutCell
            cell.lblProfile.text = (self.shtName[indexPath.row] as! String)
            cell.lblSenderTime.text = self.shtTime[indexPath.row] as? String
            cell.lblDistributor.text = self.shtSUB[indexPath.row] as? String
            
            let url = URL(string: (self.shtProfImg[indexPath.row] as? String)!)
            let data = try? Data(contentsOf: url!)
            
            if let imageData = data {
                let imageVal = UIImage(data: imageData)
                cell.imgProfile.image = imageVal
            }
            cell.lblProductName.text = self.shtNameProd[indexPath.row] as? String
            
            let urlType = URL(string: (self.shtProdIMG[indexPath.row] as? String)!)
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
            cell.lblMRPPrice.text = self.shtMRP[indexPath.row] as? String
            cell.lblStrikePrice.text = self.shtMOQV[indexPath.row] as? String
            cell.lblPercentMargin.text = self.shtMArgVAl[indexPath.row] as? String
            cell.lblDays.text = self.shtADDOff[indexPath.row] as? String
            cell.lblOutletBought.text = self.shtBroghBY[indexPath.row] as? String
            cell.lblSenderMsg.text = self.shtMSG[indexPath.row] as? String
            
            //        cell.viewProduct.layer.cornerRadius = 5.0
            //        cell.viewProduct.layer.borderWidth = 1.0
            //        cell.viewProduct.layer.borderColor = UIColor.lightGray.cgColor
            
            
            cell.lblCommentCount.text = self.shtComent[indexPath.row] as? String
            cell.lblShare.text = self.shtSAVed[indexPath.row] as? String
            cell.lblLikes.text = self.shtLike[indexPath.row] as? String
            cell.lblShoutCount.text = self.shtSHOTS[indexPath.row] as? String
            cell.lblSaveCount.text = self.shtSAVed[indexPath.row] as? String
            
            
            return cell
        }
   
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == mycameratabelview
        {
            profileselectedIndex = indexPath.row
            mycameratabelview.reloadData()
            if indexPath.row == 0
            {
                self.openCamera()
                Tickedstringfinal = "1"
            }
            if indexPath.row == 1
            {
                self.photoLibrary()
                self.checkPermission()
                Tickedstringfinal = "2"
            }
        }
        else
        {
            let shotData: shoutVC = self.storyboard?.instantiateViewController(withIdentifier: "shoutVC") as! shoutVC
            shotData.listArray = self.shoutsValue
            self.present(shotData, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == mycameratabelview
        {
            return 37
        }

        else
        {
            return 200
        }
    }
   
    func editShoutLike()
    {
        self.showSpinner()
        
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
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
    
        
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue =   Myagentidfinlavalue
        }
        
        let postStringfinlavalue =  String(format: "method=%@&agentid=%@&userid=%@&type=%@","getsamplemarketshouts",self.useridbiling,self.useridbiling,"shout")
        print(postStringfinlavalue)
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling, forHTTPHeaderField:"AgentID")
        request.httpBody = postStringfinlavalue.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                DispatchQueue.main.async {
                    self.removeSpinner()
                }
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    self.removeSpinner()
                    if let statValue = dict.value(forKey: "Status")as? String {
                        self.statusValue = statValue
                    }
                    
                    //                  if let followValue = dict.value(forKey: "followers") as? [Any] {
                    //                        self.followersValue = followValue
                    //                    }
                    //
                    //                    for i in 0 ..< self.followersValue.count {
                    //                        if let dictValue: NSDictionary = self.followersValue[i] as? NSDictionary{
                    //                            self.statusDict = (dictValue as? [String : Any])!
                    //                        }
                    //                        if let valuePend: Int = self.statusDict["pending"] as? Int {
                    //                            self.statusPend = valuePend
                    //                        }
                    //                        self.pendinglabel.text = String(self.statusPend)
                    //
                    //                        if let valueFollower: Int = self.statusDict["followers"] as? Int {
                    //                            self.statusFollowers = valueFollower
                    //                        }
                    //                        self.follwerslabel.text = String(self.statusFollowers)
                    //
                    //                        if let valueFollowing: Int = self.statusDict["following"] as? Int {
                    //                            self.statusFollowing = valueFollowing
                    //                        }
                    //                        self.followinglabel.text = String(self.statusFollowing)
                    //                        if let valueFollStatus : [Any] = self.statusDict["followstatus"] as? [Any] {
                    //                            self.valueArr = valueFollStatus
                    //                        }
                    //
                    //                        for  j in 0 ..< self.valueArr.count {
                    //                            if let dicValue: NSDictionary = self.valueArr[j] as? NSDictionary{
                    //                                self.stufDict = (dicValue as? [String : Any])!
                    //                            }
                    //                            if let valueStat : String = self.stufDict["status"] as? String {
                    //                                self.statValue = valueStat
                    //                            }
                    //                        }
                    //                    }
                    
                    
                    if let profileValue: [String: Any] = dict.value(forKey: "profileData") as? [String: Any] {
                        self.profileDataValue = profileValue
                    }
                    
                    if let verifyID : String = self.profileDataValue["IsVerify"] as? String {
                        self.isVerifyID = verifyID
                    }
                    
                    if let ratingID : Int = self.profileDataValue["rating"] as? Int {
                        self.isratingID = ratingID
                    }
                    self.satrlabel.text = String(self.isratingID)
                    
                    
                    if let mobileID : String = self.profileDataValue["MobileNo"] as? String
                    {
                        self.mobileNo = mobileID
                    }
                    self.phonenumberlabel.text = self.mobileNo
                    
                    if let establishName : String = self.profileDataValue["NameofEstablishment"] as? String
                    {
                        self.nameEstablish = establishName
                    }
                    self.selectbusinessowner.text = self.nameEstablish
                    
                    if let distName : String = self.profileDataValue["name"] as? String {
                        self.distributorName = distName
                    }
                    self.selectbusinessname.text = self.distributorName
                    
                    
                    if let valuePend: Int = self.profileDataValue["pending"] as? Int {
                        self.statusPend = valuePend
                    }
                    self.pendinglabel.text = String(self.statusPend)
                    
                    if let valueFollower: String = self.profileDataValue["followers"] as? String {
                        self.statusFollowers = valueFollower
                    }
                    self.follwerslabel.text = String(self.statusFollowers)
                    
                    if let valueFollowing: String = self.profileDataValue["following"] as? String {
                        self.statusFollowing = valueFollowing
                    }
                    self.followinglabel.text = self.statusFollowing
                    
                    //verifiedStatus
                    
                    if let verifyStatusID : String = self.profileDataValue["verifiedStatus"] as? String {
                        self.verifyStatus = verifyStatusID
                    }
                    self.Kycpendinglabel.text = self.verifyStatus
                    //agentprofileimage
                    if let profileimageID : String = self.profileDataValue["agentprofileimage"] as? String {
                        self.profileimageStatus = profileimageID
                    }
                    let url = URL(string: self.profileimageStatus)
                    
                    
                    self.imageone.sd_setImage(with: url) { (image, error, cache, urls) in
                        if (error != nil) {
                            self.imageone.image = #imageLiteral(resourceName: "default_img")
                        } else {
                            self.imageone.image = image
                        }
                    }
                    //today
                    if let dayStatus : String = self.profileDataValue["today"] as? String {
                        self.profileDayStatus = dayStatus
                    }
                    //status
                    if let prStatus : Int = self.profileDataValue["status"] as? Int {
                        self.profileStatus = prStatus
                    }
                    
                    //IdAgents
                    if let agentID : String = self.profileDataValue["IdAgents"] as? String {
                        self.agentValue = agentID
                    }
                    //BusinessHours
                    if let Businesshoursvalue: String = self.profileDataValue["BusinessHours"] as? String
                    {
                        self.Businesshours = Businesshoursvalue
                    }
                    var eventStr: NSAttributedString? = nil
                    
                    if let anEncoding = self.Businesshours.data(using: .utf8) {
                        eventStr = try? NSAttributedString(data: anEncoding, options: [.documentType: NSAttributedString.DocumentType.html.rawValue, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
                    }
                    
                    if self.Businesshours.count > 0
                    {
                        self.businesshourslabel.attributedText = eventStr
                    }
                    if self.Businesshours.count == 0
                    {
                        self.businesshourslabel.text = "Set business hours"
                    }
                    
                    if let validShout = dict.value(forKey: "shouts")as? [Any]
                    {
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
                    
                    DispatchQueue.main.async
                        {
                            self.removeSpinner()
                    }
                }
            case .failure(_):
                //                print("Error")
                DispatchQueue.main.async {
                    self.removeSpinner()
                    self.EditProfileviewtotal()
                    
                }
            }
        }
    }
    func profileinfo()
    {
        self.showSpinner()
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlEditShout)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "Mymobilenumbervalue")as?String
        {
            self.mobilenumber = Reviewfinaluseroid
        }
        
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
      
        
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue =   Myagentidfinlavalue
        }
        let postStringfinlavalue =  String(format: "method=%@&userid=%@&mobileno=%@","getAgentProfile",self.useridbiling,"shout",self.Myauthorisationstringfinalvalue,self.mobilenumber)
        print(postStringfinlavalue)
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling, forHTTPHeaderField:"AgentID")
        
        request.httpBody = postStringfinlavalue.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary
                
                {
                    if let Editnametotal:String = dict.value(forKey: "name") as? String {
                        
                        self.Editname = Editnametotal
                    }
                    
                    if let EditNameofEstablishmenttotal:String = dict.value(forKey: "NameofEstablishment") as? String {
                        
                        self.EditNameofEstablishment = EditNameofEstablishmenttotal
                    }
                    
                    if let EditMobileNototal:String = dict.value(forKey: "MobileNo") as? String {
                        
                        self.EditMobileNo = EditMobileNototal
                    }
                    
                    if let EditIdAgentstotal:String = dict.value(forKey: "IdAgents") as? String {
                        
                        self.EditIdAgents = EditIdAgentstotal
                    }
                    if let Editstatustotal:String = dict.value(forKey: "status") as? String {
                        
                        self.Editstatus = Editstatustotal
                    }
                    
                    if let EditKycapprovedtotal:String = dict.value(forKey: "verifiedStatus") as? String {
                        
                        self.EditKycapproved = EditKycapprovedtotal
                    }
                    if let EditEditBusineshourstotal:String = dict.value(forKey: "BusinessHours") as? String {
                        
                        self.EditBusineshours = EditEditBusineshourstotal
                    }
                    if let Editratingtotalvalue:String = dict.value(forKey: "rating") as? String {
                        
                        self.Editrating = Editratingtotalvalue
                    }
                    if let Editrating1totalvalue:NSNumber = dict.value(forKey: "rating") as? NSNumber {
                        
                        self.Editrating1 = Editrating1totalvalue
                    }
                    
                    if let EdiIsVerifytotalvalue:String = dict.value(forKey: "IsVerify") as? String {
                        
                        self.EdiIsVerify = EdiIsVerifytotalvalue
                    }
                    if let EdiIsverifiedStatustotalvalue:String = dict.value(forKey: "verifiedStatus") as? String {
                        
                        self.EdiIsverifiedStatus = EdiIsverifiedStatustotalvalue
                    }
                    if let EdiIsverifiedagentprofileimagetotalvalue:String = dict.value(forKey: "agentprofileimage") as? String {
                        
                        self.EdiIsverifiedagentprofileimage = EdiIsverifiedagentprofileimagetotalvalue
                    }

                    DispatchQueue.main.async {
                        self.editShoutLike()
                        
                    }
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.removeSpinner()
                    
                    
                }
            }
        }
    }
    
    
    func profileUploadimagefinalavalue()
    {
        let resizeImage =  ValidateValues.ResizeImage(image:imageone.image!, targetSize:CGSize(width:200,height:200))
        let imageData = UIImageJPEGRepresentation(resizeImage, 0.01)!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MMM-yyyy hh:mm a"
        let photoDateAndTimeSTR = formatter.string(from: yourDate!)
        let agentImageUpload = "agentImageUpload"
        //            defaults.set(self.mobileNumber.text!, forKey: "Mymobilenumbervalue")
        let defaults = UserDefaults.standard
        let finalvalueis = defaults.value(forKey:"Mymobilenumbervalue")
        let params1 = ["method":agentImageUpload,"MobileNo":finalvalueis!,"filetype":"jpg","filecat":"","Timestamp":photoDateAndTimeSTR] as [String : Any]
        print(params1)
        let manager : AFHTTPSessionManager = AFHTTPSessionManager()
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
        let operation = manager.post("http://172.31.0.23/NumberMall/agent_Gwy.php", parameters: params1, constructingBodyWith: { (formData: AFMultipartFormData!) -> Void in
            formData.appendPart(withFileData: imageData, name: "Image", fileName: "ProofIDDocument.jpg", mimeType: "image/jpg")
            
        }, success: { (operation, responseObject) -> Void in
            
            print(operation)
            print(responseObject ?? "")
            
            let Result = responseObject as! NSDictionary
            let StatusCode = Result.object(forKey: "StatusCode") as! Int
            
            print(Result)
            print(StatusCode)
            
            if StatusCode == 1
            {
                let defaultssinglvalue = UserDefaults.standard
                self.ImageTypestring = Result.value(forKey:"Image")as!String
                self.FileTypestring = Result.value(forKey:"FileType")as!String
                self.filecattypestring = Result.value(forKey:"FileCat")as!String
                defaultssinglvalue.set(self.ImageTypestring, forKey:"User_image")
                defaultssinglvalue.set(self.FileTypestring, forKey:"MyFileTypestring")
                defaultssinglvalue.set(self.filecattypestring, forKey:"MyFilecattypestring")
                defaultssinglvalue.synchronize()
               
            }
            
            
        }) { (operation, error) -> Void in
//            print(error)
        }
     
    }
    
    func showSpinner()
    {
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner()
    {
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
    
    func EditProfileviewtotal()
    {
        let defaultsingelvalue = UserDefaults.standard
        let Myagentidvalueis = defaultsingelvalue.value(forKey:"myuseridvaluefinal")as!String
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&agentid=%@","profileinformation",Myagentidvalueis)
        print(postString)
        
        
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
//                print(response.result)
                if let dictsingelvalue:NSDictionary = response.result.value as? NSDictionary
                {
                    DispatchQueue.main.async
                        {
                            self.removeSpinner()
                    }
                    self.businessDict = dictsingelvalue
                    self.dictfinalvalue = self.businessDict.value(forKey:"business")as!NSDictionary
                    self.businessname = self.dictfinalvalue.value(forKey:"name")as!String
                    self.Editdefaults.set(self.businessname, forKey:"Mybusinessname")
                    
                    self.businessemail_id = self.dictfinalvalue.value(forKey:"email_id")as!String
                    self.Editdefaults.set(self.businessemail_id, forKey:"Myemail_id")

                    
                    //                    self.Mobilevericationvalue = self.dictfinalvalue.value(forKey:"mobile_verification")         as!String
                    
                    if let Mobilevericationvalueplay:String = self.dictfinalvalue.value(forKey:"mobile_verification")  as? String {
                        
                        self.Mobilevericationvalue = Mobilevericationvalueplay
                        
                        self.Editdefaults.set(self.Mobilevericationvalue, forKey:"MyMobilevericationvalue")

                        
                        
                    self.Mobilevericationcolor = self.dictfinalvalue.value(forKey:"mobile_verification_color")         as!String
                        
                        self.Editdefaults.set(self.Mobilevericationcolor, forKey:"MyMobilevericationcolor")

                    let verifiedEmailnumberonecolor1 = self.hexStringToUIColor(hex:self.Mobilevericationcolor)
//                        self.verifiedEmailnumberone.setTitleColor(verifiedEmailnumberonecolor1, for:.normal)
//                        self.verifiedEmailnumberone.setTitle(self.Mobilevericationvalue, for:.normal)
                    }

                    self.businessnumber = self.dictfinalvalue.value(forKey:"number")as!String
                    
                    self.Editdefaults.set(self.businessnumber, forKey:"Mybusinessnumber")

                    self.businessgender = self.dictfinalvalue.value(forKey:"gender")as!String

                    self.businessdate_of_birth =  self.dictfinalvalue.value(forKey:"date_of_birth")as!String

                    self.businesspassword = self.dictfinalvalue.value(forKey:"password")as!String
                    let defaults = UserDefaults.standard
                    defaults.set(self.businessnumber, forKey:"Mybusinessnumber")
                    defaults.synchronize()
                    self.businesspan = self.dictfinalvalue.value(forKey:"pan")as!String
                    self.businessgst =  self.dictfinalvalue.value(forKey:"gst")as!String
                    
                    self.Editbusiness =  self.dictfinalvalue.value(forKey:"business_name")as!String

                    if let Newproductoutletsfinal:[String] = self.dictfinalvalue.value(forKey:"image")as?[String]
                    {
                        self.Busineesimagefinalvalue = Newproductoutletsfinal
                    }
                    self.businessImageDictfinalvalue = self.dictfinalvalue.value(forKey:"businessImage")as!NSDictionary
                    self.BusinesslicencecatageoryImage = self.businessImageDictfinalvalue.value(forKey:"Image")as!String
                    self.BusinesslicencecatageoryimageName = self.businessImageDictfinalvalue.value(forKey:"imageName")as!String
                    
                    self.Businesslicencecatageory = self.businessImageDictfinalvalue.value(forKey:"fileCategory")as!String
                    let defa  = UserDefaults.standard
                    defa.set( self.Businesslicencecatageory, forKey:"Mybusinesscataegory")
                    defa.synchronize()
                    
                    self.uploadauthone = self.businessImageDictfinalvalue.value(forKey:"status")as!String
                    self.uploadauthonecolor = self.businessImageDictfinalvalue.value(forKey:"status_color")as!String
                    
                    self.Editdefaults.set(self.uploadauthone, forKey:"Myuploadauthone")
                    self.Editdefaults.set(self.uploadauthone, forKey:"Mystatus_color")

                    
                    let verifieduploadauthonecolor = self.hexStringToUIColor(hex:  self.uploadauthonecolor)

                    self.Uploadauthorisiationdocueemnt = self.dictfinalvalue.value(forKey:"auth_document")as!NSDictionary
                    
                    self.authorisationcatageoryImage = self.Uploadauthorisiationdocueemnt.value(forKey:"Image")as!String
                    
                    self.authorisationcatageoryimageName = self.Uploadauthorisiationdocueemnt.value(forKey:"imageName")as!String
                    
                    
                    self.uploadauthtwo = self.Uploadauthorisiationdocueemnt.value(forKey:"status")as!String
                    self.Editdefaults.set(self.uploadauthtwo, forKey:"Myuploadauthtwo")

                    self.uploadauthtwocolor = self.Uploadauthorisiationdocueemnt.value(forKey:"status_color")as!String
                    self.Editdefaults.set(self.uploadauthtwocolor, forKey:"Myuploadauthtwocolor")

                    let uploadauthtwocolorcolor = self.hexStringToUIColor(hex:  self.uploadauthonecolor)
                    self.auhthDocuementcatageory = self.Uploadauthorisiationdocueemnt.value(forKey:"fileCategory")as!String
                    print(self.auhthDocuementcatageory)
                    self.uploadidproof = self.dictfinalvalue.value(forKey:"id_proof")as!NSDictionary
                    self.id_proofcatageoryImage = self.uploadidproof.value(forKey:"Image")as!String
                    self.id_proofimageName = self.uploadidproof.value(forKey:"imageName")as!String
                    
                    self.id_prooffilecatageory = self.uploadidproof.value(forKey:"fileCategory")as!String
                    
                    self.uploadauththree = self.uploadidproof.value(forKey:"status")as!String
                    self.uploadauththreecolor = self.uploadidproof.value(forKey:"status_color")as!String
                    self.Editdefaults.set(self.uploadauththree, forKey:"Myuploadauththree")
                    self.Editdefaults.set(self.uploadauththreecolor, forKey:"Myuploadauththreecolor")
                    let uploadauththreecolorfinalavlue = self.hexStringToUIColor(hex: self.uploadauththreecolor)

                    self.businessDictarray = self.businessImageDictfinalvalue.value(forKey:"options")as!NSArray
                    
                    
                    self.Editdefaults.set(self.businessDictarray, forKey:"MybusinessDictarray")

                    self.Uploadauthorisiationdocueemntarray = self.Uploadauthorisiationdocueemnt.value(forKey:"options")as!NSArray
                    
                    
                    self.uploadidproofarray = self.uploadidproof.value(forKey:"options")as!NSArray
                    
                    self.Editdefaults.set(self.uploadidproofarray, forKey:"Myuploadidproofarray")

                    
                    self.uploadtextbusinessnamelvalue = self.businessImageDictfinalvalue.value(forKey:"uploadText")as!String
                    
                    self.Editdefaults.set(self.uploadtextbusinessnamelvalue, forKey:"Myuploadtextbusinessnamelvalue")

                    
                    self.uploadtextauth_documentvalue = self.Uploadauthorisiationdocueemnt.value(forKey:"uploadText")as!String
                    
                    self.Editdefaults.set(self.uploadtextauth_documentvalue, forKey:"Myuploadtextauth_documentvalue")

                    self.uploadtextid_proofvalue = self.uploadidproof.value(forKey:"uploadText")as!String
                    
                    self.Editdefaults.set(self.uploadtextid_proofvalue, forKey:"Myuploadtextid_proofvalue")

                    self.othersstring = self.businessDict.value(forKey:"others")as!NSArray
                    
//                    self.Editdefaults.set(self.othersstring, forKey:"Myothersstring")

                    
                    self.Questionfinalvalue = self.othersstring.value(forKey:"question")as![String]
                    
                    self.Editdefaults.set(self.Questionfinalvalue, forKey:"MyQuestionfinalvalue")

                    self.Answervalue = self.othersstring.value(forKey:"answer")as![String]
                    
                    self.Editdefaults.set(self.Answervalue, forKey:"MyAnswervalue")

                    self.catgeroryfinalvalue = self.othersstring.value(forKey:"category")as![String]
                    
                    self.Editdefaults.set(self.catgeroryfinalvalue, forKey:"Mycatgeroryfinalvalue")

                    print(self.catgeroryfinalvalue)
                    if let buil:NSDictionary  = self.businessDict.value(forKey:"billingJSON")as? NSDictionary
                    {
                        
                        
                        
                        self.billingJSON = buil
                        self.billingJSONadresslocation =  self.billingJSON.value(forKey:"location")as!String
                           self.billingJSONasaveAsfinalvalue =  self.billingJSON.value(forKey:"saveAs")as!String
                        print(self.billingJSONadresslocation)
                        
                        self.Editdefaults.set(self.billingJSONadresslocation, forKey:"MybillingJSONadresslocation")
                        self.Editdefaults.set(self.billingJSONasaveAsfinalvalue, forKey:"MybillingJSONasaveAsfinalvalue")
                        
                    }
                    
                    if let deliverybuil:NSDictionary  = self.businessDict.value(forKey:"deliveryJson")as? NSDictionary
                    {
                        
                        
                        
                        self.businessDictsingel   = deliverybuil
                        
                        
                        if let deliverybuilsingel:NSDictionary  = self.businessDictsingel.value(forKey:"delAddress1")as? NSDictionary
                        {
                            self.Deliveryadressone = deliverybuilsingel
                            self.Deliveryadresslocation =  self.Deliveryadressone.value(forKey:"location")as!String
                            print(self.billingJSONadresslocation)
                            self.deliveryJSONasaveAsfinalvalue =  self.Deliveryadressone.value(forKey:"saveAs")as!String
                            
                            self.Editdefaults.set(self.Deliveryadresslocation, forKey:"MyDeliveryadresslocation")
                            self.Editdefaults.set(self.deliveryJSONasaveAsfinalvalue, forKey:"MydeliveryJSONasaveAsfinalvalue")

                           
                        }
                        
                        if let deliverybuiltwo:NSDictionary  = self.businessDictsingel.value(forKey:"delAddress2")as? NSDictionary
                        {
                            self.businessDicttwo = deliverybuiltwo
                            print(self.businessDicttwo)
                            self.Deliveryadresslocationtwo =  self.businessDicttwo.value(forKey:"location")as!String
                            
                            self.Editdefaults.set(self.Deliveryadresslocationtwo, forKey:"MyDeliveryadresslocationtwo")

                            
                            
                            if  self.Deliveryadresslocationtwo.count > 0
                            {
                                self.deliveryJSONasaveAsfinalvaluetwo =  self.businessDicttwo.value(forKey:"saveAs")as!String
                                print(self.Deliveryadresslocationtwo)
                                print(self.deliveryJSONasaveAsfinalvaluetwo)
                                
                self.Editdefaults.set(self.deliveryJSONasaveAsfinalvaluetwo, forKey:"MydeliveryJSONasaveAsfinalvaluetwo")

                               self.Editdefaults.synchronize()
                            }
                            else
                            {
                              
                            }
                        }
                        
                    }
                    
                    self.Editdefaults.synchronize()
                    self.Editdefaults.synchronize()

                    
                    
                    
                    DispatchQueue.main.async {
                       
                        
                        let stringtotalvalue = NSString(format:"%@%@","+91",self.businessnumber)
                      
                        //                        self.pannumbertextfiled.text =  self.businesspan
                        if self.businessgst.count > 0
                        {
                         
                        
                        if self.BusinesslicencecatageoryImage.count > 0
                        {
                            
                        }
                        
                        if self.authorisationcatageoryImage.count > 0
                        {
                            
                        }
                        
                        if self.id_proofcatageoryImage.count > 0
                        {
                          
                        }
                        
                        if  self.businessgender == "Male"
                        {
                        }
                        if  self.businessgender == "FeMale" ||  self.businessgender == "Female"
                        {

                        }
                    }
                }
                }
                break
            case .failure(_):
                DispatchQueue.main.async
                    {
                        self.removeSpinner()
                }
                break
            }
        }
}
    
    func hexStringToUIColor (hex:String) -> UIColor
    {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        DispatchQueue.main.async
            {
                if self.isboolPending == true
                {
                    self.Editpendingaccountvalue()
                }
        }
    }
    func Editpendingaccountvalue()
    {
        self.showSpinner()
    
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlEditShout)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
//        if let Reviewfinaluseroid:String = dafaults.value(forKey: "MyLoginfinalvalue")as?String
//        {
//            self.useridbiling = Reviewfinaluseroid
//        }
        
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
      
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue =   Myagentidfinlavalue
        }

        
        let postStringfinlavalue =  String(format: "method=%@&agentId=%@&userid=%@&type=%@","getsamplemarketshouts",self.myagentTotalvalue,self.strID,"shout")
        print(postStringfinlavalue)
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling, forHTTPHeaderField:"AgentID")
        request.httpBody = postStringfinlavalue.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                DispatchQueue.main.async {
                    self.removeSpinner()
                }
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    self.removeSpinner()
                    if let statValue = dict.value(forKey: "Status")as? String {
                        self.statusValue = statValue
                    }
                    
                    if let validShout = dict.value(forKey: "shouts")as? [Any]
                    {
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
                    
                    
                    if let followValue = dict.value(forKey: "followers") as? [Any] {
                        self.followersValue = followValue
                    }
                    
                    for i in 0 ..< self.followersValue.count {
                        if let dictValue: NSDictionary = self.followersValue[i] as? NSDictionary{
                            self.statusDict = (dictValue as? [String : Any])!
                        }
                        if let valuePend: Int = self.statusDict["pending"] as? Int {
                            self.statusPend = valuePend
                        }
                        self.pendinglabel.text = String(self.statusPend)
                        
                        if let valueFollower: String = self.statusDict["followers"] as? String
                        {
                            self.statusFollowers = valueFollower
                        }
                        self.follwerslabel.text = self.statusFollowers
                        
                        if let valueFollowing: String = self.statusDict["following"] as? String
                        {
                            self.statusFollowing = valueFollowing
                        }
                        self.followinglabel.text = self.statusFollowing
                        
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
                    
                    
                    if let profileValue: [String: Any] = dict.value(forKey: "profileData") as? [String: Any] {
                        self.profileDataValue = profileValue
                    }
                    if let verifyID : String = self.profileDataValue["IsVerify"] as? String {
                        self.isVerifyID = verifyID
                    }
                    
                    if let ratingID : Int = self.profileDataValue["rating"] as? Int {
                        self.isratingID = ratingID
                    }
                    self.satrlabel.text = String(self.isratingID)
                
                    if let verifyStatusID : String = self.profileDataValue["verifiedStatus"] as? String {
                        self.verifyStatus = verifyStatusID
                    }
                    self.Kycpendinglabel.text = self.verifyStatus
                    if let profileimageID : String = self.profileDataValue["agentprofileimage"] as? String {
                        self.profileimageStatus = profileimageID
                    }
                    let url = URL(string: self.profileimageStatus)
                    
                    
                    self.imageone.sd_setImage(with: url) { (image, error, cache, urls) in
                        if (error != nil) {
                            self.imageone.image = #imageLiteral(resourceName: "default_img")
                        } else {
                            self.imageone.image = image
                        }
                    }

                    if let dayStatus : String = self.profileDataValue["today"] as? String {
                        self.profileDayStatus = dayStatus
                    }
                    if let prStatus : Int = self.profileDataValue["status"] as? Int {
                        self.profileStatus = prStatus
                    }

                    if let agentID : String = self.profileDataValue["IdAgents"] as? String {
                        self.agentValue = agentID
                    }
                    
                    if let valueFollower: String = self.profileDataValue["followers"] as? String {
                        self.statusFollowers = valueFollower
                    }
                    self.follwerslabel.text = String(self.statusFollowers)
                    
                    if let valueFollowing: String = self.profileDataValue["following"] as? String {
                        self.statusFollowing = valueFollowing
                    }
                    self.followinglabel.text = self.statusFollowing

                    if let Businesshoursvalue: String = self.profileDataValue["BusinessHours"] as? String
                    {
                        self.Businesshours = Businesshoursvalue
                    }
                    var eventStr: NSAttributedString? = nil
                    
                    if let anEncoding = self.Businesshours.data(using: .utf8) {
                        eventStr = try? NSAttributedString(data: anEncoding, options: [.documentType: NSAttributedString.DocumentType.html.rawValue, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
                    }
                    
                    if self.Businesshours.count > 0
                    {
                        self.businesshourslabel.attributedText = eventStr
                        
                    }
                    if self.Businesshours.count == 0
                    {
                        self.businesshourslabel.text = "Set business hours"
                    }

                    if let mobileID : String = self.profileDataValue["MobileNo"] as? String
                    {
                        self.mobileNo = mobileID
                    }
                    self.phonenumberlabel.text = self.mobileNo
                    
                    if let establishName : String = self.profileDataValue["NameofEstablishment"] as? String
                    {
                        self.nameEstablish = establishName
                    }
                    self.selectbusinessowner.text = self.nameEstablish
                    
                    if let distName : String = self.profileDataValue["name"] as? String {
                        self.distributorName = distName
                    }
                    self.selectbusinessname.text = self.distributorName
                }
            case .failure(_):
                //                print("Error")
                DispatchQueue.main.async
                {
                 self.removeSpinner()
                }
            }
        }
    }
    
    func FollwproductMarketmethod()
    {
        var request = URLRequest(url: URL(string:AgentConstants.MarketFinalvalue)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.useridbiling1 = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "myproductidvalue")as?String
        {
            self.productdescriptionuseridbiling = Reviewfinaluseroid
        }
        
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        folloowpostString =  String(format: "method=%@&agentid=%@&followerid=%@","followagent",self.useridbiling1,self.strID)
        print(folloowpostString)
        request.httpBody = folloowpostString.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling1, forHTTPHeaderField:"AgentID")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print("sucessvalue")
                
                print(response.result)
                let value = response.response
                
                let valuetwo = response.data
                
                if let response = response as? HTTPURLResponse
                {
                    if response.statusCode == 200 {
                    }
                }
                if let httpResponse1 = value
                {
                    if let xDemAuth = httpResponse1.allHeaderFields["Authorization"] as? String {
                        
                        let defaults = UserDefaults.standard
                        defaults.set(xDemAuth, forKey:"Myauthorisation")
                        defaults.synchronize()
                    }
                }
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                }
                break
            case .failure(_):
                print("Demofollovalue")
                DispatchQueue.main.async {
                }
                break
            }
        }
    }

    @IBAction func myclosebutton(_ sender: UIButton)
    {
        self.popupscrollview.isHidden = true
        let bottomSheettwo = JXBottomSheetView(contentView:(popupscrollview)!)
        bottomSheettwo.defaultMaxinumDisplayHeight  = 630
        bottomSheettwo.defaultMininumDisplayHeight = 0
        bottomSheettwo.displayState = .minDisplay
        bottomSheettwo.frame = self.view.bounds
        self.view.addSubview(bottomSheettwo)
    }
   
    @IBAction func Myeditcamerabuttontotal(_ sender: UIButton)
    {
        self.popupscrollview.isHidden = false
        let bottomSheettwo = JXBottomSheetView(contentView:(popupscrollview)!)
        bottomSheettwo.defaultMaxinumDisplayHeight  = 676
        bottomSheettwo.defaultMininumDisplayHeight = 0
        bottomSheettwo.displayState = .maxDisplay
        bottomSheettwo.frame = self.view.bounds
        self.finalviewtwo.addSubview(bottomSheettwo)
    }
    
    @IBAction func Myeditcamerabuttontotalvalue(_ sender: UIButton)
    {
        self.popupscrollview.isHidden = false
        let bottomSheettwo = JXBottomSheetView(contentView:(popupscrollview)!)
        bottomSheettwo.defaultMaxinumDisplayHeight  = 676
        bottomSheettwo.defaultMininumDisplayHeight = 0
        bottomSheettwo.frame = self.view.bounds
        bottomSheettwo.displayState = .maxDisplay
       self.finalviewtwo.addSubview(bottomSheettwo)
    }

    func photoLibrary()
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    func getFileName(info: [String : Any]) -> String
    {
        if let imageURL = info[UIImagePickerControllerReferenceURL] as? URL {
            let result = PHAsset.fetchAssets(withALAssetURLs: [imageURL], options: nil)
            let asset = result.firstObject
            let fileName = asset?.value(forKey: "filename")
            let fileUrl = URL(string: fileName as! String)
            if let name = fileUrl?.deletingPathExtension().lastPathComponent {
                print(name)
                return name
            }
        }
        return ""
    }
}
extension EditprofileViewController: UIGestureRecognizerDelegate
{
public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true
    }
}
