//
//  SecondViewController.swift
//  CatchTheZombie
//
//  Created by ILKER on 6.08.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var hScore: UILabel!
    
    let zombieImage = UIImageView()
    var timer = Timer()
    var highScore = 0
    var counter = 0
    var gameTime = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        zombieImage.frame = CGRect(x: width * 0.5, y: height * 0.5, width: width * 0.3, height: height * 0.2)
        zombieImage.image = UIImage(named: "zombie")
        view.addSubview(zombieImage)
        zombieImage.isUserInteractionEnabled = true
        
        //Image Gesture Recognizer
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(imageFunc))
        zombieImage.addGestureRecognizer(imageGesture)
        
        let storedScore = UserDefaults.standard.object(forKey: "score")
        if storedScore == nil {
            highScore = 0
            hScore.text = "HighScore: \(highScore)"
        }
        if let newScore = storedScore as? Int {
            highScore = newScore
            hScore.text = "HighScore: \(highScore)"
        }
    }
    
    @objc func timerFunc() {
        
        gameTime -= 1
        timeLabel.text = "Time: \(gameTime)"
        
        zombieImage.isUserInteractionEnabled = true
        zombieImage.isHidden = false
        
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        
        //Random picture coordinates
        let randomX = Int.random(in: 20...Int(width)-150)
        let randomY = Int.random(in: 150...Int(height)-300)
        
        zombieImage.frame = CGRect(x: randomX, y: randomY, width: Int(width * 0.3), height: Int(height * 0.2))
        
        if gameTime == 0 {
            timer.invalidate()
            
            
            
            if highScore < counter {
                highScore = counter
                hScore.text = "HighScore: \(highScore)"
                UserDefaults.standard.set(highScore, forKey: "score")
            }
            
            let alert = UIAlertController(title: "Time's Up", message: "Game Over!", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
                self.navigationController?.popToRootViewController(animated: true)
            }
            let againButton = UIAlertAction(title: "Again", style: UIAlertAction.Style.default) { UIAlertAction in
                self.gameTime = 10
                self.counter = 0
                self.timeLabel.text = "Time: \(self.gameTime)"
                self.scoreLabel.text = "Score: \(self.counter)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunc), userInfo: nil, repeats: true)
            }
            alert.addAction(okButton)
            alert.addAction(againButton)
            self.present(alert, animated: true)
        }
    }
    
    @objc func imageFunc() {
        
        zombieImage.isUserInteractionEnabled = false
        zombieImage.isHidden = true
        
        counter += 1
        scoreLabel.text = "Score: \(counter)"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewController
        destinationVC.highScore = highScore
    }

}
