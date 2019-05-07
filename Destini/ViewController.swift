//
//  ViewController.swift
//  Destini
//
//  Created by Victor Oka on 07/05/2019.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    var story1 = Story(storyIndex: 1, storyText: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\".", answerA: "I\'ll hop in. Thanks for the help!", answerB: "Better ask him if he\'s a murderer first.")
    
    var story2 = Story(storyIndex: 2, storyText: "He nods slowly, unphased by the question.", answerA: "At least he\'s honest. I\'ll climb in.", answerB: "Wait, I know how to change a tire.")
    
    var story3 = Story(storyIndex: 3, storyText: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.", answerA: "I love Elton John! Hand him the cassette tape.", answerB: "It\'s him or me! You take the knife and stab him.")
    
    var story4 = Story(storyIndex: 4, storyText: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?", answerA: nil, answerB: nil)
    
    var story5 = Story(storyIndex: 5, storyText: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.", answerA: nil, answerB: nil)
    
    var story6 = Story(storyIndex: 6, storyText: "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\"", answerA: nil, answerB: nil)
    
    var storyIndex: Int = 1
    var currentStory: Story?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildStoryTree()
        currentStory = story1
        restart()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            currentStory = currentStory?.next(withAnswertag: 1)
        } else {
            currentStory = currentStory?.next(withAnswertag: 2)
        }
        storyTextView.text = currentStory?.text
        topButton.setTitle(currentStory?.firstAnswer, for: .normal)
        bottomButton.setTitle(currentStory?.secondAnswer, for: .normal)
        
        if currentStory?.firstAnswer == nil || currentStory?.secondAnswer == nil {
            topButton.isHidden = true
            bottomButton.isHidden = true
            restartButton.isHidden = false
        }
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        restart()
    }
    
    func restart() {
        currentStory = story1
        storyTextView.text = currentStory?.text
        topButton.setTitle(currentStory?.firstAnswer, for: .normal)
        bottomButton.setTitle(currentStory?.secondAnswer, for: .normal)
        restartButton.isHidden = true
        topButton.isHidden = false
        bottomButton.isHidden = false
    }
    
    func buildStoryTree() {
        story1.add(followingStory: story3, withAnswerTag: 1)
        story1.add(followingStory: story2, withAnswerTag: 2)
        
        story2.add(followingStory: story3, withAnswerTag: 1)
        story2.add(followingStory: story4, withAnswerTag: 2)
        
        story3.add(followingStory: story6, withAnswerTag: 1)
        story3.add(followingStory: story5, withAnswerTag: 2)
        
        // print(story1)
    }
}

