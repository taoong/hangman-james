//
//  HangmanViewController.swift
//  Hangman
//
//  Created by Tao Ong on 9/29/17.
//  Copyright © 2017 iOS DeCal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var phrase = HangmanPhrases().getRandomPhrase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var letters: [UIButton]!
    
    @IBAction func letterPressed(sender: UIButton) -> Void {
        var guess = sender.title
        print(guess)
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
