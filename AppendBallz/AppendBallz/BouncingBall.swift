//
//  BouncingBall.swift
//  AppendBallz
//
//  Created by Jason Li on 4/5/16.
//  Copyright © 2016 Jason Li. All rights reserved.
//

import UIKit

class BouncingBall: UIImageView {
    let gravity = 0.1
    var speed = 0.0
    var x = 100.0
    var y = 50.0
    
    func BallMoves(){
        speed = speed + gravity
        y += speed
    }

    func Intersections (ant: UIImageView){
        if (CGRectIntersectsRect(ant.frame, self.frame)){
            speed *= -1
            y -= 5
        }
    }
}
