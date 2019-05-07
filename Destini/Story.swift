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
    var followingStories: [Story] = []
    var answerTagFromPreviousStory: Int = 0
    weak var previousStory: Story?
    
    init(storyIndex: Int, storyText: String, answerA: String?, answerB: String?) {
        index = storyIndex
        text = storyText
        firstAnswer = answerA
        secondAnswer = answerB
    }
    
    func add(followingStory story: Story, withAnswerTag tag: Int) {
        followingStories.append(story)
        story.previousStory = self
        story.answerTagFromPreviousStory = tag
    }
    
    func search(forNextStoryIndex nextIndex: Int) -> Story? {
        if nextIndex == self.index {
            return self
        }
        
        for story in followingStories {
            if let found = story.search(forNextStoryIndex: nextIndex) {
                return found
            }
        }
        return nil
    }
    
    func next(withAnswertag tag: Int) -> Story? {
        for story in followingStories {
            if story.answerTagFromPreviousStory == tag {
                return story
            }
        }
        return nil
    }
}

// Extention for printing the tree structure
extension Story: CustomStringConvertible {
    var description: String {
        var outputText = "\(index)"
        
        if !followingStories.isEmpty {
            outputText += " {" + followingStories.map { $0.description }.joined(separator: ", ") + "} "
        }
        return outputText
    }
}
