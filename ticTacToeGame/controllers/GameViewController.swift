//
//  SingleViewController.swift
//  ticTacToeGame
//
//  Created by Clement Wekesa on 02/05/2018.
//  Copyright © 2018 Clement Wekesa. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func gameButtonPressed(_ sender: UIButton) {
        print(sender.tag)
    }
 
}
