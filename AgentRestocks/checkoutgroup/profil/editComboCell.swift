//
//  editComboCell.swift
//  AgentRestocks
//
//  Created by apple on 1/21/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class editComboCell: UITableViewCell {

    
    @IBOutlet weak var marketingtopview: UIView!
    @IBOutlet weak var mycardviewfinal: UIView!
    
    @IBOutlet weak var circleimageview: UIImageView!
   
    var chacalateiamge = [UIImage]()
    
    var Plusmarket_image = [UIImage]()
    
    @IBOutlet weak var mymarketcollectionview: UICollectionView!
    
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
    
    @IBOutlet weak var lblCommentCOunt: UILabel!
    
    @IBOutlet weak var lblShoutCount: UILabel!
    
    @IBOutlet weak var lblLikedCounts: UILabel!
    
    @IBOutlet weak var lblSharedCount: UILabel!
    
    @IBOutlet weak var lblSavedCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        chacalateiamge = [UIImage(named:"Britannia.png"),UIImage(named:"Lays.png"),UIImage(named:"agentmarketthree.png"),UIImage(named:"Britannia.png")] as! [UIImage]
        
        Plusmarket_image = [UIImage(named:"Marketadd.png"),UIImage(named:"Marketadd.png"),UIImage(named:"Marketadd.png"),UIImage(named:"Marketadd.png")] as! [UIImage]
        mymarketcollectionview.delegate = self
        mymarketcollectionview.dataSource = self
        
        mymarketcollectionview.showsHorizontalScrollIndicator = false
        mymarketcollectionview.showsVerticalScrollIndicator = false
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension editComboCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chacalateiamge.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "editComboCollectCell", for: indexPath) as! editComboCollectCell
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

