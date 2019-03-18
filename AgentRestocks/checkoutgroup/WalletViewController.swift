//
//  WalletViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 25/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//SWNinePatchImageFactory-master
/// SWNinePatchImageFactory-master
import UIKit
import Alamofire
import AlamofireImage

class WalletViewController: UIViewController,UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var walletviewfinal: UIView!
    
    @IBOutlet weak var back: UIButton!
    
    
    
    @IBOutlet weak var scartchtopview: UIView!
    
    @IBOutlet weak var secoandscathimage: UIImageView!
    @IBOutlet weak var firstscatch: UIView!
    
    @IBOutlet weak var firstscatchimage: UIImageView!
    @IBOutlet weak var secondscatch: UIView!
    var imagefinalvalue = [UIImage]()
   
    var paidforstring = [String]()
    var paidforstringone = [String]()

    var forNmorderstring = [String]()
    var timestring  = [String]()
    
    var timesRupeestring  = [String]()
    

    @IBOutlet weak var wallettabelview: UITableView!
    

    var section1:Array<Any> = []

    let section = ["pizza", "deep dish pizza", "calzone"]
    
    let items = [["Margarita", "BBQ Chicken", "Peproni"], ["sausage", "meat lovers", "veggie lovers"], ["sausage", "chicken pesto", "prawns & mashrooms"]]
    
    
    
    @IBOutlet weak var filterviewfinal: UIView!
    
    
    @IBOutlet weak var filterviewtop: UIView!
    
    @IBOutlet weak var filterviewtabelview: UITableView!
    
    @IBOutlet weak var filterbottomview: UIView!
    
    var selectedIndex :Int?
    
    var Langagefinalstring1 = [String]()
    var selectimagestring1 = [UIImage]()
    
    
    ///// wallet values
    
    var images1 = [UIImage]()
    var logoImages1 = [String]()
    
    var Productname = [String]()
    var ProductRupess = [String]()
    var ProductExpirerupess = [String]()
    
    
    var Logoimagevalue = [UIImage]()
    
    @IBOutlet weak var thirdscatch: UIView!
    @IBOutlet weak var thirdscathimage: UIImageView!
    @IBOutlet weak var fourthscatchview: UIView!
    @IBOutlet weak var fourscatchimage: UIImageView!
    
    
    /// wallet bill
  
    var WalletuserBiling = String()
    var Walletstatus = NSNumber()

    
    var wallettitleamount = String()
    @IBOutlet weak var walletamount: UILabel!
    
    /// filters array
    
    var filtersarrayfinalvalue = NSArray()
    var filtersarrayfinalvalueone = [String]()

    
    /// Seller Logo
   var coupon_seller_listarray = NSArray()
    
    var coupon_seller_logo = [String]()
    var coupon_seller_name = [String]()
    var coupon_seller_prod_qty = [String]()
    var coupon_seller_expiry_text = [String]()
    var coupon_seller_expiry_text_color = [String]()
    var coupon_seller_id = [String]()
    var coupon_seller_Amount = [String]()
    
    /// Coupon celler Details
    
    var coupon_seller_details = NSArray()
    var coupon_seller_tetx = [String]()
    var coupon_seller_received_amount = [String]()
    var coupon_seller_isexpired = [String]()

    var coupon_seller_date_and_time = [String]()
    var coupon_seller_date_color = [String]()
    var coupon_seller_sub_text = [String]()
    var coupon_seller_seller_expiry_text = [String]()
    var coupon_seller_seller_expiry_text_color = [String]()
    var coupon_seller_type = [String]()
    
    
    //Coupon Data Details
    
    var couponDict = NSDictionary()
    var detailsOFCoupon = NSArray()
    var detailsavalCoupon = NSArray()
    
    var coverView = UIView()
    var imageView = UIImageView()
    
    @IBOutlet weak var emptyimageview: UIView!
    @IBOutlet weak var Totaldemofinal: UIView!
    var AcessTokenfinalstring = String()
    
    var myagentTotalvalue  = String()

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let wallettap = UITapGestureRecognizer(target: self, action: #selector(self.wallethandleTapcatgeory(_:)))
    
        firstscatch.addGestureRecognizer(wallettap)
        
        firstscatch.isUserInteractionEnabled = true
        
        let wallettaptwo = UITapGestureRecognizer(target: self, action: #selector(self.wallethandleTapcatgeorytwo(_:)))
        
        secondscatch.addGestureRecognizer(wallettaptwo)
        
        secondscatch.isUserInteractionEnabled = true
        
        
        
        
        let wallettapthree = UITapGestureRecognizer(target: self, action: #selector(self.wallethandleTapcatgeorythree(_:)))
        
        thirdscatch.addGestureRecognizer(wallettapthree)
        
        thirdscatch.isUserInteractionEnabled = true
        
        
        
        let wallettapfour = UITapGestureRecognizer(target: self, action: #selector(self.wallethandleTapcatgeoryFour(_:)))
        
        fourthscatchview.addGestureRecognizer(wallettapfour)
        
        fourthscatchview.isUserInteractionEnabled = true
        
        
        
        imagefinalvalue = [#imageLiteral(resourceName: "Rupeesone"),#imageLiteral(resourceName: "Rupeestwo"),#imageLiteral(resourceName: "Rupeesone"),#imageLiteral(resourceName: "Rupeestwo")]
        

        
        paidforstring = ["Paid for order","Cashback Received","Paid for order","Cashback Received"]
        paidforstringone = ["Paid for order","Cashback Received"]
        
        forNmorderstring = ["For NM Order #100045124","For NM Order #100045124","For NM Order #100045124","For NM Order #100045124"]
        
        timestring = ["2:09pm","12:10pm","12:09pm","12:12pm"]
        timesRupeestring = ["-₹20.00","+₹20.00","+₹20.00","+₹20.00"]
//        titlearray = ["13 Aug 2018"," 8 Aug 2018"]
        
        
         section1 = ["13 Aug 2018"," 8 Aug 2018"]
      
        Langagefinalstring1  = ["All","Paid","Received"]
        selectimagestring1 = [#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark")]

        self.filterviewtop.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
         self.filterbottomview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        
        
        
        Logoimagevalue = [UIImage(named:"NumberMall.png.png"),UIImage(named:"Timla.png"),UIImage(named:"Britannia.png"),UIImage(named:"Lays.png")] as! [UIImage]

        Productname  = ["NumberMall","Timla","Britannia","Lays"]
        
        ProductRupess  = ["₹250","₹220","₹120","₹80"]
        
        ProductExpirerupess  = ["₹45 expires in 40h 28m","","₹45 expires in 40h 28m",""]
        
        
        walletviewfinal.layer.shadowOffset = CGSize(width: 0, height: 2)
        walletviewfinal.layer.shadowOpacity = 0.3
        walletviewfinal.layer.shadowRadius = 1.0
        walletviewfinal.layer.borderColor = UIColor.color2().cgColor
        walletviewfinal.layer.shadowColor = UIColor.color2().cgColor
        walletviewfinal.dropShadow()
        DispatchQueue.main.async
            {
            self.Singelwalletcallfunctionfinalvalue()
        }
        
    }
    
    
    
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func wallethandleTapcatgeory(_ sender: UITapGestureRecognizer)
    {
        let ViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"ViewController") as! ViewController
        
        self.addChildViewController(ViewControllerfinal)
        ViewControllerfinal.view.frame = self.view.frame
        self.view.addSubview(ViewControllerfinal.view)
        ViewControllerfinal.didMove(toParentViewController: self)
    }
    @objc func wallethandleTapcatgeorytwo(_ sender: UITapGestureRecognizer)
    {
        let ViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"scatchtwoViewController") as! scatchtwoViewController
        
        self.addChildViewController(ViewControllerfinal)
        ViewControllerfinal.view.frame = self.view.frame
        self.view.addSubview(ViewControllerfinal.view)
        ViewControllerfinal.didMove(toParentViewController: self)
    }
    
    @objc func wallethandleTapcatgeorythree(_ sender: UITapGestureRecognizer)
    {
        let ViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"scatchthreeViewController") as! scatchthreeViewController
        self.addChildViewController(ViewControllerfinal)
        ViewControllerfinal.view.frame = self.view.frame
        self.view.addSubview(ViewControllerfinal.view)
        ViewControllerfinal.didMove(toParentViewController: self)
    }
    @objc func wallethandleTapcatgeoryFour(_ sender: UITapGestureRecognizer)
    {
        let ViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"ScatchfourViewController") as! ScatchfourViewController
        
        self.addChildViewController(ViewControllerfinal)
        ViewControllerfinal.view.frame = self.view.frame
        self.view.addSubview(ViewControllerfinal.view)
        ViewControllerfinal.didMove(toParentViewController: self)
    }
    

    @IBAction func searchbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let productscanview = self.storyboard?.instantiateViewController(withIdentifier:"productscanViewController")as!productscanViewController
            self.present(productscanview, animated:true, completion:nil)
        }
    }
    @IBAction func filterbutton(_ sender: Any)
    {
        self.filterviewfinal.isHidden = false
    }
    
    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
      
    }
    
    @IBAction func scartchclose(_ sender: UIButton)
    {
//        @IBOutlet weak var emptyimageview: UIView!
//        @IBOutlet weak var Totaldemofinal: UIView!

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
 
        if tableView == wallettabelview
        {
            return coupon_seller_name.count

        }
        else{
            return filtersarrayfinalvalueone.count

        }

         //return self.imagefinalvalue.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == wallettabelview
        {
            let cell : WalletTableViewCell = wallettabelview.dequeueReusableCell(withIdentifier: "WalletTableViewCell", for: indexPath) as! WalletTableViewCell
      
            cell.walletrupeeslabel.text = self.coupon_seller_prod_qty[indexPath.row] as? String
     
             cell.walletName.text = self.coupon_seller_name[indexPath.row] as? String

            
            cell.wallettimelabel.text = self.coupon_seller_expiry_text[indexPath.row] as? String
            
//
         let Couponimage = self.coupon_seller_logo[indexPath.row]
          cell.walletimageview.sd_setImage(with: URL(string: Couponimage), placeholderImage:(UIImage(named:"Britannia.png")), options: .refreshCached, completed: nil)
            cell.walletimageview.layer.cornerRadius = 2.0
             cell.walletimageview.layer.masksToBounds = true
            cell.walletimageview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
       
            return cell
        }
        else{
            let cell  = filterviewtabelview.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as! LanguageTableViewCell
            cell.Langagelabael.text = self.filtersarrayfinalvalueone[indexPath.row]
            cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2
      
            if self.self.filtersarrayfinalvalueone.count-1 == indexPath.row
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
        
        }
        
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        if tableView == wallettabelview
        {
            return self.forNmorderstring.count

        }
        else{
             return self.paidforstring.count
        }
    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {

        
        let setVal: agentFreebeVC = (self.storyboard?.instantiateViewController(withIdentifier: "agentFreebeVC") as? agentFreebeVC)!
        setVal.arrayList = self.coupon_seller_details
        setVal.walletAmount = (self.coupon_seller_Amount[indexPath.row] as? String)!
        self.present(setVal, animated: true, completion: nil)
        
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height:65))
//            view.backgroundColor = UIColor.wallettitleforheaderrsection()
//            let label = UILabel(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
//            label.text = self.section[section]
//            label.textColor = UIColor.black

            self.view.addSubview(view)

            return view


    }
