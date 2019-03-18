//
//  FilterViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 31/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var mybackbutton: UIButton!
    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var filtertabelview: UITableView!
    var filterarrayone = [String]()
    var ChekcLogoimagevalue = [UIImage]()
    var acessoryimageValue = [UIImage]()
    @IBOutlet weak var totalviewfinal: UIView!
    @IBOutlet weak var bottomviewfinalvalue: UIView!
    @IBOutlet weak var clearbutton: UIButton!
    @IBOutlet weak var applayfilters: UIButton!
    @IBOutlet weak var filterviewfinal: UIView!
    @IBOutlet weak var filtertabelviewtwo: UITableView!
    var filterarraytwo = [String]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        topview.layer.shadowOffset = CGSize(width: 0, height: 3)
        topview.layer.shadowOpacity = 0.6
        topview.layer.shadowRadius = 3.0
        topview.layer.shadowColor = UIColor.color2().cgColor
        filterarrayone = ["Company","Brand","SKU","Team","Sales","Volume","Orders"]
           ChekcLogoimagevalue = [UIImage(named:"uncheckmark.png"),UIImage(named:"uncheckmark.png"),UIImage(named:"uncheckmark.png"),UIImage(named:"uncheckmark.png"),UIImage(named:"uncheckmark.png"),UIImage(named:"uncheckmark.png"),UIImage(named:"uncheckmark.png")] as! [UIImage]
        
        acessoryimageValue = [UIImage(named:"checknmar.png"),UIImage(named:"checknmar.png"),UIImage(named:"checknmar.png"),UIImage(named:"checknmar.png"),UIImage(named:"checknmar.png"),UIImage(named:"checknmar.png"),UIImage(named:"checknmar.png")] as! [UIImage]
        
        filtertabelview.dataSource = self
        filtertabelview.delegate = self
        filtertabelviewtwo.dataSource = self
        filtertabelviewtwo.delegate = self
        
        
        self.bottomviewfinalvalue.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.filterviewfinal.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.filterviewfinal.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
   filterarraytwo = ["What’s new","Price: High to low","Price: Low to high","Popularity","Sales","Margin","Credit period"]
    }
    
    @IBAction func Backbutton(_ sender: UIButton)
    {
      self.dismiss(animated:true, completion:nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if tableView == filtertabelview
        {
            return self.filterarrayone.count

        }
        else
        {
            return self.filterarraytwo.count

        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        if tableView == filtertabelview
        {
            let cell  = filtertabelview.dequeueReusableCell(withIdentifier: "filterTableViewCell", for: indexPath) as! filterTableViewCell
            cell.chackmarkListtabelviewcell.text = self.filterarrayone[indexPath.row]
            let string1 = self.ChekcLogoimagevalue[indexPath.row] as? UIImage
            cell.checkmarkbutton.setBackgroundImage(string1, for:.normal)
            cell.checkmarkbutton.isSelected = true
            let stringtwo = self.acessoryimageValue[indexPath.row] as? UIImage
            cell.acessorymarkbutton.setBackgroundImage(stringtwo, for:.normal)
            cell.checkmarkbutton.tag = indexPath.row
            cell.checkmarkbutton.setBackgroundImage(string1, for:.normal)
            cell.checkmarkbutton.addTarget(self, action: #selector(FilterViewController.connected(sender:)), for: .touchUpInside)
            cell.selectionStyle = .none
            return cell
        }
        else
        {
            let cell  = filtertabelviewtwo.dequeueReusableCell(withIdentifier: "FiltertwoTableViewCell", for: indexPath) as! FiltertwoTableViewCell
                  cell.mycheckmarkListlabel.text = self.filterarraytwo[indexPath.row]
            let string1 = self.ChekcLogoimagevalue[indexPath.row] as? UIImage
            cell.mycheckmarkListbutton.setBackgroundImage(string1, for:.normal)
            cell.mycheckmarkListbutton.isSelected = true
            cell.mycheckmarkListbutton.tag = indexPath.row
            cell.mycheckmarkListbutton.setBackgroundImage(string1, for:.normal)
            cell.mycheckmarkListbutton.addTarget(self, action: #selector(FilterViewController.connected(sender:)), for: .touchUpInside)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    @objc func connected(sender: UIButton)
    {
            let button = sender.tag
            let buttonTag = sender
            if(buttonTag.isSelected == true)
            {
                buttonTag.setBackgroundImage(#imageLiteral(resourceName: "checkmark"), for:.normal)

                buttonTag.isSelected = false
            }
            else if (buttonTag.isSelected == false)
            {
                buttonTag.setBackgroundImage(#imageLiteral(resourceName: "uncheckmark-2"), for:.normal)
                buttonTag.isSelected = true
            }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 52
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
    @IBAction func Claerbutton(_ sender: UIButton)
    {
    }
    @IBAction func applaybutton(_ sender: UIButton)
    {
    }
}
