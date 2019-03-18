//
//  MArketTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 21/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class MArketTableViewCell: UITableViewCell
{
    @IBOutlet weak var marketingtopview: UIView!
    @IBOutlet weak var mycardviewfinal: UIView!
    
    @IBOutlet weak var circleimageview: UIImageView!
    @IBOutlet weak var mylightbutton: UIButton!
    
    var chacalateiamge = [UIImage]()

    var Plusmarket_image = [UIImage]()

    @IBOutlet weak var mymarketcollectionview: UICollectionView!
    
    @IBOutlet weak var shoutedname: UILabel!
    
    @IBOutlet weak var raajagoudnamefinal: UILabel!
    
    @IBOutlet weak var exlentproduct: UILabel!
    @IBOutlet weak var exlenttime: UILabel!
    @IBOutlet weak var topdropdown: UIButton!
    
    @IBOutlet weak var save: UILabel!
    @IBOutlet weak var saverupesslabel: UILabel!
    
    
    @IBOutlet weak var comboofferview: UIView!
    @IBOutlet weak var comboofferviewone: UIView!
    
    @IBOutlet weak var comboofferviewtwo: UIView!
    
    
    @IBOutlet weak var popcornname: UILabel!
    
    
    @IBOutlet weak var popcornrupeeslabel: UILabel!
    @IBOutlet weak var moqrupeeslabel: UILabel!
    @IBOutlet weak var popcornlabel: UILabel!
    
    @IBOutlet weak var chatone: UIButton!
    
    @IBOutlet weak var shouone: UIButton!
    
    @IBOutlet weak var likeone: UIButton!
    @IBOutlet weak var shareone: UIButton!
    
    @IBOutlet weak var Downone: UIButton!
    
    
    
    @IBOutlet weak var marketcardviewtwo: UIView!
    
    
    @IBOutlet weak var cardviewtwotop: UIView!
    
    @IBOutlet weak var cardviewpopcornlabel: UILabel!
    
    
    @IBOutlet weak var imagecardviewfinal: UIView!
    
    
    @IBOutlet weak var popcornimage: UIImageView!
    
    
    @IBOutlet weak var popcornrupess: UILabel!
    
    @IBOutlet weak var popcorncutoffratinglabel: UILabel!
    
    
    @IBOutlet weak var marginlabel: UILabel!
    
    @IBOutlet weak var Timerlabel: UILabel!
    
    
    @IBOutlet weak var sevendayscardview: UIView!
    
    
    @IBOutlet weak var mypopcornimagelabel: UIImageView!
    
    @IBOutlet weak var mypopocrndayslabel: UILabel!
    
    
    @IBOutlet weak var restocklabel: UILabel!
    
    @IBOutlet weak var Timerview: UIView!
  
    @IBOutlet weak var mymarginlabel: UILabel!
    @IBOutlet weak var mypopcornmarginlabel: UILabel!
    
    @IBOutlet weak var moqlabel: UILabel!
    @IBOutlet weak var mypopcornnmae: UILabel!
    @IBOutlet weak var myrupeeslabel: UILabel!
    
    
    @IBOutlet weak var myexculsive: UIImageView!
    
    @IBOutlet weak var mygifttotal: UIImageView!
  
    @IBOutlet weak var mypopcornrupeeslabel: UILabel!
    
    @IBOutlet weak var likelabeltotal: UILabel!
    
    @IBOutlet weak var shoutlabel: UILabel!
    
    @IBOutlet weak var chatlabel: UILabel!
    
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        chacalateiamge = [UIImage(named:"Britannia.png"),UIImage(named:"Lays.png"),UIImage(named:"agentmarketthree.png"),UIImage(named:"Britannia.png")] as! [UIImage]
        
        Plusmarket_image = [UIImage(named:"Marketadd.png"),UIImage(named:"Marketadd.png"),UIImage(named:"Marketadd.png"),UIImage(named:"Marketadd.png")] as! [UIImage]
        mymarketcollectionview.delegate = self
        mymarketcollectionview.dataSource = self
        
        mymarketcollectionview.showsHorizontalScrollIndicator = false
        mymarketcollectionview.showsVerticalScrollIndicator = false
        
    }
    @IBOutlet weak var mymarketcollec: UICollectionView!
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
    extension MArketTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource
    {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
        {
            return chacalateiamge.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "marketCollectionViewCell", for: indexPath) as! marketCollectionViewCell
            cell.marketiamge.image = self.chacalateiamge[indexPath.row] as? UIImage
            cell.marketplustow.image = self.Plusmarket_image[indexPath.row] as? UIImage
            cell.marketiamge.layer.cornerRadius = cell.marketiamge.layer.frame.size.width/2
            cell.marketiamge.layer.masksToBounds = true
            return cell
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
        {
            let clickedIndex = self.chacalateiamge[indexPath.row]
            print(clickedIndex)
            let MarketViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"HomeViewController") as! HomeViewController
        }
}
