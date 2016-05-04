//
//  ViewController.swift
//  AppendBallz
//
//  Created by Jason Li on 4/5/16.
//  Copyright © 2016 Jason Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var ball1: BouncingBall!

    @IBOutlet weak var Player: PlayerBoard!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    var Score = 0
    
    var BallMoves = false
    
    var theGame = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        theGame = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "PlayGame", userInfo: nil, repeats: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position :CGPoint = touch.locationInView(view)
            print(position.x)
            print(position.y)
            Player.x = Double(position.x)
        }
    }

    
    func PlayGame(){
        
        Player.center.y = CGFloat(Player.y)
        Player.center.x = CGFloat(Player.x)
        if (ball1.Intersections(Player)){
            Score += 1
            ScoreLabel.text = "Score: " + String(Score)
        }
        if(ball1.BallMoves() == true){
            playAgainButton.hidden = false
            gameOverLabel.hidden = false
        }
        if(ball1.BallMoves() == false){
            playAgainButton.hidden = true
            gameOverLabel.hidden = true
        }
        Player.center.y = CGFloat(Player.y)
        Player.center.x = CGFloat(Player.x)
    }
}

