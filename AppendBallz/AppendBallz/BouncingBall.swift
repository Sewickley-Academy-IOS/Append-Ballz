//
//  BouncingBall.swift
//  AppendBallz
//
//  Created by Jason Li on 4/5/16.
//  Copyright © 2016 Jason Li. All rights reserved.
//

import UIKit

class BouncingBall: UIImageView {
    let gravity = 0.09
    var speed = 0.0
    var x = 100.0
    var y = 50.0
    
    func BallMoves(){
        speed = speed + gravity
        y += speed
        self.center.y = CGFloat(y)
        self.center.x = CGFloat(x)
        if (y > 850){
            ResetBall()
        }
    }

    func ResetBall(){
        speed = 0
        y = 50
    }
    
    func Intersections (ant: UIImageView) -> Bool{
        if (CGRectIntersectsRect(ant.frame, self.frame)){
            speed *= -1
            y -= 5
            return true
        }
        return false
    }
}
