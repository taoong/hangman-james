//
//  HangmanGame.swift
//  Hangman
//
//  Created by Tao Ong on 9/29/17.
//  Copyright © 2017 iOS DeCal. All rights reserved.
//

import Foundation

class HangmanGame {
    
    var numIncorrect : Int
    var fullPhrase : String
    var currentPhrase : String
    var correctGuesses : String
    var incorrectGuesses : String
    
    init () {
        self.numIncorrect = 0
        self.fullPhrase = HangmanPhrases().getRandomPhrase()
        self.currentPhrase = ""
        self.correctGuesses = ""
        self.incorrectGuesses = ""
        fillIn()
    }
    
    func restart() -> Void {
        self.numIncorrect = 0
        self.fullPhrase = HangmanPhrases().getRandomPhrase()
        self.currentPhrase = ""
        self.correctGuesses = ""
        self.incorrectGuesses = ""
        fillIn()
    }
    
    func fillIn() -> Void {
        currentPhrase = ""
        for char in fullPhrase.characters {
            if (correctGuesses.range(of:String(char)) == nil) {
                currentPhrase += "_"
            } else {
                currentPhrase += String(char)
            }
        }
    }
    
    func guess(letter: String) -> Void {
        var correct = false
        for char in fullPhrase.characters {
            if (letter == String(char)) {
                correct = true
            }
        }
        if (!correct) {
            incorrectGuesses += letter
            numIncorrect += 1
        }
        if (correct) {
            correctGuesses += letter
        }
        fillIn()
    }
    
    func checkWin() -> Bool {
        let without_ = currentPhrase.replacingOccurrences(of: "_", with: " ")
        return without_ == fullPhrase
    }
    
    func checkLose() -> Bool {
        return numIncorrect > 5
    }
    
    func getNumIncorrect() -> Int {
        return incorrectGuesses.characters.count
    }

}
