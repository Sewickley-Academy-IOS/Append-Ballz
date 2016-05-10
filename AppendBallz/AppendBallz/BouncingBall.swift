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
    var speedY = 0.0
    var speedX = 0.1
    var x = 100.0
    var y = 50.0
    var horizontal = 0
    
    func BallMoves(){
        
        speedY = speedY + gravity
        y += speedY
        self.center.y = CGFloat(y)
        self.center.x += CGFloat(arc4random_uniform(6)) + 1
            if (y > 850){
            ResetBall()
        }
    }

    func ResetBall(){
        speedY = 0
        y = 50
    }
    
    func Intersections (ball: UIImageView) -> Bool{
        if (CGRectIntersectsRect(ball.frame, self.frame)){
            speedY *= -1
            y -= 5
            return true
        }
        return false
    }
}
