//
//  ViewController.swift
//  CatchTheZombie
//
//  Created by ILKER on 5.08.2022.
//

import UIKit

class ViewController: UIViewController {

    var highScore = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "toGameVC", sender: nil)
    }
    
}

