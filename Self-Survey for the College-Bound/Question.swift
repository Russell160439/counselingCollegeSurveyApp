//
//  Question.swift
//  Self-Survey for the College-Bound
//
//  Created by Russell on 15/12/2015.
//  Copyright © 2015 Russell Slighton. All rights reserved.
//
import Foundation

struct question {
    var question: String
    var type: Int
    var answer: Int
    init(question: String, type: Int){
        self.question = question
        self.type = type
        answer = 9
        //9,6,3,0
    }
    
}

//