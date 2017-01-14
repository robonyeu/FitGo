//
//  BookingTableViewCell.swift
//  FitGo
//
//  Created by Joan Cardona on 28/11/16.
//  Copyright © 2016 JoanCardona. All rights reserved.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

    @IBOutlet weak var trainerImageView: UIImageView!
    @IBOutlet weak var trainerName: UILabel!
    @IBOutlet weak var classDate: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
