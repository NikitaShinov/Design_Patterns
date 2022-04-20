//
//  SequentialQuestionStrategy.swift
//  DesignPatternsTrainingApp
//
//  Created by max on 20.04.2022.
//

import UIKit

class SequentialQuestionStrategy: QuestionStrategy {
    // MARK: - Properties
    var correctCount: Int = 0
    
    var incorrectCount: Int = 0
    
    private let questionGroup: QuestionGroup
    
    private var questionIndex = 0
    
    // MARK: - Object Lifecycle
    init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
    }
    // MARK: - QuestionStrategy
    var title: String {
        return questionGroup.title
    }
    
    func currentQuestion() -> Question {
        return questionGroup.questions[questionIndex]
    }
    
    func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questionGroup.questions.count else { return false }
        questionIndex += 1
        return true
    }
    
    func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/" + "\(questionGroup.questions.count)"
    }
    
    
}
