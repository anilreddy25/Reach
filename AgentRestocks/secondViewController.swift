//
//  secondViewController.swift
//  ecom
//
//  Created by Azharuddin on 20/09/18.
//  Copyright © 2018 Antza Technologies. All rights reserved.
//

import UIKit
import Foundation
import MessageUI
import Social

class secondViewController: UIViewController,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate{
    @IBOutlet weak var singel: UILabel!
    
    @IBOutlet weak var two: UILabel!
    
    @IBOutlet weak var three: UILabel!
    
    @IBOutlet weak var demoview: UIView!
    var viewonefinal = String()
    var viewtwo = String()
    var viewthree = String()

    @IBOutlet weak var backview: UIView!
    
    @IBOutlet weak var Back: UIButton!

    @IBOutlet weak var sharevialabel: UIView!
    
    @IBOutlet weak var shareactionslabel: UIView!
    
    @IBOutlet weak var cancelbutton: UIButton!
    
    @IBOutlet weak var Totalshareviewfinal: UIView!
    
    @IBOutlet weak var shareviewtotal: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        singel.text = viewonefinal
//        two.text = viewtwo
//        three.text = viewthree
        
        self.sharevialabel.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
        self.Totalshareviewfinal.roundedButton()
        
          self.shareviewtotal.layer.cornerRadius = 8.0
        self.shareviewtotal.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func Dismissbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    
    @IBAction func fourthbutton(_ sender: UIButton) {
 let msg1 = "Hey,NumberMall App is the best app for all companies direct supplies at lowest prices with great margins, its fast and simple app that I use for all my restocking needs for my business. I strongly recommend for your business. Get it for free at https://play.google.com/store/apps/details?id=com.pop.numbermall"
        shareByWhatsapp(msg: msg1)
     
    }
    func shareByWhatsapp(msg:String){
        
       
        let urlWhats = "whatsapp://send?text=\(msg)"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let whatsappURL = NSURL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                    UIApplication.shared.openURL(whatsappURL as URL)
                } else {
                    
                    let alert = UIAlertController(title: NSLocalizedString("Whatsapp not found", comment: "Error message"),
                                                  message: NSLocalizedString("Could not found a installed app 'Whatsapp' to proceed with sharing.", comment: "Error description"),
                                                  preferredStyle: UIAlertControllerStyle.alert)
                    
                    alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Alert button"), style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
                    }))
                    
                    self.present(alert, animated: true, completion:nil)
                    // Cannot open whatsapp
                }
            }
        }
    }


    @IBAction func sahremessage(_ sender: UIButton)
    {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["someone@somewhere.com"])
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        mailComposerVC.setMessageBody("Hey,NumberMall App is the best app for all companies direct supplies at lowest prices with great margins, its fast and simple app that I use for all my restocking needs for my business. I strongly recommend for your business. Get it for free at https://play.google.com/store/apps/details?id=com.pop.numbermall", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Messager(_ sender: UIButton)
    {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "Hey,NumberMall App is the best app for all companies direct supplies at lowest prices with great margins, its fast and simple app that I use for all my restocking needs for my business. I strongly recommend for your business. Get it for free at https://play.google.com/store/apps/details?id=com.pop.numbermall"
            controller.recipients = [""]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func facebook(_ sender: UIButton)
    {
    
            
            if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
                vc.setInitialText("Hey,NumberMall App is the best app for all companies direct supplies at lowest prices with great margins, its fast and simple app that I use for all my restocking needs for my business. I strongly recommend for your business. Get it for free at https://play.google.com/store/apps/details?id=com.pop.numbermall")
//            vc.add(UIImage(named: "myImage.jpg")!)
//            vc.add(URL(string: "https://www.hackingwithswift.com"))
            present(vc, animated: true)
        }
    }
    @IBAction func Twitter(_ sender: UIButton)
    {
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
            vc.setInitialText("Hey,NumberMall App is the best app for all companies direct supplies at lowest prices with great margins, its fast and simple app that I use for all my restocking needs for my business. I strongly recommend for your business. Get it for free at https://play.google.com/store/apps/details?id=com.pop.numbermall")
            //            vc.add(UIImage(named: "myImage.jpg")!)
            //            vc.add(URL(string: "https://www.hackingwithswift.com"))
            present(vc, animated: true)
    }
        
    }
    @IBAction func instgram(_ sender: UIButton)
    {
        let vc = SLComposeViewController()
        
        if (( SLComposeViewController(forServiceType: SLServiceTypeTwitter)) != nil)
        {
            vc.setInitialText("Hey,NumberMall App is the best app for all companies direct supplies at lowest prices with great margins, its fast and simple app that I use for all my restocking needs for my business. I strongly recommend for your business. Get it for free at https://play.google.com/store/apps/details?id=com.pop.numbermall")
            //            vc.add(UIImage(named: "myImage.jpg")!)
            //            vc.add(URL(string: "https://www.hackingwithswift.com"))
            present(vc, animated: true)
    }
    
}
    
    @IBAction func Mycancelbutton(_ sender: UIButton)
    {
//        self.dismiss(animated:true, completion:nil)
        self.view.removeFromSuperview()
    }

}
