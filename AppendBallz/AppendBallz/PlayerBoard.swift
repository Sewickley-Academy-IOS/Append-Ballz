//
//  PlayerBoard.swift
//  AppendBallz
//
//  Created by Jason Li on 4/7/16.
//  Copyright © 2016 Jason Li. All rights reserved.
//

import UIKit

class PlayerBoard: UIImageView {
    var x = 100.0
    var y = 350.0
    func MovePlayer(right: Bool){
        if (right){
            x += 5
        }else{
            x -= 5
        }
        self.center.y = CGFloat(y)
        self.center.x = CGFloat(x)
    }
}