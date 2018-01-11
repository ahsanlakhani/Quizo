//
//  HomeViewController.swift
//  Quizo
//
//  Created by Ahsan Lakhani on 5/5/17.
//  Copyright © 2017 Ahsan Lakhani. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellIdentifier = "cell"
    let quizVCSegueIdentifier = "gotoQuizVC"
    
    var selectedCategory:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier==quizVCSegueIdentifier){
            print(self.selectedCategory)
            let destNC=segue.destination as! UINavigationController
            let destVC=destNC.topViewController as! QuizViewController
            destVC.selectedCategory=self.selectedCategory
        }
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        
    }
}


extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return QuestionBank.bank.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CategoryCollectionViewCell
        
        let categoryTitle=Array(QuestionBank.bank.keys)[indexPath.item]
        
        cell.categoryTitleLabel.text=categoryTitle
        cell.categoryImageView.image=UIImage(named: categoryTitle)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCategory=Array(QuestionBank.bank.keys)[indexPath.item]
        self.performSegue(withIdentifier: quizVCSegueIdentifier, sender: self)
    }
    
}
