//
//  PhotoDetailViewController.swift
//  Flickr Client App
//
//  Created by Mehmet Ergün on 6.06.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Photo Detail"
        imageView.backgroundColor = .gray
        ownerImageView.backgroundColor = .darkGray
        ownerNameLabel.text = "User Name"
        descriptionLabel.text = "Description LabelDescription LabelDescription LabelDescription LabelDescription LabelDescription LabelDescription LabelDescription Label"
    }
    
}
