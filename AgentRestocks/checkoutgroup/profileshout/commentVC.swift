//
//  commentVC.swift
//  AgentRestocks
//
//  Created by apple on 12/26/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class commentVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var lblComment: UILabel!
    
    @IBOutlet weak var tableList: UITableView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var txtEnterComment: UITextField!
    
    @IBOutlet weak var btnUPandDown: UIButton!
    
    @IBOutlet weak var btnGallery: UIButton!
    
    @IBOutlet weak var btnShout: UIButton!
    
    @IBOutlet weak var lblNoofWords: UILabel!
    
    var Myauthorisationstringfinalvalue = String()
    var myagentTotalvalue = String()
    var EditprofiledescriptionViewall = String()
    
    var listArray =  [Any]()
    var listDict =  [String: Any]()
    
    var broughtPeople = String()
    var senderMessage = String()
    var comboText = String()
    var productName = String()
    var offPrice = Int()
    var priceValue = Int()
    var saveAmnt = String()
    var timerValue = String()
    var comboArray = [Any]()
    var shoutDict = [String: Any]()
    var marginValue = String()
    var mrpPrice = Int()
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        btnUPandDown.addTarget(self, action: #selector(btnUPandDownAction), for: .touchUpInside)
        btnGallery.addTarget(self, action: #selector(btnGalleryAction), for: .touchUpInside)
        btnShout.addTarget(self, action: #selector(btnShoutViewAction), for: .touchUpInside)
        bottomView.isUserInteractionEnabled = true

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: commentCell = tableList.dequeueReusableCell(withIdentifier: "commentCell")as! commentCell
        cell.txtViewData.layer.borderColor = UIColor.gray.cgColor
        cell.txtViewData.layer.borderWidth = 1.0
        cell.txtViewData.layer.cornerRadius = 5.0
        cell.viewButton.layer.borderColor = UIColor.gray.cgColor
        cell.viewButton.layer.borderWidth = 1.0
        cell.btnShout.addTarget(self, action: #selector(btnShoutAction), for: .touchUpInside)
        cell.btnLike.addTarget(self, action: #selector(btnLikeAction), for: .touchUpInside)
        cell.btnSave.addTarget(self, action: #selector(btnSaveAction), for: .touchUpInside)
        cell.btnShare.addTarget(self, action: #selector(btnShareAction), for: .touchUpInside)
        cell.btnComment.addTarget(self, action: #selector(btnCommentAction), for: .touchUpInside)
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    @objc func btnShoutAction(sender: UIButton) {
        print("shout")
    }
    @objc func btnLikeAction(sender: UIButton) {
        print("Like")
    }
    @objc func btnSaveAction(sender: UIButton) {
        print("Save")
    }
    @objc func btnShareAction(sender: UIButton) {
        print("Share")
    }
    @objc func btnCommentAction(sender: UIButton) {
        print("Comment")
    }
    @objc func btnUPandDownAction(sender: UIButton) {
        print("UpandDown")
    }
    @objc func btnGalleryAction(sender: UIButton) {
        print("Gallery")
    }
    
    @objc func btnShoutViewAction(sender: UIButton) {
        print("ShoutUp")
    }
    
    @IBAction func btnBackPopAction(_ sender: Any) {
  
    self.dismiss(animated: true, completion: nil)
    
    }
    
}
