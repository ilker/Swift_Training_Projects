//
//  ViewController.swift
//  MovieWatchLater
//
//  Created by ILKER on 12.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var movieName: UITextField!
    @IBOutlet weak var movieLink: UITextField!
    @IBOutlet weak var movieTableView: UITableView!
    
    var movieDetails = [Movie]()
    var chosenMovie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        movieDetails.append(Movie(name: "Catch Me If You Can", link: "https://www.imdb.com/title/tt0264464/"))
        movieDetails.append(Movie(name: "Doctor Strange", link: "https://www.imdb.com/title/tt1211837/?ref_=tt_sims_tt_i_2"))
        
        
        
    }

    
    @IBAction func addButton(_ sender: Any) {
    
        if movieName.text != "" && movieLink.text != "" {
            movieDetails.append(Movie(name: movieName.text!, link: movieLink.text!))
            movieTableView.reloadData()
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Some fields are left blank.", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movieDetails.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = movieDetails[indexPath.row].movieName
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDetails.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenMovie = movieDetails[indexPath.row]
        
        performSegue(withIdentifier: "toMovieVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovieVC" {
            let destinationVC = segue.destination as! MovieViewController
            destinationVC.movieDetails = chosenMovie
        }
    }
}

