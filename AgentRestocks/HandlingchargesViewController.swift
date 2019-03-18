//
//  HandlingchargesViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 27/11/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class HandlingchargesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var handlingchargeslabel: UILabel!
    @IBOutlet weak var totalamountlabel: UILabel!
    
    var Hanndlingitemname = NSArray()
    var Hanndlingitemimage = NSArray()
    var Hanndlingitemtextone = NSArray()
    var Hanndlingitemtexttwo = NSArray()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    @IBOutlet weak var handlingtabelview: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }
    @IBAction func Backbutton(_ sender: UIButton) {
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
            return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//        if tableView == viewBrandtabelview
//        {
//            DispatchQueue.main.async {
//                let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
//                viewfinal.productdemoidfinalvalue =  self.ProductidValue[indexPath.row]
//                self.present(viewfinal, animated: true, completion:nil)
//            }
//        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       
            return self.Hanndlingitemname.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
            let cell  = handlingtabelview.dequeueReusableCell(withIdentifier: "HandlingTableViewCell", for: indexPath) as! HandlingTableViewCell
            cell.selectionStyle = .none
        cell.productname.text = self.Hanndlingitemname[indexPath.row] as? String
        let topbrandimagefinal = self.Hanndlingitemimage[indexPath.item]as? String
        cell.imageview.sd_setImage(with: URL(string:topbrandimagefinal!), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
        cell.labelone.text = self.Hanndlingitemtextone[indexPath.row] as? String
        cell.labeltwo.text = self.Hanndlingitemtexttwo[indexPath.row] as? String
            return cell
   }
}
