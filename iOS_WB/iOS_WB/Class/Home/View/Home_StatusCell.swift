//
//  Home_StatusCell.swift
//  iOS_WB
//
//  Created by Alpha on 18/08/2017.
//  Copyright © 2017 STT. All rights reserved.
//

import UIKit

class Home_StatusCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var enterPrise: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var vipImage: UIImageView!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var status : WB_Status?{
        didSet{
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
