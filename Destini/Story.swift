//
//  Story.swift
//  Destini
//
//  Created by Victor Oka on 07/05/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Story {
    
    let index: Int
    let text: String
    let firstAnswer: String?
    let secondAnswer: String?
    
    init(storyIndex: Int, storyText: String, answerA: String?, answerB: String?) {
        index = storyIndex
        text = storyText
        firstAnswer = answerA
        secondAnswer = answerB
    }
}
