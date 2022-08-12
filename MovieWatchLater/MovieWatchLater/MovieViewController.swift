//
//  MovieViewController.swift
//  MovieWatchLater
//
//  Created by ILKER on 12.08.2022.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieLinkLabel: UILabel!
    
    var movieDetails : Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieNameLabel.text = movieDetails?.movieName
        movieLinkLabel.text = movieDetails?.movieLink
        
        movieLinkLabel.isUserInteractionEnabled = true
        
        let linkGesture = UITapGestureRecognizer(target: self, action: #selector(linkOpen))
        movieLinkLabel.addGestureRecognizer(linkGesture)
        
    }
    
    @objc func linkOpen() {
        if let url = URL(string: movieDetails.movieLink) {
            UIApplication.shared.open(url)
        }
    }



}
