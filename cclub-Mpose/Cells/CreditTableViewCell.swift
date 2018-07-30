//
//  CreditTableViewCell.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/28/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class CreditTableViewCell: UITableViewCell {

    @IBOutlet var creditName: UILabel!
    
    @IBOutlet var creditAmount: UILabel!
    
    @IBOutlet var payAmount: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
