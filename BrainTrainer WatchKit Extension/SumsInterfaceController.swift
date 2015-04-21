//
//  SumsInterfaceController.swift
//  BrainTrainer
//
//  Created by Rommel Rico on 4/21/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

import WatchKit
import Foundation


class SumsInterfaceController: WKInterfaceController {

    @IBOutlet weak var resultsLabel: WKInterfaceLabel!
    @IBOutlet weak var timer: WKInterfaceTimer!
    @IBOutlet weak var sumLabel: WKInterfaceLabel!
    var firstOperand:Int = 0 //First operand
    var secondOperand:Int = 0 //Second operand
    var answer:Int = 0 //Answer
    var sumCharacter = "" //+,-,x, or ÷
    
    
    @IBOutlet weak var answer1Label: WKInterfaceButton!
    @IBAction func answer1() {
        //TODO
    }
    
    @IBOutlet weak var answer2Label: WKInterfaceButton!
    @IBAction func answer2() {
        //TODO
    }
    
    
    @IBOutlet weak var answer3Label: WKInterfaceButton!
    @IBAction func answer3() {
        //TODO
    }
    
    
    @IBOutlet weak var answer4Label: WKInterfaceButton!
    @IBAction func answer4() {
        //TODO
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        if let type = context as? String {
            startQuiz(type)
        } else {
            pushControllerWithName("InterfaceController", context: nil)
        }
    }
    
    func startQuiz(type:String) {
        timer.setDate(NSDate(timeIntervalSinceNow: 30))
        var countdown = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: Selector("quizComplete"), userInfo: nil, repeats: false)
        timer.start()
        if type == "plus" {
            firstOperand = Int(arc4random_uniform(11))
            secondOperand = Int(arc4random_uniform(11))
            answer = firstOperand + secondOperand
            sumCharacter = "+"
        } else if type == "minus" {
            firstOperand = Int(arc4random_uniform(11))
            secondOperand = Int(arc4random_uniform(11))
            answer = firstOperand - secondOperand
            sumCharacter = "-"
        } else if type == "multiply" {
            firstOperand = Int(arc4random_uniform(11))
            secondOperand = Int(arc4random_uniform(11))
            answer = firstOperand * secondOperand
            sumCharacter = "x"
        } else if type == "divide" {
            firstOperand = Int(arc4random_uniform(11))
            secondOperand = Int(arc4random_uniform(11))
            if secondOperand == 0 {
                //Cannot divide by 0
                secondOperand = 1
            }
            answer = firstOperand / secondOperand
            sumCharacter = "÷"
        }
        sumLabel.setText("\(firstOperand) \(sumCharacter) \(secondOperand) =")
    }
    
    func quizComplete() {
        println("Done!")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
