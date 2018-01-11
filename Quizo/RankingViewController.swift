//
//  RankingViewController.swift
//  Quizo
//
//  Created by Ahsan Lakhani on 6/3/17.
//  Copyright © 2017 Ahsan Lakhani. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    
    var players:[Player]=[]

    override func viewDidLoad() {
        super.viewDidLoad()

        print(self.loadPlayers().count)
        players=self.loadPlayers().sorted(by: { $0.highScore > $1.highScore })
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}


extension RankingViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RankingTableViewCell
        
        let player=self.players[indexPath.row]
        
        cell.rankLabel.text=String(indexPath.row+1)
        cell.nameLabel.text=player.name
        cell.scoreLabel.text=String(player.highScore)
        
        return cell
        
    }
    
}



