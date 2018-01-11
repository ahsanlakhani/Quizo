//
//  ResultViewController.swift
//  Quizo
//
//  Created by Ahsan Lakhani on 6/3/17.
//  Copyright © 2017 Ahsan Lakhani. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var saveButton: UIButton!
    
    let highlightColor=UIColor(red: 104/255, green: 147/255, blue: 61/255, alpha: 1.0)
    
    var correctAnswers:Int!
    var wrongAnswers:Int!
    var highScore=0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scoreView.layer.borderWidth=3
        self.scoreView.layer.borderColor=highlightColor.cgColor
        
        
        if(wrongAnswers>=correctAnswers){
            messageLabel.text="Oops! You failed the quiz"
        }
        else{
            messageLabel.text="Congratulations! You passed the quiz"
        }
        
        highScore=self.correctAnswers*10
        pointsLabel.text=String(highScore)
 
    }

    @IBAction func saveScoreTapped(_ sender: Any) {
        self.bottomConstraint.constant=240
        UIView.animate(withDuration: 0.2) { 
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        if(nameTextField.text!.isEmpty){
            let alert=UIAlertController(title: "Error", message: "Please fill all the fields", preferredStyle: UIAlertControllerStyle.alert)
            let okAction=UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            })
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            
            let player=Player(name: nameTextField.text!, highScore: highScore)
            self.savePlayer(player: player)
            self.bottomConstraint.constant = -500
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
            
            saveButton.isHidden=true

        }
    }
    
  
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    

}

extension UIViewController{
    
    func savePlayer(player:Player){
        var playersArray = loadPlayers()
        playersArray.append(player)
        let playersData = NSKeyedArchiver.archivedData(withRootObject: playersArray)
        UserDefaults.standard.set(playersData, forKey: "players")
    }
    
    func loadPlayers()->[Player]{
        let playersData = UserDefaults.standard.object(forKey: "players") as? NSData
        
        if let playersData = playersData {
            let playersArray = NSKeyedUnarchiver.unarchiveObject(with: playersData as Data) as? [Player]
            
            if let playersArray = playersArray {
                return playersArray
            }
            
        }
        return []
    }
} 


