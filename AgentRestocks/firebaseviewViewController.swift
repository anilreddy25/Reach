//
//  firebaseviewViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 27/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//
// pagecontroler icarousel ios swift
// https://www.youtube.com/watch?v=11pPLrVZwfY
import UIKit

class firebaseviewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet weak var firebaseview: UIView!
    @IBOutlet weak var firebasetabelview: UITableView!
    var owendestring = [String]()
    var Popcornanmestring = [String]()
    var Expecteddays = [String]()
    var firebaserupess = [String]()

    var firebaseimages = [UIImage]()

    var firebaseExpires = [String]()

    @IBOutlet weak var CashbackReceived: UIView!
    
    @IBOutlet weak var cashabcktopview: UIView!
    
    
    @IBOutlet weak var close: UIButton!
    
    
    
    @IBOutlet weak var cashbackrecived: UILabel!

    
    
    @IBOutlet weak var forNmorderlabel: UILabel!
    @IBOutlet weak var trackidlabel: UILabel!
    
    @IBOutlet weak var ondatelabel: UILabel!
    
    
    @IBOutlet weak var yourcashbacklabel: UILabel!
    
    @IBOutlet weak var rupesslabel: UILabel!
    
    @IBOutlet weak var expireproductlabel: UILabel!
    
    @IBOutlet weak var Bowlimage: UIImageView!
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        firebaseview.layer.shadowOffset = CGSize(width: 0, height: 2)
        firebaseview.layer.shadowOpacity = 0.3
        firebaseview.layer.shadowRadius = 1.0
        firebaseview.layer.borderColor = UIColor.color2().cgColor
        firebaseview.layer.shadowColor = UIColor.color2().cgColor

        // Do any additional setup after loading the view.
        
//        var owendestring = [String]()
//        var Popcornanmestring = [String]()
//        var Expecteddays = [String]()
//
//        var firebaseimages = [UIImage]()

        owendestring = ["You’ve won","You’ve won","You’ve won","You’ve won","You’ve won"]
        Popcornanmestring = ["Popicorn piri piri masala 6 pcs worth ₹30","Popicorn piri piri masala 6 pcs worth ₹30","Popicorn piri piri masala 6 pcs worth ₹30","Popicorn piri piri masala 6 pcs worth ₹30","Popicorn piri piri masala 6 pcs worth ₹30"]
        Expecteddays  = ["Expired 2 days ago","Expired 2 days ago","Expired 2 days ago","Expired 2 days ago","Expired 2 days ago"]
       
         firebaserupess  = ["₹45.00","₹45.00","₹45.00","₹45.00","₹45.00"]
         firebaseExpires  = ["Expires in 40h 28m","Expires in 40h 28m","EExpires in 40h 28m","Expires in 40h 28m","Expires in 40h 28m"]
        
        
//         firebaseimages = [#imageLiteral(resourceName: "Bowl"),#imageLiteral(resourceName: "Bowl"),#imageLiteral(resourceName: "Bowl"),#imageLiteral(resourceName: "Bowl"),#imageLiteral(resourceName: "scatchcard")]
        
     firebaseimages = [UIImage(named:"up.png"),UIImage(named:"up.png"),UIImage(named:"bowl.png"),UIImage(named:"bowl.png"),UIImage(named:"up.png")] as! [UIImage]
        
//   firebaseimages = [UIImage(named:"up.png"),UIImage(named:"up.png"),UIImage(named:"down.png"),UIImage(named:"up.png"),UIImage(named:"up.png")] as! [UIImage]

        
      self.cashabcktopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
  
    }
    @IBAction func Back(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var seartchviewfinal: UIButton!
    
    @IBAction func searchviewfinalbutton(_ sender: UIButton)
    {

        DispatchQueue.main.async {
            
            let ListofscatchcardView = self.storyboard?.instantiateViewController(withIdentifier:"ListofscatchcardViewController")as!
            ListofscatchcardViewController
            self.present(ListofscatchcardView, animated: true, completion:nil)
            
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return owendestring.count
        
        //return self.imagefinalvalue.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : FirebaseTableViewCell = firebasetabelview.dequeueReusableCell(withIdentifier: "FirebaseTableViewCell", for: indexPath) as! FirebaseTableViewCell
       cell.firebaseimage.image = self.firebaseimages[indexPath.row]
        cell.Youarewon.text = self.owendestring[indexPath.row]
        cell.expiredlabel.text = self.Expecteddays[indexPath.row]
        cell.Popicorn.text = self.Popcornanmestring[indexPath.row]
        cell.expiredlabel.text = self.firebaseExpires[indexPath.row]
        cell.popcornrupesslabel.text = self.firebaserupess[indexPath.row]
        cell.expirelabel.text = self.firebaseExpires[indexPath.row]
        cell.firebaseimage.layer.masksToBounds = true
        cell.firebaseimage.layer.cornerRadius = cell.firebaseimage.frame.width / 2
        cell.firebaseimage.clipsToBounds = true
        
        cell.selectionStyle = .none
        
        return cell
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
     }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        DispatchQueue.main.async {
            self.CashbackReceived.isHidden = false
            
        }
        
    }
    
    @IBAction func closebutton(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            self.CashbackReceived.isHidden = true
        }
    }
    @IBAction func ShopNow(_ sender: UIButton)
    {
        
        DispatchQueue.main.async {
        let ShopNoW = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
            self.present(ShopNoW, animated: true, completion:nil)
        }
    }
    
}
