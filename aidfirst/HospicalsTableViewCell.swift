//
//  HospicalsTableViewCell.swift
//  AidFirst
//
//  Created by Arminas on 5/31/17.
//  Copyright © 2017 Arminas. All rights reserved.
//

import UIKit

class HospicalsTableViewCell: UITableViewCell {

    @IBOutlet weak var hospitalName: UILabel!
    @IBOutlet weak var hospitalCity: UILabel!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
