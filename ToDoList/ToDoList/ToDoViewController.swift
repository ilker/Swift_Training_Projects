//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by ILKER on 10.08.2022.
//

import UIKit

class ToDoViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var toDoText: UITextView!
    
    var getTitle = ""
    var getToDo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = getTitle
        toDoText.text = getToDo
    }
    

}
