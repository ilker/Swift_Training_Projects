//
//  ViewController.swift
//  ToDoList
//
//  Created by ILKER on 9.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var toDoText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var toDoTitle = [String]()
    var toDo = [String]()
    
    var chosenTitle = ""
    var chosenToDo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        toDoTitle.append("Test")
        toDoTitle.append("Test Test")
        
        toDo.append("This is only test!")
        toDo.append("This is only test!")
        
        
    }

    @IBAction func saveButton(_ sender: Any) {
        if titleText.text != "" && toDoText.text != "" {
            toDoTitle.append(titleText.text!)
            toDo.append(toDoText.text!)
            
            tableView.reloadData()
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Please fill in the required fields.", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoTitle.remove(at: indexPath.row)
            toDo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = toDoTitle[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoTitle.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenTitle = toDoTitle[indexPath.row]
        chosenToDo = toDo[indexPath.row]
        
        performSegue(withIdentifier: "toDoVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDoVC" {
            let destinationVC = segue.destination as! ToDoViewController
            destinationVC.getTitle = chosenTitle
            destinationVC.getToDo = chosenToDo
        }
    }
}

