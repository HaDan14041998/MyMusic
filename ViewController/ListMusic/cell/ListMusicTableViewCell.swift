//
//  ListMusicTableViewCell.swift
//  MyMusic
//
//  Created by Dan on 6/3/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class ListMusicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameSong: UILabel!
    @IBOutlet weak var singer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
