//
//  ViewController.swift
//  BasicLogin
//
//  Created by ILKER on 7.08.2022.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var rememberSwitch: UISwitch!
    
    let username = "admin"
    let password = "123456"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedUsername = UserDefaults.standard.object(forKey: "username")
        let storedPassword = UserDefaults.standard.object(forKey: "password")
        let storedRemember = UserDefaults.standard.object(forKey: "remember")
        
        if storedUsername is String && storedPassword is String{
            usernameText.text = String(username)
            passwordText.text = String(password)
        }
        if storedRemember is Bool {
            rememberSwitch.isOn = true
        }
    }

    @IBAction func loginButton(_ sender: Any) {
        if usernameText.text == username && passwordText.text == password {
            if rememberSwitch.isOn == true {
                UserDefaults.standard.set(usernameText.text, forKey: "username")
                UserDefaults.standard.set(passwordText.text, forKey: "password")
                UserDefaults.standard.set(rememberSwitch.isOn, forKey: "remember")
                
                performSegue(withIdentifier: "toSecondVC", sender: nil)
            }
            else {
                UserDefaults.standard.removeObject(forKey: "username")
                UserDefaults.standard.removeObject(forKey: "password")
                UserDefaults.standard.removeObject(forKey: "remember")

                performSegue(withIdentifier: "toSecondVC", sender: nil)
            }
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Wrong password or username!", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
                self.usernameText.text = ""
                self.passwordText.text = ""
            }
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.welcome = username
        }
    }
    
}

