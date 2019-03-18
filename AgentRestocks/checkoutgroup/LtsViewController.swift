//
//  LtsViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 24/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class LtsViewController: UIViewController,UIPopoverPresentationControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate
{
    @IBOutlet weak var myListtotal: UIImageView!
    @IBOutlet weak var MyListbutton: UIButton!
    @IBOutlet weak var fifthorderplaced: UILabel!
    @IBOutlet weak var achivedlabel: UILabel!
    @IBOutlet weak var singeloderlabel: UILabel!
    @IBOutlet weak var secondorderlabel: UILabel!
    @IBOutlet weak var targetlabel: UILabel!
    @IBOutlet weak var singeltagrget: UILabel!
    @IBOutlet weak var secondtarget: UILabel!
    @IBOutlet weak var januarylabel: UILabel!
    @IBOutlet weak var twofiftylabel: UILabel!
    @IBOutlet weak var popoverviewfinal: UIView!
    var modelData = [String]()
    let customWidth:CGFloat = 100
    let customHeight:CGFloat = 100
    @IBOutlet var pickerView: UIPickerView!
    var rotationAngle:CGFloat!
    var di_count = 0
    
    
    @IBOutlet weak var Listbottomview: UIView!
    
    @IBOutlet weak var mypcikerbackbutton: UIButton!
    
    @IBOutlet weak var Maximumpickervi: UIView!
    @IBOutlet weak var tetxfiledview: UIView!
    @IBOutlet weak var singllinetextfiled: UITextField!
    
     var index = Int()
    var Pickerstring = String()

    @IBOutlet weak var scrollviewfinal: UIScrollView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self

        popoverviewfinal.layer.cornerRadius = 5.0
        popoverviewfinal.layer.borderWidth = 1.0
        popoverviewfinal.layer.borderColor = UIColor.popovercolorfinlavalue().cgColor
        
        rotationAngle = -90 * (.pi/180)
        let originalFrame = pickerView.frame
        pickerView.transform =  CGAffineTransform(rotationAngle: rotationAngle)
        pickerView.frame = originalFrame
        modelData = ["0","1","2","3","4","5","6","7","8","9","10"]
        
        singllinetextfiled.delegate = self
        singllinetextfiled.addTarget(self, action: #selector(comboViewController.textFieldDidChange(_:)), for: .editingChanged)
        singllinetextfiled.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        singllinetextfiled.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        singllinetextfiled.layer.borderWidth = 2.0
        self.index = 0
        
       self.Listbottomview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
        
        if self.view.frame.size.height < 800 {
            scrollviewfinal.contentInset = UIEdgeInsetsMake(0,0,1100,0)
            scrollviewfinal.isScrollEnabled = true
            scrollviewfinal.showsVerticalScrollIndicator = false
        }
        
        
        
        
   
    }
    @objc func doneButtonClicked(_ sender: Any)
    {
        singllinetextfiled.resignFirstResponder()
        
    }
    @IBAction func MyListbutton(_ sender: UIButton)
    {
//        let PopoverViewone = PopoverViewController()
//        PopoverViewone.modalPresentationStyle = UIModalPresentationStyle.popover
//        PopoverViewone.preferredContentSize = CGSize(width: 400, height: 400)
//
//        present(PopoverViewone, animated: true, completion: nil)
//
//        let popoverPresentationController = PopoverViewone.popoverPresentationController
//        popoverPresentationController?.sourceView = sender
//        popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: sender.frame.size.width, height: sender.frame.size.height)
        
//        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//       let vc = storyboard.instantiateViewController(withIdentifier:"PopoverViewController")
//        vc.modalPresentationStyle = .popover
//        let popover = vc.popoverPresentationController!
//        popover.delegate = self as? UIPopoverPresentationControllerDelegate
//        popover.permittedArrowDirections = .down
//        popover.sourceView = sender as? UIView
//        popover.sourceRect = sender.bounds
        
    }
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle
    {
        return .none
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelData.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        //        let topLabel = UILabel(frame: CGRect(x: 0, y: 10, width: customWidth, height: 20))
        //        topLabel.text = modelData[row]
        //        topLabel.textColor = .black
        //        topLabel.textAlignment = .center
        //        topLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.thin)
        //        view.addSubview(topLabel)
        let middleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        middleLabel.text = modelData[row]
        middleLabel.textColor = UIColor.red
        middleLabel.textAlignment = .center
        middleLabel.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.thin)
        view.addSubview(middleLabel)
        if  di_count == row {
            middleLabel.textColor = UIColor.red
        }
        else{
            middleLabel.textColor = UIColor.gray
        }
        
        
        
        view.transform =  CGAffineTransform(rotationAngle: 90 * (.pi/180))
        
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        pickerView.selectRow(row, inComponent:0, animated: true)
        return modelData[row] as String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        let finalstring = modelData[row]
        if finalstring == "10"
        {
            tetxfiledview.isHidden = false
            Maximumpickervi.isHidden = true
        }
       
        
        di_count = row
        pickerView.reloadAllComponents()
        
    }
    
    
    @IBAction func addtocartbututonLts(_ sender: UIButton)
    {
        self.view.removeFromSuperview()
    }
    
    
    @IBAction func Mypickerbutton(_ sender: UIButton)
    {
        if self.Pickerstring == ""
        {
            self.Pickerstring = "0"
        }
        else
        {
        }
        self.index = Int(self.Pickerstring)!+1
        
        print(self.index)
        print(self.Pickerstring)
        
        if self.index < 10
        {
            let myString = String(self.index)
            self.Pickerstring = myString
            pickerView.selectRow(self.index, inComponent:0, animated: true)
//            self.typeoderlabel.text =  self.Pickerstring
            pickerView.reloadAllComponents()
            self.Maximumpickervi.isHidden = false
            self.tetxfiledview.isHidden = true
        }
        else
        {
            let myString = String(self.index)
            self.Pickerstring = myString
            if self.Pickerstring == "10"
            {
                self.Maximumpickervi.isHidden = true
                self.tetxfiledview.isHidden = false
                self.singllinetextfiled.isHidden = false
            }
            let myString1 = String(self.index)
            self.singllinetextfiled.text = myString1
            
            self.Pickerstring = myString1
            pickerView.selectRow(self.index, inComponent:0, animated: true)
        }
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField?)
    {
        
            
   
    }
}
