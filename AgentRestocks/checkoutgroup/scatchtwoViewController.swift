//
//  scatchtwoViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 19/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import ScratchCard

class scatchtwoViewController: UIViewController,ScratchUIViewDelegate {

    var scratchCard: ScratchUIView!
    
    @IBOutlet weak var viewtwo: UIView!
    @IBOutlet weak var youownlabel: UILabel!
    @IBOutlet weak var scratchcardviewfinal: UIView!
    
    let defaults = UserDefaults.standard
    
    
    var timer = Timer()
    
    @IBOutlet weak var demoscatch: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scratchCard  = ScratchUIView(frame: CGRect(x:0, y:0, width:250
            , height:250),Coupon: "iamgeonetwo.png", MaskImage: "maskone.png", ScratchWidth: CGFloat(40))
        scratchCard.addSubview(viewtwo)
        scratchCard.delegate = self
        self.scratchcardviewfinal.addSubview(scratchCard)
        self.scratchcardviewfinal.layer.cornerRadius = 20.0
        self.scratchCard.layer.cornerRadius = 20.0
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getScratchPercent(_ sender: Any) {
        self.viewtwo.isHidden = false
        
    }
    
//    //Scratch Began Event(optional)
//    func scratchBegan(_ view: ScratchUIView) {
//        //        scratchCard  = ScratchUIView(frame: CGRect(x:0, y:0, width:250
//        //            , height:250),Coupon: "iamgeonetwo.png", MaskImage: "maskone.png", ScratchWidth: CGFloat(40))
//        //        scratchCard.addSubview(viewtwo)
//        //        scratchCard.delegate = self
//        //        self.scratchcardviewfinal.addSubview(scratchCard)
//        //        self.scratchcardviewfinal.layer.cornerRadius = 20.0
//        //        self.scratchCard.layer.cornerRadius = 20.0
//
//    }
//
//
//
//
//    //Scratch Moved Event(optional)
//    func scratchMoved(_ view: ScratchUIView) {
//        let scratchPercent: Double = self.scratchCard.getScratchPercent()
//        //        self.textField.text = String(format: "%.2f", scratchPercent * 100) + "%"
//        //        print("scratchMoved")
//
//        print(self.scratchCard.getScratchPercent())
//
//        let value = String(format: "%f", scratchPercent * 100) + "%"
//        print(scratchPercent)
//        print(value)
//
//        if value > "100"
//        {
//            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
//            self.scratchcardviewfinal.layer.cornerRadius = 20.0
//            self.scratchCard.layer.cornerRadius = 20.0
//        }
//        else{
//
//        }
//    }
//    @objc func timerAction()
//    {
//        scratchCard  = ScratchUIView(frame: CGRect(x:0, y:0, width:255, height:255),Coupon: "iamgeonetwo.png", MaskImage: "iamgeonetwo.png", ScratchWidth: CGFloat(40))
//        scratchCard.addSubview(viewtwo)
//        scratchCard.delegate = self
//        self.scratchcardviewfinal.addSubview(scratchCard)
//        self.viewtwo.isHidden = false
//        defaults.setValue("firstscartch", forKey: "Myfirstscracth")
//        defaults.synchronize()
//
//    }
//
//
//    func scratchEnded(_ view: ScratchUIView) {
//        self.viewtwo.isHidden = false
//
//        //        let position = Int(view.scratchPosition.x).description + "," + Int(view.scratchPosition.y).description
//        //        print(position)
//        //
//    }
    @IBAction func close(_ sender: UIButton)
    {
        ////        self.demoscatch.isHidden = true
        self.view.removeFromSuperview()
        //        let ViewController = WalletViewController()
        //
        //        ViewController.willMove(toParentViewController: nil)
        //        ViewController.view.removeFromSuperview()
        //        ViewController.removeFromParentViewController()
        
    }
    
    
    
    /// NEw code
    
    func scratchBegan(_ view: ScratchUIView)
    {
        print("scratchBegan")
       Int(view.scratchPosition.x).description + "," + Int(view.scratchPosition.y).description
    }
    
    func scratchMoved(_ view: ScratchUIView)
    {
        let scratchPercent: Double = scratchCard.getScratchPercent()
        let position = Int(view.scratchPosition.x).description + "," + Int(view.scratchPosition.y).description
        print(position)
    }
    
    func scratchEnded(_ view: ScratchUIView)
    {
        print("scratchEnded")
        let position = Int(view.scratchPosition.x).description + "," + Int(view.scratchPosition.y).description
        print(position)
        
    }
    
    
}