//    private func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 40
//    }
//    func tableView(_  tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return self.section[section]
//
//
//
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 70.0;
//    }
//
    @IBAction func Cancelbuttontwo(_ sender: UIButton)
    {
        self.filterviewfinal.isHidden = true
    }
    
    @IBAction func filterokbutton(_ sender: UIButton)
    {
        self.filterviewfinal.isHidden = true
        
        
    }
    
    
    @IBAction func btnViewALLAction(_ sender: Any) {
        
        let allFreebie: freebieViewALLVC = (self.storyboard?.instantiateViewController(withIdentifier: "freebieViewALLVC") as? freebieViewALLVC)!
        allFreebie.listOfFreebies = self.detailsOFCoupon
        allFreebie.listavalFreebies = self.detailsavalCoupon
        self.present(allFreebie, animated: true, completion: nil)
    }
    
    
    func Singelwalletcallfunctionfinalvalue()
    {
        self.showSpinner()
        
        let defaulst = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.WalletuserBiling = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        
        let postString12 = String(format: "method=%@&userid=%@","getWallet", "127")
        print(postString12)
        
        request.httpBody = postString12.data(using: .utf8)
        request.addValue(AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                DispatchQueue.main.async
                    {
                    self.removeSpinner()
                }
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    self.Walletstatus = dict.value(forKey:"Status")as!NSNumber
                    self.wallettitleamount = dict.value(forKey:"title_amount")as!String
                    self.filtersarrayfinalvalueone = dict.value(forKey:"filters")as![String]
             self.coupon_seller_listarray = dict.value(forKey:"coupon_seller_list")as!NSArray
                   
                    
                    if let coupon_seller_logofinalvalue:[String] = self.coupon_seller_listarray.value(forKey:"seller_logo") as? [String]
                        
                    {
                          self.coupon_seller_logo = coupon_seller_logofinalvalue
                        
                    }

                    if let coupon_seller_nameinalvalue:[String] = self.coupon_seller_listarray.value(forKey:"seller_name") as? [String]
                        
                    {
                      self.coupon_seller_name = coupon_seller_nameinalvalue
                        
                    }
                    

                    if let coupon_seller_prod_qtyinalvalue:[String] = self.coupon_seller_listarray.value(forKey:"seller_prod_qty") as? [String]
                        
                    {
                        self.coupon_seller_prod_qty = coupon_seller_prod_qtyinalvalue
                        
                    }
                    

                    if let coupon_seller_expiry_textfinal:[String] = self.coupon_seller_listarray.value(forKey: "seller_expiry_text") as? [String]
                    {
                        self.coupon_seller_expiry_text = coupon_seller_expiry_textfinal
                    }
                    
        if let coupon_seller_expiry_text_colortfinal:[String] = self.coupon_seller_listarray.value(forKey: "seller_expiry_text_color") as? [String]
                    {
                        self.coupon_seller_expiry_text_color = coupon_seller_expiry_text_colortfinal
                    }
                    
                    if let seller_idfinalvalue:[String] = self.coupon_seller_listarray.value(forKey: "seller_id")as?[String]
                    {
                        self.coupon_seller_id = seller_idfinalvalue
                    }

                    if let sellerValue:[String] = self.coupon_seller_listarray.value(forKey: "seller_amount")as?[String]
                    {
                        self.coupon_seller_Amount = sellerValue
                        
                    }
                    if let arrayDetails: NSArray =   self.coupon_seller_listarray.value(forKey:"seller_details")as? NSArray
                    {
                        self.coupon_seller_details = arrayDetails
                    }
      
                    if let listOFCoupon: NSDictionary = dict.value(forKey:"coupon_data")as? NSDictionary
                    {
                        self.couponDict = listOFCoupon
                    }
                    if let arrayOfCoupon: NSArray = self.couponDict["coupon_list"] as? NSArray
                    {
                        self.detailsOFCoupon = arrayOfCoupon
                    }
                    if let arrayavailCoupon: NSArray = self.couponDict["coupon_avail_list"] as? NSArray {
                        self.detailsavalCoupon = arrayavailCoupon
                    }
                    
                    DispatchQueue.main.async
                    {
                        if self.coupon_seller_listarray.count == 0
                        {
                            self.wallettabelview.isHidden = true
                            self.emptyimageview.isHidden = false
                            self.filterviewtabelview.isHidden = true
                            self.scartchtopview.isHidden = true
                        }
                        if self.coupon_seller_listarray.count > 0
                        {
                            self.wallettabelview.isHidden = false
                            self.emptyimageview.isHidden = true
                            self.scartchtopview.isHidden = false
                        }
                       self.walletamount.text = self.wallettitleamount
                        self.filterviewtabelview.reloadData()
                        self.wallettabelview.reloadData()
                    }
                }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    self.removeSpinner()
                }
                break
            }
        }
    }
    @IBAction func myclosebutton(_ sender: UIButton)
    {
        DispatchQueue.main.async {
        self.Totaldemofinal.isHidden = true
        }
    }
    
    func showSpinner()
    {
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner()
    {
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
}
