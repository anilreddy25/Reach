//
//  WeekDayCell.swift
//  AgentRestocks
//
//  Created by apple on 9/21/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class WeekDayCell: UITableViewCell {

    @IBOutlet weak var lblDays: UILabel!
    
    
    @IBOutlet weak var businessHoursLbl: UILabel!
    
    @IBOutlet weak var lblStrtOne: UILabel!
    
    @IBOutlet weak var lblEndOne: UILabel!
    
    @IBOutlet weak var lblStrt2: UILabel!
    
    @IBOutlet weak var lblEnd2: UILabel!
    
    @IBOutlet weak var lblStrt3: UILabel!
    
    @IBOutlet weak var lblEnd3: UILabel!
    
    @IBOutlet weak var lblStrt4: UILabel!
    
    @IBOutlet weak var lblEnd4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
