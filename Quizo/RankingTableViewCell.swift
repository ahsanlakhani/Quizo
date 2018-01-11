//
//  RankingTableViewCell.swift
//  Quizo
//
//  Created by Ahsan Lakhani on 6/3/17.
//  Copyright © 2017 Ahsan Lakhani. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
