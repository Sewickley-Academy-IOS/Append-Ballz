//
//  ViewController.swift
//  AppendBallz
//
//  Created by Jason Li on 4/5/16.
//  Copyright © 2016 Jason Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ball1: BouncingBall!

    @IBOutlet weak var Player: PlayerBoard!
    
    var theGame = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        theGame = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "PlayGame", userInfo: nil, repeats: true)
        
    }
    @IBAction func Left(sender: AnyObject) {
        Player.MovePlayer(false)
    }
    @IBAction func Right(sender: AnyObject) {
        Player.MovePlayer(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func PlayGame(){
        Player.center.y = CGFloat(Player.y)
        Player.center.x = CGFloat(Player.x)
        ball1.Intersections(Player)
        ball1.BallMoves()
        Player.center.y = CGFloat(Player.y)
        Player.center.x = CGFloat(Player.x)
    }
}

