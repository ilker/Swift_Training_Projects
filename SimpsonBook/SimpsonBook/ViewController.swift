//
//  ViewController.swift
//  SimpsonBook
//
//  Created by ILKER on 11.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{


    @IBOutlet weak var tableView: UITableView!
    
    var simpsonArray = [Simpson]()
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.delegate = self
        tableView.dataSource = self
        
        //Simpson Object
        let homer = Simpson(simpsonName: "Homer Simpson", simpsonGender: "Male", simpsonImage: UIImage(named: "Homer_Simpson")!)
        let bart = Simpson(simpsonName: "Bart Simpson", simpsonGender: "Male", simpsonImage: UIImage(named: "Bart_Simpson")!)
        let marge = Simpson(simpsonName: "Marge Simpson", simpsonGender: "Female", simpsonImage: UIImage(named: "Marge_Simpson")!)

        simpsonArray.append(homer)
        simpsonArray.append(bart)
        simpsonArray.append(marge)
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsonArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonArray[indexPath.row]
        
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedSimpson = chosenSimpson
        }
    }

}


