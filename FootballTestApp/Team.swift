//
//  Team.swift
//  FootballTestApp
//
//  Created by Alexandr Polukhin on 18.06.2018.
//  Copyright © 2018 Alexandr Polukhin. All rights reserved.
//

import UIKit

class Team: NSObject {
    
    init(name: String) {
        self.name = name
    }
    var name: String
    var players = [Player]()
}
