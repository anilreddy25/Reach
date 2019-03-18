//
//  MembershipTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 18/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class MembershipTableViewCell: UITableViewCell
{
    @IBOutlet weak var membershipdate: UILabel!
    @IBOutlet weak var mebershipname: UILabel!
    @IBOutlet weak var membershipnametwo: UILabel!
    @IBOutlet weak var membershipdtatetwo: UILabel!
    @IBOutlet weak var mymbershipviewfinalview: UIView!
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
