//
//  Character.swift
//  2-D Game - OOP
//
//  Created by Atef H Ataya on 11/30/15.
//  Copyright © 2015 Atef H Ataya. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100 //data hiding or encapsultation, protect the variables
    private var _attackPwr: Int = 10
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
        // we cann't use the set directly on a private variable.
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    
    init (startingHp: Int, attachPwr: Int) {
        self._hp   = startingHp
        self._attackPwr = attachPwr
    }
    
    func attemptAttack (attachPwr: Int) -> Bool {
        self._hp -= attachPwr
        
        return true
    }
}