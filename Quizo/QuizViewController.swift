//
//  QuizViewController.swift
//  Quizo
//
//  Created by Ahsan Lakhani on 5/5/17.
//  Copyright © 2017 Ahsan Lakhani. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressTrailingConstraint: NSLayoutConstraint!
    
    var player: AVAudioPlayer?
    
    let cellIdentifier = "cell"
    
    let highlightColor=UIColor(red: 104/255, green: 147/255, blue: 61/255, alpha: 1.0)
    
    var duration:Float=5.0
    var elapsedTime:Float=0.0
    
    var timer:Timer!
    
    var selectedCategory:String!
    
    var questions:[Question]=[]
    
    var questionIndex=0
    
    var selectedAnswerIndex:Int!
    
    var correctAnswers=0
    var wrongAnswers=0
    
    var hasMoved=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.decorateButtons()
        
        print(self.selectedCategory)
        if(UserDefaults.standard.bool(forKey: "isEasy")){
            self.questions=QuestionBank.bank[self.selectedCategory]!["Easy"]!
        }
        else{
            self.questions=QuestionBank.bank[self.selectedCategory]!["Hard"]!
        }
        
        self.questionLabel.text=self.questions[questionIndex].question
        self.setTimer()
        
        
        
        self.progressTrailingConstraint.constant=self.view.frame.size.width
        self.view.layoutIfNeeded()
        
    }
    

    override func viewDidLayoutSubviews() {
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.animateBar()
        
    }
    
    @IBAction func skipButtonTapped(_ sender: Any) {
        timer.invalidate()
        self.changeQuestion()
        self.setTimer()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        timer.invalidate()
        
        
        self.checkAnswer()
        self.changeQuestion()
        self.setTimer()
    }
    
    
    
    @IBAction func crossButtonTapped(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    func decorateButtons(){
        skipButton.layer.cornerRadius=20
        skipButton.layer.borderWidth=1
        skipButton.layer.borderColor=highlightColor.cgColor
        
        nextButton.layer.cornerRadius=20
    }
   
    func setTimer(){
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(duration), target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="gotoResultsVC"){
            self.hasMoved=true
            let destVC=segue.destination as? ResultViewController
            destVC?.correctAnswers=correctAnswers
            destVC?.wrongAnswers=wrongAnswers
        }
    }
    

}


extension QuizViewController:UITableViewDelegate,UITableViewDataSource{


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let question=self.questions[questionIndex]
        return question.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! OptionTableViewCell
        cell.innerView.layer.cornerRadius=cell.innerView.frame.size.height/2
        cell.innerView.layer.borderColor=highlightColor.cgColor
        cell.innerView.layer.borderWidth=1.0
        cell.innerView.backgroundColor=UIColor.white
        cell.optionLabel.textColor=highlightColor
        
        let question=self.questions[questionIndex]
        let option=question.options[indexPath.row]
        cell.optionLabel.text=option
        
        
        return cell
    }
   
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell=tableView.cellForRow(at: indexPath) as! OptionTableViewCell
        cell.innerView.backgroundColor=highlightColor
        cell.optionLabel.textColor=UIColor.white
        
        self.selectedAnswerIndex=indexPath.row
        self.nextButton.isEnabled=true
        self.nextButton.backgroundColor=highlightColor
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell=tableView.cellForRow(at: indexPath) as! OptionTableViewCell
        cell.innerView.backgroundColor=UIColor.white
        cell.optionLabel.textColor=highlightColor
    }
    

}


extension QuizViewController{
    
    func updateProgress(){
        print(#function)
        self.changeQuestion()
        
        //self.navigationController?.showSGProgress(withDuration: duration, andTintColor: UIColor.white)
        
        
        
//        self.elapsedTime+=0.1
//        
//        if(self.elapsedTime>self.duration){
//            self.navigationController?.cancelSGProgress()
//            print("Timeout")
//            self.elapsedTime=0.0
//            self.changeQuestion()
//            self.navigationController?.showSGProgress(withDuration: duration, andTintColor: UIColor.white)
//        }
        
    }
    
    func changeQuestion(){
        
        if(questionIndex>=questions.count-1){
            timer.invalidate()
            timer=nil
            if(!hasMoved){
                performSegue(withIdentifier: "gotoResultsVC", sender: self)
            }
            return
        }
        
        questionIndex+=1
        questionLabel.text=questions[self.questionIndex].question
        self.tableView.reloadData()
        self.nextButton.isEnabled=false
        self.nextButton.backgroundColor=UIColor.lightGray
        
        self.animateBar()
        
    }
    
    func animateBar(){
        
        UIView.animate(withDuration: TimeInterval(duration-1), animations: {
            self.progressBar.frame.size.width=self.view.frame.size.width})
            { (bool) in
            self.progressBar.frame.size.width=0
            //self.progressTrailingConstraint.constant=self.view.frame.size.width
            //self.view.layoutIfNeeded()
        }
    
    }
    
    
    func checkAnswer(){
        if(self.questions[questionIndex].answer==self.questions[questionIndex].options[self.selectedAnswerIndex]){
            print("Correct answer")
            self.playSound(file: "Correct")
            correctAnswers+=1
        }
        else{
            print("Wrong answer")
            self.playSound(file: "Wrong")
            wrongAnswers+=1
        }
    }
    
    
    func playSound(file:String) {
        guard let url = Bundle.main.url(forResource: file, withExtension: "mp3") else {
            print("error")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
}


