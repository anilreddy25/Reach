//
//  LanguageViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 26/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

/// Languagege ticks

//// https://asrt.gluege.boerde.de//
//// https://asrt.gluege.boerde.de//

/// https://github.com/onmyway133/fantastic-ios-animation
import UIKit

class LanguageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var Langeview: UIView!
    
    @IBOutlet weak var ALngagetabelview: UITableView!
    
    @IBOutlet weak var LAngagetopview: UIView!
    
    @IBOutlet weak var ALngaebototmview: UIView!
    
    @IBOutlet weak var toatallangeview: UIView!
    var selectedIndex :Int?

    var Langagefinalstring = [String]()
    var selectimagestring = [UIImage]()

    @IBOutlet weak var Langagesinglview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Langeview.layer.shadowOffset = CGSize(width: 0, height: 2)
        Langeview.layer.shadowOpacity = 0.3
        Langeview.layer.shadowRadius = 1.0
        Langeview.layer.borderColor = UIColor.color2().cgColor
        Langeview.layer.shadowColor = UIColor.color2().cgColor
        Langagefinalstring  = ["English","Hindi (coming soon)","हिँढी (coming soon)","Telugu (coming soon)"]
        selectimagestring = [#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark")]
        LAngagetopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        ALngaebototmview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
       self.Langagesinglview.isHidden = true
        
        self.toatallangeview.roundedButton()
        self.LAngagetopview.roundedButton()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    @IBAction func MyBackbutton(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion:nil)
        
    }
    
    
    @IBAction func Clasebutton(_ sender: UIButton)
    {
        self.Langagesinglview.isHidden = true
    }
    
    
    
    
    
    
    @IBAction func MyLangage(_ sender: UIButton)
    {
        self.Langagesinglview.isHidden = false

    }
    @IBAction func ok(_ sender: UIButton)
    {
        //self.view.removeFromSuperview()
        self.dismiss(animated:true, completion:nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
  
            return self.Langagefinalstring.count
      
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
  
        
            let cell  = ALngagetabelview.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as! LanguageTableViewCell
            cell.Langagelabael.text = self.Langagefinalstring[indexPath.row]
        cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2

        if self.Langagefinalstring.count-1 == indexPath.row
        {
            cell.langaeviewtwo.isHidden = true
        }
        else{
            cell.langaeviewtwo.isHidden = false
          }

        if selectedIndex == nil
        {
            if indexPath.row == 0
            {
                cell.imagefinal.isHidden = false

                                cell.LAngageviewone.backgroundColor = UIColor.color2()
                                cell.langaeviewtwo.backgroundColor = UIColor.color2()
                                cell.Langagelabael.textColor = UIColor.black
                                cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2
                cell.imagefinal.image = #imageLiteral(resourceName: "TickMark")
           cell.LAngageviewone.isHidden = true
                
            }
        }
            
        else
        {
            if indexPath.row == selectedIndex
            {
                cell.imagefinal.isHidden = false

                cell.LAngageviewone.backgroundColor = UIColor.color2()
                cell.langaeviewtwo.backgroundColor = UIColor.color2()
                cell.Langagelabael.textColor = UIColor.black
                cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2
                cell.imagefinal.image = #imageLiteral(resourceName: "TickMark")
                cell.LAngageviewone.isHidden = true

            }
            else{
              
                cell.LAngageviewone.backgroundColor = UIColor.color2()
                cell.langaeviewtwo.backgroundColor = UIColor.color2()
                cell.Langagelabael.textColor = UIColor.black
                cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2
                cell.imagefinal.isHidden = true
                cell.LAngageviewone.isHidden = false

                
                
            }
        }
        
        
      return cell
        
        }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 52
            
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        /// https://stackoverflow.com/questions/37296929/implement-document-picker-in-swift-ios/42370660
        //// https://stackoverflow.com/questions/48577112/display-pdf-file-in-swift-4
        if tableView == ALngagetabelview
        {
            selectedIndex = indexPath.item
            ALngagetabelview.reloadData()
            
            
        }
        
        
}
}
