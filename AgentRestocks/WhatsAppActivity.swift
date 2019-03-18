//
//  WhatsAppActivity.swift
//  AgentRestocks
//
//  Created by Azharuddin on 26/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class WhatsAppActivity: UIActivity {
    override init() {
        self.text = ""
    }
    var text:String?

    func activityType()-> String
    {
        return NSStringFromClass(self.classForCoder)
    }
     func activityImage()-> UIImage
    {
        return UIImage(named: "whatsapp2")!;
    }
     func activityTitle() -> String
    {
        return "WhatsApp";
    }
     class func activityCategory() -> UIActivityCategory{
        return UIActivityCategory.share
    }
    
    func getURLFromMessage(message:String)-> NSURL
    {
        var url = "whatsapp://"
        
        if (message != "")
        {
            url = "\(url)send?text=\(message)"
        }
        
        return NSURL(string: url)!
    }
    
     func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        for activityItem in activityItems
        {
           
                self.text = activityItem as? String;
                var whatsAppURL:NSURL  = self.getURLFromMessage(message: self.text!)
                return UIApplication.shared.canOpenURL(whatsAppURL as URL)
            
        }
        return false;
    }
    
     func prepareWithActivityItems(activityItems: [AnyObject])
     {
        for activityItem in activityItems{
           
                var whatsAppUrl:NSURL = self.getURLFromMessage(message: self.text!)
                if(UIApplication.shared.canOpenURL(whatsAppUrl as URL)){
                    UIApplication.shared.openURL(whatsAppUrl as URL as URL)
                }
                break;
        }
    }
}

