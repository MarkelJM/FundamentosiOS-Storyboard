//
//  TableCell.swift
//  probandoKC-13-12
//
//  Created by Markel Juaristi on 13/12/22.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var tableImage: UIImageView!
    @IBOutlet weak var tableLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
