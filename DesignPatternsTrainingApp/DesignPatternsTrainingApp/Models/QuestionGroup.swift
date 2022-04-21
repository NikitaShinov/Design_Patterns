//
//  QusetionGroup.swift
//  DesignPatternsTrainingApp
//
//  Created by max on 19.04.2022.
//

import Foundation

class QuestionGroup: Codable {
    
    class Score: Codable {
        
        var correctCount: Int = 0
        var incorrectCount: Int = 0
        public init() {}
        
    }
    
    public let questions: [Question]
    
    public var score: Score
    
    public let title: String
    
    public init(questions: [Question],
                score: Score = Score(),
                title: String) {
        
        self.questions = questions
        self.score = score
        self.title = title
        
    }
}
