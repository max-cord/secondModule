//
//  groupTableViewCell.swift
//  App_first
//
//  Created by Максим on 11.03.2021.
//

import UIKit

class groupTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImage!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
    
}
