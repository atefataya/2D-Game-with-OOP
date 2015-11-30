//
//  Player.swift
//  2-D Game - OOP
//
//  Created by Atef H Ataya on 11/30/15.
//  Copyright © 2015 Atef H Ataya. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _name: String = "Player"
    private var _inventory = [String]()

    
    var name: String {
        get {
            return _name
        }
    }
    
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    func addItemToInventory (item: String) {
        _inventory.append(item)
    }
    
    convenience init (name: String, hp: Int, attackPwr: Int){ // convenience are great for subclass
        
        self.init (startingHp: hp, attachPwr: attackPwr)
        
        _name = name
        
    }
}

