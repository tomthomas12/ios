//
//  dataTableViewCell.swift
//  frist
//
//  Created by ARM 097 on 10/10/22.
//

import UIKit

class dataTableViewCell: UITableViewCell {

    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
