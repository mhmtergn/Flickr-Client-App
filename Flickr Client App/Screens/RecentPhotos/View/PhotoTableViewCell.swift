//
//  PhotoTableViewCell.swift
//  Flickr Client App
//
//  Created by Mehmet Ergün on 6.06.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
// MARK: -
    
    @IBOutlet weak var ownerImageView: UIView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
// MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
