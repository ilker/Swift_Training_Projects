//
//  SecondViewController.swift
//  BasicLogin
//
//  Created by ILKER on 7.08.2022.
//

import UIKit

class SecondViewController: UIViewController {

    var welcome = ""
    
    @IBOutlet weak var welcomeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeText.text = "\(welcome), Welcome!"
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
