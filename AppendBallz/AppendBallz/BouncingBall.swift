//
//  BouncingBall.swift
//  AppendBallz
//
//  Created by Jason Li on 4/5/16.
//  Copyright © 2016 Jason Li. All rights reserved.
//

import UIKit

class BouncingBall: UIImageView {
    var gravity = 0.00
    let g = 0.02
    var speed = 0.0
    var speedx = 0.0
    var x = 75.0
    var y = 50.0
    
    func BallMoves() -> Bool{
        speed = speed + gravity
        y += speed
        x += speedx
        self.center.y = CGFloat(y)
        self.center.x = CGFloat(x)
        if (x < 0 || x > 400){
            speedx *= -1
        }
        if (y > 850){
            ResetBall()
            return true
        }else{
            return false
        }
    }

    func ResetBall(){
        speed = 0
        gravity = 0
    }
    
    func ResetBall(level: Int){
        x = Double(level) * x
        y = Double(-1 * Int(arc4random_uniform(200))) - 50.000
    }
    
    func BallMove (){
        gravity = g
    }
    
    func Intersections (ant: UIImageView) -> Bool{
        if (CGRectIntersectsRect(ant.frame, self.frame)){
            speedx = -0.01 * Double(ant.center.x - self.center.x)
            print(speedx)
            speed *= -1
            y -= 5
            gravity = gravity + 0.001
            return true
        }
        return false
    }
}
