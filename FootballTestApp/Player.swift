//
//  Player.swift
//  FootballTestApp
//
//  Created by Alexandr Polukhin on 18.06.2018.
//  Copyright © 2018 Alexandr Polukhin. All rights reserved.
//

import UIKit

enum playerStatus: String {
    case general = "General"
    case forReplace = "For Replace"
    case reserve = "Reserve"
    
    func type() -> String {
        return self.rawValue
    }
    
    static func random() -> String {
        let types = [self.general, self.forReplace, self.reserve]
        let index = Int(arc4random_uniform(UInt32(types.count)))
        return types[index].type()
    }
}

class Player: NSObject {
    init(name: String, status: String) {
        self.name = name
        self.status = status
    }

    var name: String
    var status: String
}
