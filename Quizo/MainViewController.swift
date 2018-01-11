//
//  MainViewController.swift
//  Quizo
//
//  Created by Ahsan Lakhani on 6/3/17.
//  Copyright © 2017 Ahsan Lakhani. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var difficultyView: UIView!
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var difficultyCenterConstraint: NSLayoutConstraint!
    
    let highlightColor=UIColor(red: 104/255, green: 147/255, blue: 61/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.decorateView(view: difficultyView)
        self.decorateView(view: easyButton)
        self.decorateView(view: hardButton)
    }
    

    @IBAction func playQuizTapped(_ sender: AnyObject) {
        self.toggleDifficultyView(constant: 0)
    }
    
    @IBAction func easyButtonTapped(_ sender: AnyObject) {
        UserDefaults.standard.set(true, forKey: "isEasy")
        self.toggleDifficultyView(constant: 500)
        self.performSegue(withIdentifier: "gotoHomeVC", sender: self)
        
    }
    
    @IBAction func hardButtonTapped(_ sender: AnyObject) {
        UserDefaults.standard.set(false, forKey: "isEasy")
        self.toggleDifficultyView(constant: 500)
        self.performSegue(withIdentifier: "gotoHomeVC", sender: self)
    }
    
    
    func decorateView(view:UIView){
        view.layer.cornerRadius=15
        view.layer.borderWidth=1.0
        view.layer.borderColor=highlightColor.cgColor
    }
    
    func toggleDifficultyView(constant:CGFloat){
        self.difficultyCenterConstraint.constant=constant
        UIView.animate(withDuration: 0.2) { 
            self.view.layoutIfNeeded()
        }
    }
}
