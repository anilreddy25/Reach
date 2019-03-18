//
//  LanguageTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 26/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    @IBOutlet weak var Langagelabael: UILabel!
    
    @IBOutlet weak var LAngageviewone: UIView!
    
    @IBOutlet weak var langaeviewtwo: UIView!
    
    @IBOutlet weak var imagefinal: UIImageView!
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }

}
