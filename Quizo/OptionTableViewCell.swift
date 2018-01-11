//
//  OptionTableViewCell.swift
//  Quizo
//
//  Created by Ahsan Lakhani on 5/5/17.
//  Copyright © 2017 Ahsan Lakhani. All rights reserved.
//

import UIKit

class OptionTableViewCell: UITableViewCell {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var optionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
