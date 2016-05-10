//
//  ViewController.swift
//  AppendBallz
//
//  Created by Jason Li on 4/5/16.
//  Copyright © 2016 Jason Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ToolBar: UIToolbar!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var ball1: BouncingBall!
    @IBOutlet weak var ball2: BouncingBall!
    @IBOutlet weak var ball3: BouncingBall!
    @IBOutlet weak var ball4: BouncingBall!
    @IBOutlet weak var ball5: BouncingBall!
    
    @IBOutlet weak var Player: PlayerBoard!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    var AppendBallz: [BouncingBall] = []
    
    var Score = 0
    
    var BallMoves = false
    
    
    var theGame = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ToolBar.center.y = CGRectGetMaxY(view.frame) - 50
        // Do any additional setup after loading the view, typically from a nib.
        ball1.BallMove()
        AppendBallz.append(ball1)
        AppendBallz.append(ball2)
        AppendBallz.append(ball3)
        AppendBallz.append(ball4)
        AppendBallz.append(ball5)
        for n in 0...4{
            AppendBallz[n].ResetBall(n+1)
        }
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
        for n in 0...4{
            if (AppendBallz[n].Intersections(Player)){
                Score += 1
                ScoreLabel.text = "Score: " + String(Score)
                if (Score > 9){
                    AppendBallz[1].BallMove()
                }
                if (Score > 19){
                    AppendBallz[2].BallMove()
                }
                if (Score > 29){
                    AppendBallz[3].BallMove()
                }
                if (Score > 39){
                    AppendBallz[4].BallMove()
                }
            }
            if(AppendBallz[n].BallMoves() == true){
                playAgainButton.hidden = false
                gameOverLabel.hidden = false
            }
            if(AppendBallz[n].BallMoves() == false){
                playAgainButton.hidden = true
                gameOverLabel.hidden = true
            }
        }
        var ENDGAME = true
        for num in 0...4 {
            if (AppendBallz[num].gravity != 0){
                ENDGAME = false
                break
            }
        }
        if (ENDGAME == true){
            playAgainButton.hidden = false
            gameOverLabel.hidden = false
            theGame.invalidate()

        }
        Player.center.y = CGFloat(Player.y)
        Player.center.x = CGFloat(Player.x)
    }
}

