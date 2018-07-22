//
//  SingleViewController.swift
//  ticTacToeGame
//
//  Created by Clement Wekesa on 02/05/2018.
//  Copyright © 2018 Clement Wekesa. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var currentPlayer = 1
    var buttonState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var played:[Int: [Int]] = [1: [], 2: []]
    var roundCount = 0
    
    let winningCombo = [Set([1,2,3]), Set([4,5,6]), Set([7,8,9]), Set([1,4,7]), Set([2,5,8]), Set([3,6,9]), Set([1,5,9]), Set([3,5,7])]
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        setupButton()
    }
    
    @IBAction func gameButtonPressed(_ sender: UIButton) {
        if buttonState[sender.tag - 1] == 0 {
            roundCount += 1
            buttonState[sender.tag - 1] = currentPlayer
            played[currentPlayer]?.append(sender.tag)
            print(played)
            if currentPlayer == 1 {
                sender.setImage(UIImage(named: "x"), for: UIControlState())
                checkGameStatus(player: currentPlayer)
                currentPlayer = 2
            } else if currentPlayer == 2 {
                sender.setImage(UIImage(named: "o"), for: UIControlState())
                checkGameStatus(player: currentPlayer)
                currentPlayer = 1            }
        }
    }
    
    // MARK: Setup the project ui
    func setupButton() {
        button1.setImage(nil, for: UIControlState())
        button2.setImage(nil, for: UIControlState())
        button3.setImage(nil, for: UIControlState())
        button4.setImage(nil, for: UIControlState())
        button5.setImage(nil, for: UIControlState())
        button6.setImage(nil, for: UIControlState())
        button7.setImage(nil, for: UIControlState())
        button8.setImage(nil, for: UIControlState())
        button9.setImage(nil, for: UIControlState())
    }
    
    // MARK: Game logic
    func checkGameStatus(player: Int) {
        let playedSet = Set(played[player] ?? [0])
        
        for win in winningCombo {
            if win.isSubset(of: playedSet) {
                // Yay you win
                showStatus(title: "CONGRATULATION", message: "You have won the game")
            } else if roundCount == 8 {
                showStatus(title: "No win", message: "Try again")
            }
        }
    }
    
    func showStatus(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (alert) in
            self.reset()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func reset() {
        setupButton()
        buttonState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        currentPlayer = 1
        roundCount = 0
        played = [1: [], 2: []]
    }
}
