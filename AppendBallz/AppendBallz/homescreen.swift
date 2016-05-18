//
//  homescreen.swift
//  AppendBallz
//
//  Created by Jason Li on 5/18/16.
//  Copyright © 2016 Jason Li. All rights reserved.
//

import UIKit

class homescreen: UIViewController {
    @IBOutlet weak var homeImage: UIImageView!
    
    override func viewDidLoad() {
        homeImage.frame.size.width = self.view.frame.width
        homeImage.frame.size.height = self.view.frame.height
        
    }
}
