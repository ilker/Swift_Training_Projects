//
//  DetailsViewController.swift
//  SimpsonBook
//
//  Created by ILKER on 11.08.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    var selectedSimpson : Simpson?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedSimpson?.name
        gender.text = selectedSimpson?.gender
        imageView.image = selectedSimpson?.image
        
    }
    

    

}
