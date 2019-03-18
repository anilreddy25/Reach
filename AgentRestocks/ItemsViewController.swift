//
//  ItemsViewController.swift
//  AgentRestocks
//
//  Created by apple on 8/6/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    @IBOutlet weak var homeScroll: UIScrollView!
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var collectionList: UICollectionView!
    @IBOutlet weak var tabView: UIView!
    @IBOutlet weak var productDetailsTV: UITableView!
    @IBOutlet weak var horizontalScrollView: UIView!
    @IBOutlet weak var imgVIew: UIImageView!
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var slideMenu: UIButton!
    
    @IBOutlet weak var btnCart: UIButton!
    var items =  [String]()
    var productItems =  [String]()
    var itemDays =  [String]()
    var stockIn =  [String]()
    var selectedIndex : Int?
    var swipedOnImage = UIPanGestureRecognizer()
    var vc = UIViewController()

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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionList.delegate = self
        collectionList.dataSource = self
        homeScroll.delegate = self
        productDetailsTV.delegate = self
        productDetailsTV.dataSource = self
        
        items = ["Trending", "Popicorn", "Lays", "Bingo", "Haldirams", "YellowDin"]
        productItems = ["Popicorn","Bingo","Lays","Haldirams","Trends"]
        itemDays = ["7Days","99Days","999+Days","10Days","12Days"]
        stockIn = ["99InStock","125 InStock","999+Stock","StockOut","75Stock"]
        
        self.collectionList.allowsMultipleSelection = false
        if view.frame.size.width < 800 {
            homeScroll.contentSize = CGSize(width: self.view.frame.size.width, height:1200)
            homeScroll.showsVerticalScrollIndicator = false
        }
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action:#selector(swiped))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)

        
       
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let reuseIdentifier = "Cell"
        
        let cell : itemListView = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! itemListView
         cell.lblCollection.text = (self.items[indexPath.item] as! String)
        
        
        
        if selectedIndex == nil
        {
            if indexPath.row == 0
            {
  cell.lblCollection.textColor = UIColor.red
                
            }
        }
        else
        {
            if indexPath.row == selectedIndex
            {
                cell.lblCollection.textColor = UIColor.red
            }
            else{
                cell.lblCollection.textColor = UIColor.lightGray

            }
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        selectedIndex = indexPath.item
        
        collectionList.reloadData()
    }
    
  
    // MARK: - UITableViewDataSource protocol

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.productItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : tableListCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! tableListCell
        
        if indexPath.row == 0{
            cell.btnAdd.setImage(#imageLiteral(resourceName: "Add"), for: .normal)
        }else if indexPath.row == 1{
            cell.btnAdd.setImage(#imageLiteral(resourceName: "Notification"), for: .normal)
        }
        else{
            cell.btnAdd.setImage(#imageLiteral(resourceName: "cart_edit"), for: .normal)
        }
        let rupee = "\u{20B9}"
        let rupeeTwo = "114.00"
        let finalPrice = "120.00"
        let finalvalue = NSString(format:"%@%@",rupee,rupeeTwo)
        cell.lblRate.text = finalvalue as String
        
        cell.lblProduct.text = self.productItems[indexPath.row]
        cell.lblDays.text = self.itemDays[indexPath.row]
        cell.lblStock.text = self.stockIn[indexPath.row]
        
//        var url:NSURL = NSURL(string: "http://172.31.0.107:8010/uploads/products/pling/pling_onion.jpg")!
//        let data = try? Data(contentsOf: url as URL)
//
//        let img = UIImage(data: data as! Data)
//        cell.imgProduct.image = img
     
       let strickRate =  NSString(format:"%@%@",rupee,finalPrice)

        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: strickRate as String)
        attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))

        cell.lblStrick.attributedText = attributeString
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let productVC : productDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "productDetailVC") as! productDetailVC
//        self.present(productVC, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 20))
        view.backgroundColor = UIColor.red
        let buton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 15))
        buton.titleLabel?.text = "Explore Categories"
        buton.titleLabel?.font = UIFont(name: "Arial", size: 12)
        buton.addTarget(self, action: #selector(handle), for: .touchUpInside)
        view.addSubview(buton)
        
            return view
    }

    @objc func handle(sender: UIButton) {
        let view: UIView = UIView(frame: CGRect(x: 0, y: self.view.frame.size.height - 180, width: self.view.frame.size.width, height: 120))
        view.backgroundColor = UIColor.red

        let categoryScroll = UIScrollView()
        categoryScroll.delegate = self
        categoryScroll.scrollsToTop = false
        categoryScroll.showsHorizontalScrollIndicator = true
        view.addSubview(categoryScroll)
        
        let view2: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        view2.backgroundColor = UIColor.green
        view.addSubview(view2)
        let lblName = UILabel(frame: CGRect(x: 5, y: 40, width: 50, height: 50))
        
        lblName.text = "Anil"
        view2.addSubview(lblName)
        
        self.view.addSubview(view)
    }
    @objc func swipedOnViewAction() {
        
        let yLocationTouched = swipedOnImage.location(in: self.view).y
        
        imgVIew.frame.origin.y = yLocationTouched
        
        // These values can be played around with if required.
        vc.view.frame =  CGRect(x: 0, y: yLocationTouched, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height) - (yLocationTouched))
        vc.view.frame.origin.y = yLocationTouched + 50
        
    }
    
    
    // MARK: - UIScrollViewDelegate protocol
    @objc func swiped(gesture: UISwipeGestureRecognizer)  {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
        
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped Up")
                
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped Down")
                
            default:
                break
            }
        }
    }
    
    
    // MARK: - UIScrollViewDelegate protocol
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (imgVIew.image?.size) == nil {
            homeScroll.isScrollEnabled = true
        }
    }


    // MARK: - Button Actions protocol
    @IBAction func Home(_ sender: UIButton)
    {
        let Homepresent = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
        self.present(Homepresent, animated: true, completion:nil)
    }
    
    
    @IBAction func catageory(_ sender: UIButton)
    {
        let Brands = self.storyboard?.instantiateViewController(withIdentifier:"ItemsViewController")as!ItemsViewController
        self.present(Brands, animated: true, completion:nil)
    }
    
    @IBAction func Brands(_ sender: UIButton)
    {
        let Brands = self.storyboard?.instantiateViewController(withIdentifier:"BrndsViewController")as!BrndsViewController
        self.present(Brands, animated: true, completion:nil)
    }
    @IBAction func Favourite(_ sender: UIButton)
    {
//        let Brands = self.storyboard?.instantiateViewController(withIdentifier:"ItemsViewController")as!ItemsViewController
//        self.present(Brands, animated: true, completion:nil)
    }
    @IBAction func Cart(_ sender: UIButton)
    {
       
    }
}
