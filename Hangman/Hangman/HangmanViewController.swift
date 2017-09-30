//
//  HangmanViewController.swift
//  Hangman
//
//  Created by Tao Ong on 9/29/17.
//  Copyright © 2017 iOS DeCal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    var game = HangmanGame()
    var lastButtonPressed : UIButton!
    var buttonColor : UIColor!
    
    func updateUI() {
        currentGuess.text = game.currentPhrase
        numIncorrect.text = "Incorrect Guesses: " + game.incorrectGuesses
        image.image = UIImage(named: "hangman" + String(game.getNumIncorrect() + 1))
    }
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func startOver(_ sender: Any) {
        restartGame()
    }
    @IBOutlet weak var numIncorrect: UILabel!
    @IBOutlet weak var currentGuess: UILabel!
    @IBOutlet weak var guess: UIButton!
    @IBAction func buttonTapped(_ sender: UIButton) {
        for button in letterButtons {
            if button.backgroundColor == UIColor.lightGray {
                button.backgroundColor = buttonColor
            }
        }
        sender.backgroundColor = UIColor.lightGray
        lastButtonPressed = sender
        
    }
    @IBAction func guessPressed(_ sender: UIButton) {
        if lastButtonPressed != nil {
            lastButtonPressed.backgroundColor = UIColor.red
            let letterString = lastButtonPressed.title(for: .normal)!
            game.guess(letter: letterString.uppercased())
            updateUI()
            lastButtonPressed.isEnabled = false
            lastButtonPressed = nil
        }
        if game.checkLose() {
            let alertController = UIAlertController(title: "Alert", message: "You lose!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Start Over", style: .default) { (action:UIAlertAction) in
                self.restartGame()
            }
            alertController.addAction(action1)
            
            self.present(alertController, animated: true, completion: nil)
        }
        if game.checkWin() {
            let alertController = UIAlertController(title: "Alert", message: "You win!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Start Over", style: .default) { (action:UIAlertAction) in
                self.restartGame()
            }
            alertController.addAction(action1)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    func restartGame() {
        self.game.restart()
        self.updateUI()
        for button in letterButtons {
            button.backgroundColor = buttonColor
            button.isEnabled = true
        }
        lastButtonPressed = nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonColor = letterButtons[0].backgroundColor
        updateUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
