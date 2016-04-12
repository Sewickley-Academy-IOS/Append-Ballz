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
    
    @IBOutlet var panRecognizer: UIPanGestureRecognizer!
    @IBOutlet weak var paddle: UIImageView!

    @IBOutlet weak var Board: UIImageView!
    
    var theGame = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        theGame = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "PlayGame", userInfo: nil, repeats: true)
        
        
        
    }

    @IBAction func handlePan(sender: AnyObject) {
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func PlayGame(){
        ball1.Intersections(Board)
        ball1.BallMoves()
        ball1.center.y = CGFloat(ball1.y)
    }

}

