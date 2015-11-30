//
//  ViewController.swift
//  2-D Game - OOP
//
//  Created by Atef H Ataya on 11/30/15.
//  Copyright © 2015 Atef H Ataya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var printLabel: UILabel!
    
    @IBOutlet weak var playerHPLabel: UILabel!
    
    @IBOutlet weak var enemyHPLabel: UILabel!
    
    @IBOutlet weak var enemyImageView: UIImageView!
    
    @IBOutlet weak var chestButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player(name: "Dirty Laundry21", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()

        playerHPLabel.text = "\(player.hp) HP"
        
        
    }

    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attachPwr: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attachPwr: 15)
        }
        enemyImageView.hidden = false
    }

    @IBAction func onChestTapped(sender: AnyObject) {
        chestButton.hidden = true
        printLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
        
        
    }

    @IBAction func attackedTapped(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr) {
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHPLabel.text = "\(enemy.hp) HP"
            
        } else {
            printLabel.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
            
        }
        
        if !enemy.isAlive {
            enemyHPLabel.text = ""
            printLabel.text = "Killed \(enemy.type)"
            enemyImageView.hidden = true
            
        }
    }
}

