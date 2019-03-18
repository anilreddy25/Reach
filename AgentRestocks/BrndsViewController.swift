//
//  BrndsViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 08/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import QuartzCore
class BrndsViewController: UIViewController,UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var filterbrand: UIButton!
    @IBOutlet weak var filtersearch: UIButton!
    @IBOutlet weak var menubrand: UIButton!
    @IBOutlet weak var Homeone: UIButton!
    @IBOutlet weak var Hometwo: UIButton!
    @IBOutlet weak var catageoryone: UIButton!
    @IBOutlet weak var catageorytwo: UIButton!
    @IBOutlet weak var Brnads: UIButton!
    @IBOutlet weak var Brandstwo: UIButton!
    @IBOutlet weak var favourite: UIButton!
    @IBOutlet weak var fsvouritetwo: UIButton!
    @IBOutlet weak var cart: UIButton!
    @IBOutlet weak var carttwo: UIButton!
    @IBOutlet weak var NewBrandcollectionview: UICollectionView!
    var New_BrandItem = [String]()
    
    var selectedIndex :Int?
    @IBOutlet weak var NewBrandtabelview: UITableView!
    
    var NewBrandsimage = [UIImage]()
    var NewBrandsName = [String]()
    var addbuttonimage = [UIImage]()
    var NewBrandimagefinalvalue = [UIImage]()
    var NewBrandofferprize = [NSNumber]()
    var QuantityProduct = [String]()
    var ProductPicks = [String]()
    var Explorecatageory_item = [String]()
    var ExploreBrand_image = [UIImage]()
    var ExploreBrand_Name = [String]()
    var  Abcdelements = [String]()
    @IBOutlet weak var bottomstaticview: UIView!
    @IBOutlet weak var popview: UIView!
    
    @IBOutlet weak var Explorebrandscollectionview: UICollectionView!
    
    
    @IBOutlet weak var abcdcollectionview: UICollectionView!
    var timer = Timer()

    var productItems =  [String]()
    var itemDays =  [String]()
    var stockIn =  [String]()
    var cashBackfinal = [String]()
    var cashBackfinalTwo = NSString()
    
    @IBOutlet weak var productDetailsTV: UITableView!

    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var Menu_vc:MenuViewController!
    
    @IBOutlet weak var Brandsscrollview: UIScrollView!
    @IBOutlet weak var popupscrollview: UIScrollView!

    @IBOutlet weak var demoview: UIView!

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        Abcdelements = ["1","A","B","C","D","E","F","G","H","I","G","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        New_BrandItem = ["Popiocn piri masala","Popiocn piri masala","Popiocn piri masala","Popiocn piri masala","Popiocn piri masala"]
       NewBrandsName = ["Trending","Chocolates","Candies","Biscuits","Health Drink","Bingo"]
        //addbuttonimage = [#imageLiteral(resourceName: "Add"),#imageLiteral(resourceName: "Notification"),#imageLiteral(resourceName: "Add"),#imageLiteral(resourceName: "Notification"),#imageLiteral(resourceName: "Add"),#imageLiteral(resourceName: "Notification")]
        NewBrandimagefinalvalue = [#imageLiteral(resourceName: "popicon"),#imageLiteral(resourceName: "popicon"),#imageLiteral(resourceName: "popicon"),#imageLiteral(resourceName: "popicon"),#imageLiteral(resourceName: "popicon")]
//        NewBrandofferprize = ["15","20","30","40","50"]
        let Mrp = "MRP"
        let rupee = "\u{20B9}"
        let rupeeTwo = "99999.00"
        let rupeeThree = "("
        let ruppeeFour = "80000gm"

        
       
        
        let rupeeFive = ")"

        let finalvalue = NSString(format:"%@%@%@%@%@%@",Mrp,rupee,rupeeTwo,rupeeThree,ruppeeFour,rupeeFive)
        
        QuantityProduct = [finalvalue,finalvalue,finalvalue,finalvalue,finalvalue] as [String]
        
        let Moqvalue = "MOQ"
        let MoqvaluepicksType = "12pcs"
        let crossValue = "x"
        let singelvalue = "1"
        let Equalvalue = "="
        let Equalvaluefinalquantity = "12pcs"

         let finalvalueTwo = NSString(format:"%@%@%@%@%@%@",Moqvalue,MoqvaluepicksType,crossValue,singelvalue,Equalvalue,Equalvaluefinalquantity)
   
        ProductPicks = [finalvalueTwo,finalvalueTwo,finalvalueTwo,finalvalueTwo,finalvalueTwo] as [String]
        
        NewBrandcollectionview.showsHorizontalScrollIndicator = false

       // bottomstaticview.layer.addBorder(edge:.top, color:UIColor.color1(), thickness:0.6)
      

        abcdcollectionview.showsHorizontalScrollIndicator = false
        Explorebrandscollectionview.showsHorizontalScrollIndicator = false
        self.popview.layer.addBorder(edge:.top, color: UIColor.color2(), thickness:0.6)

        productItems = ["Popicorn","Bingo","Lays","Haldirams","Trends"]
        itemDays = ["7Days","99 Days","999 Days","10 Days","12 Days"]
        stockIn = ["99 Instock","125 Instock","999 Instock","StockOut","75Instock"]
        
        
       cashBackfinal = ["2096 Cashback","2096 Cashback","2096 Cashback","2096 Cashback","2096 Cashback"]
        
        self.bottomstaticview.layer.addBorder(edge:.top, color: UIColor.color2(), thickness:0.6)

          self.popview.layer.addBorder(edge:.top, color: UIColor.color2(), thickness:0.6)
        self.popupscrollview.layer.addBorder(edge:.top, color: UIColor.color2(), thickness:0.6)

        Menu_vc = self.storyboard?.instantiateViewController(withIdentifier:"MenuViewController")as!MenuViewController
        let SwipeRight = UISwipeGestureRecognizer(target:self, action: #selector(self.respondToGesture))
        SwipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(SwipeRight)
        let SwipeLeft = UISwipeGestureRecognizer(target:self, action: #selector(self.respondToGesture))
        SwipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(SwipeLeft)

        
        if self.view.frame.size.height < 800 {
            Brandsscrollview.contentInset = UIEdgeInsetsMake(0, 0, self.view.frame.size.height-130, 0)
            Brandsscrollview.isScrollEnabled = true
         Brandsscrollview.showsVerticalScrollIndicator = false
        }

        let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
        bottomSheet.defaultMaxinumDisplayHeight  = 220
      //bottomSheet.defaultMininumDisplayHeight = 240
      bottomSheet.displayState = .maxDisplay
        bottomSheet.frame = self.view.bounds
        demoview.addSubview(bottomSheet)
        
    }
    @objc func respondToGesture(gesture:UISwipeGestureRecognizer)
    {
        switch gesture.direction
        {
        case UISwipeGestureRecognizerDirection.right:
            print("Right Swipe")
            Showmenu()
        case UISwipeGestureRecognizerDirection.left:
            print("left Swipe")
            Closemenu()
            
        default:
            break
        }
    }
    func Showmenu()
    {
        UIView.animate(withDuration:0.3) { ()-> Void in
            
            self.Menu_vc.view.frame = CGRect(x: 0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height)
            self.Menu_vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            self.addChildViewController(self.Menu_vc)
            self.view.addSubview(self.Menu_vc.view)
            AppDelegate.menu_bool = false
        }
        
        
    }
    func Closemenu()
    {
        
        UIView.animate(withDuration: 0.3, animations: { ()-> Void in
            self.Menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y:0, width:UIScreen.main.bounds.size.width-165, height:UIScreen.main.bounds.size.height)
        }) { (finished) in
            self.Menu_vc.view.removeFromSuperview()
        }
        AppDelegate.menu_bool = true
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    @IBAction func MenuBarnd(_ sender: UIButton)
    {
        if AppDelegate.menu_bool
        {
            Showmenu()
        }
        else{
            Closemenu()
            
        }
    }
    @IBAction func filtersearch(_ sender: Any)
    {
        
    }
    @IBAction func filterBrand(_ sender: UIButton)
    {
        
    }
    
    @IBAction func Home(_ sender: UIButton)
    {
        let Homepresent = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
        self.present(Homepresent, animated: true, completion:nil)
    }
    
    
    @IBAction func catageory(_ sender: UIButton) {
        
        let ItemsView = self.storyboard?.instantiateViewController(withIdentifier:"ItemsViewController")as!ItemsViewController
        self.present(ItemsView, animated: true, completion:nil)
    }
    
    @IBAction func Brands(_ sender: UIButton)
    {
        if Brnads.tag == 0
        {
            let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
            bottomSheet.defaultMininumDisplayHeight = 120
            bottomSheet.defaultMaxinumDisplayHeight = 220
            bottomSheet.displayState = .maxDisplay
            bottomSheet.frame = self.view.bounds
            demoview.addSubview(bottomSheet)
            Brnads.tag = 1
            
        }
        
        else if Brnads.tag == 1{
            let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
            bottomSheet.defaultMininumDisplayHeight = 110
            bottomSheet.defaultMaxinumDisplayHeight = 220
            bottomSheet.displayState = .minDisplay
            bottomSheet.frame = self.view.bounds
            demoview.addSubview(bottomSheet)
            Brnads.tag = 0
        }
        
    }
    @IBAction func Favourite(_ sender: UIButton) {
    }
    @IBAction func Cart(_ sender: UIButton) {
    }
    
    
   
    
    @IBAction func dismsissviewvbutton(_ sender: UIButton) {
      
    
 

        
    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == NewBrandcollectionview
        {
            return NewBrandsName.count

        }
        else if collectionView == abcdcollectionview
        {
            
            return Abcdelements.count

        }
        else{
                return Explorecatageory_item.count
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        if collectionView == NewBrandcollectionview
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"NewBrandCollectionViewCell", for: indexPath as IndexPath) as!NewBrandCollectionViewCell
            cell.NewBrandlabel.text = self.NewBrandsName[indexPath.item]
            if selectedIndex == nil
            {
                if indexPath.row == 0
                {
                    cell.NewBrandlabel.textColor = UIColor.red
                }
            }
            else
            {
                if indexPath.row == selectedIndex
                {
                    cell.NewBrandlabel.textColor = UIColor.red
                }
                else{
                    cell.NewBrandlabel.textColor = UIColor.lightGray
                }
            }
            return cell

        }
            else if collectionView == abcdcollectionview
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"AbcdCollectionViewCell", for: indexPath as IndexPath) as!AbcdCollectionViewCell
            cell.Abcdlabel.text = self.Abcdelements[indexPath.item]
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"NewBrandTwoCollectionViewCell", for: indexPath as IndexPath) as!NewBrandTwoCollectionViewCell
            cell.catageorylabel.text = self.Explorecatageory_item[indexPath.item]
            
         
            cell.catageoryimageview.image = self.ExploreBrand_image[indexPath.item]
            cell.vi.layer.cornerRadius = 4
            cell.vi.layer.borderWidth = 1.0
            
            cell.catageorysview.layer.borderWidth = 1.0
            cell.catageorysview.layer.borderColor = UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
            cell.vi.layer.borderColor = UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
            cell.catageorysview.roundCorners([.topLeft, .topRight], radius: 5)

            return cell
        }
   
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if collectionView == NewBrandcollectionview
        {
            selectedIndex = indexPath.item
            NewBrandcollectionview.reloadData()
        }
        else
        {
            
        }
        
     
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.productItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : tableListCell = tableView.dequeueReusableCell(withIdentifier: "tableListCell", for: indexPath) as! tableListCell
        cell.selectionStyle = .none

        if indexPath.row == 0{
            cell.btnAdd.setImage(#imageLiteral(resourceName: "add"), for: .normal)
            cell.NewBrandlabel.isHidden = true

        }else if indexPath.row == 1{
            cell.btnAdd.setImage(#imageLiteral(resourceName: "Notification"), for: .normal)
            cell.NewBrandlabel.isHidden = true

        }
        else{
            cell.btnAdd.setImage(#imageLiteral(resourceName: "cart_edit"), for: .normal)
            cell.NewBrandlabel.text = "999"
            cell.NewBrandlabel.isHidden = false
        }
        let rupee = "\u{20B9}"
        let rupeeTwo = "9999.00"
        let finalPrice = "9999.00"
        let finalvalue = NSString(format:"%@%@",rupee,rupeeTwo)
        cell.lblRate.text = finalvalue as String
        cell.lblProduct.text = self.productItems[indexPath.row]
        cell.lblDays.text = self.itemDays[indexPath.row]
        cell.lblStock.text = self.stockIn[indexPath.row]
    
        
        let strickRate =  NSString(format:"%@%@",rupee,finalPrice)
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: strickRate as String)
        attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        
        cell.lblStrick.attributedText = attributeString
        cell.cashbacklabel.text =  cashBackfinal[indexPath.row]
        return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        DispatchQueue.main.async {
            let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
            self.present(viewfinal, animated: true, completion:nil)
        }

    }
    
    
   
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView == NewBrandtabelview
        {
            
        }
       else if scrollView == Brandsscrollview
        {

            print(scrollView.contentOffset.y)
          
        }
        else if scrollView == Brandsscrollview
        {
            
            print(scrollView.contentOffset.y)
            
//            @IBOutlet weak var Explorebrandscollectionview: UICollectionView!
//
//
//            @IBOutlet weak var abcdcollectionview: UICollectionView!
            
        }
        else if scrollView == Explorebrandscollectionview
        {
            popupscrollview.isScrollEnabled = true
        }
        else if scrollView == abcdcollectionview
        {
            popupscrollview.isScrollEnabled = true

        }
            
        else{
           
        }
    }
 
   
   
}
extension UIView {
    func slideInFromLeft(duration: TimeInterval = 0.8, completionDelegate: AnyObject? = nil) {
        let slideInFromLeftTransition = CATransition()
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate as? CAAnimationDelegate
        }
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromTop
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromTopTransition")
    }
    
    func slideInFromLefttwo(duration: TimeInterval = 0.4, completionDelegate: AnyObject? = nil) {
        let slideInFromLeftTransition = CATransition()
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate as? CAAnimationDelegate
        }
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromTop
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromTopTransition")
    }
    
    
}

