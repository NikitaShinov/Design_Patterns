//
//  SequentialQuestionStrategy.swift
//  DesignPatternsTrainingApp
//
//  Created by max on 20.04.2022.
//

import UIKit

class SequentialQuestionStrategy: BaseQuestionStrategy {
    public convenience init(
        questionGroupCaretaker: QuestionGroupCaretaker) {
            let questionGroup =
            questionGroupCaretaker.selectedQuestionGroup!
            let questions = questionGroup.questions
            self.init(questionGroupCaretaker: questionGroupCaretaker,questions: questions)
        }
}
