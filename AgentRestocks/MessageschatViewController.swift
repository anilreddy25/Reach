//
//  MessageschatViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import SocketIO
import Kingfisher
import SDWebImage
import AlamofireImage


class MessageschatViewController: UIViewController
{
    @IBOutlet weak var topview: UIView!

    var chatingimagevalue = String()
    var Productypeicon = String()
    var ProductypeMessage = String()
    var Tickmarkiamge = UIImage()
    var ProductTiming = String()
    var ProductMessages = String()
    var chatimage = UIImage()
    
    
    @IBOutlet weak var messagetopview: UIView!
    
    @IBOutlet weak var popcornname: UILabel!
    @IBOutlet weak var popcornimage: UIImageView!

    var MessagesocketDict = [Any]()

    
    let managerfinal = SocketManager(socketURL: URL(string: "http://172.31.0.13:3000")!, config: [.log(true), .compress])
    
    
    var socketthree:SocketIOClient!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        messagetopview.layer.shadowOffset = CGSize(width: 0, height: 3)
        messagetopview.layer.shadowOpacity = 0.6
        messagetopview.layer.shadowRadius = 3.0
        messagetopview.layer.shadowColor = UIColor.color2().cgColor
        self.popcornimage.layer.cornerRadius = self.popcornimage.layer.frame.size.width/2
        self.popcornimage.layer.masksToBounds = true
        self.popcornname.text = Productypeicon
         self.popcornimage.image = chatimage
        self.bottomview.layer.cornerRadius = 18.0
        self.popcornimage.layer.borderWidth  = 0.5
        self.popcornimage.layer.borderColor = UIColor.lightGray.cgColor
        DispatchQueue.main.async {
            self.Meessagechatfinalavleu()
        }
    }
  
    @IBAction func sahrebutton(_ sender: UIButton) {
    }
    @IBOutlet weak var bottomview: UIView!
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    @IBAction func MyBackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    @IBAction func emojee(_ sender: UIButton)
    {
        
    }
    @IBAction func share(_ sender: UIButton)
    {
        
    }
    @IBAction func Camerabutton(_ sender: UIButton)
    {
        
    }
    func Meessagechatfinalavleu()
    {
         self.socketthree = managerfinal.defaultSocket
        self.socketthree.connect()
        
                self.socketthree.on("new_chat_res")
                {data, ack in
                 
                    print(data)
                    
                    self.MessagesocketDict = data as! [Any]
                    print(self.MessagesocketDict)
                    
                }
            }
 
}
