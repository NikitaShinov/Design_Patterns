//
//  RandomQuestionStrategy.swift
//  DesignPatternsTrainingApp
//
//  Created by max on 20.04.2022.
//

import GameplayKit.GKRandomSource

class RandomQuestionStrategy: QuestionStrategy {
    
    // MARK: - Properties
    var correctCount: Int = 0
    
    var incorrectCount: Int = 0
    
    private let questionGroup: QuestionGroup
    
    private var questionIndex = 0
    
    private let questions: [Question]
    // MARK: - Object Lifecycle
    init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
        
        let randomSource = GKRandomSource.sharedRandom()
        self.questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
    }
    
    // MARK: - QuestionStrategy
    var title: String {
        questionGroup.title
    }
    
    func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questions.count else {
            return false
        }
        questionIndex += 1
        return true
    }
    
    func currentQuestion() -> Question {
        questions[questionIndex]
    }
    
    func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/\(questions.count)"
    }
    
    
    
    
}
