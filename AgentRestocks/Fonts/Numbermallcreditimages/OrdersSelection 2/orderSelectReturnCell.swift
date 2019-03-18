//
//  orderSelectReturnCell.swift
//  AgentRestocks
//
//  Created by apple on 12/20/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

protocol orderSelectReturnCellDelegate : class {
    func didPressButton(cell: orderSelectReturnCell)
}



class orderSelectReturnCell: UITableViewCell {

    @IBOutlet weak var btnOrderSelectReturnAct: UIButton!
    
    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var lblSelectQnty: UILabel!
    
    @IBOutlet weak var imgFree: UIImageView!
    
    @IBOutlet weak var lblFreebie: UILabel!
    
    @IBOutlet weak var lblApplied: UILabel!
    
    @IBOutlet weak var lblPriceOfOrder: UILabel!
    
    weak var cellDelegate: orderSelectReturnCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cellDelegate = nil
    }
    
    // connect the button from your cell with this method
    @IBAction func buttonPressed(sender: UIButton) {
        self.cellDelegate?.didPressButton(cell: self)
    }

}
