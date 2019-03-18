//
//  orderComplaintCaseVC.swift
//  AgentRestocks
//
//  Created by apple on 12/26/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class orderComplaintCaseVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var imgColor: UIImageView!
    
    @IBOutlet weak var lblOrderNO: UILabel!
    
    @IBOutlet weak var lblOrderActive: UILabel!
    
    @IBOutlet weak var viewGalery: UIView!
    @IBOutlet weak var tableList: UITableView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var txtFieldMsg: UITextField!
    
    @IBOutlet weak var btnSendMsg: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //txtFieldMsg.text = "Anil Kumar reddy"
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.txtFieldMsg.frame.height))
        txtFieldMsg.leftView = paddingView
        txtFieldMsg.leftViewMode = .always
        
    }
    

  
    @IBAction func btnBackPopAction(_ sender: UIButton) {
    
    
    }
    

    @IBAction func btnCallAction(_ sender: UIButton) {
   
    
    
    }
    
    @IBAction func btnMenuAction(_ sender: UIButton) {
   
      let btn = sender
        
        if btn.isSelected {
            hiddenView.isHidden = true
            btn.isSelected = false
        }else{
            hiddenView.isHidden = false
            btn.isSelected = true
        }
    
    
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ordCompCell = tableList.dequeueReusableCell(withIdentifier: "ordCompCell") as! ordCompCell
        
        return cell
    }

    @IBAction func btnCloseActiomn(_ sender: UIButton) {
    
        let btn = sender
        
            lblOrderActive.text = "Closed"
    
        if lblOrderActive.text == "Closed" {
            btn.setTitle("ReOpen", for: .normal)
            btn.addTarget(self, action: #selector(btnOrderOpen), for: .touchUpInside)
        }
        
        hiddenView.isHidden = true
    }
    
    @objc func btnOrderOpen(sender: UIButton) {
        let btn = sender
        lblOrderActive.text = "Open"

        if lblOrderActive.text == "Open"{
            btn.setTitle("Close", for: .normal)
            btn.addTarget(self, action: #selector(btnCloseActiomn), for: .touchUpInside)
        }
        hiddenView.isHidden = true
    }
    
    @IBAction func btnVGaleryAction(_ sender: Any) {
    
    
    
    }
    
    
    @IBAction func btnEmojiAction(_ sender: Any) {
   
    
    
    }
    
    
    @IBAction func btnCameraAction(_ sender: Any) {
  
    
    
    }
    
    @IBAction func btnFolderAction(_ sender: Any) {
  
    
    
    }
    
    @IBAction func btnSendMsgrAction(_ sender: Any) {
    
    
    }
    
}
