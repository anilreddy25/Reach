//
//  CartCell.swift
//  AgentRestocks
//
//  Created by apple on 8/31/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

protocol SwipeableTableViewCellDelegate : NSObjectProtocol {
    func swipeableTableViewCellDidRecognizeSwipe(cell : CartCell)
    func swipeableTableViewCellDidTapLeftButton(cell : CartCell)
    func swipeableTableViewCellDidTapRightButton(cell : CartCell)
}


class CartCell: UITableViewCell {
    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var sellPrice: UILabel!
    @IBOutlet weak var lblInStock: UILabel!
    @IBOutlet weak var lblSeller: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var editCart: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    

}
