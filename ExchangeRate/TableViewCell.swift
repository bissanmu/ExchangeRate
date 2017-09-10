//
//  TableViewCell.swift
//  ExchangeRate
//
//  Created by admin on 2017. 9. 10..
//  Copyright © 2017년 admin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cur_cd: UILabel!
    @IBOutlet weak var cur_nm: UILabel!
    @IBOutlet weak var deal_vas_r: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
