//
//  userCollectionViewCell.swift
//  App_first
//
//  Created by Максим on 11.03.2021.
//

import UIKit

class userCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
    
    
    
}
