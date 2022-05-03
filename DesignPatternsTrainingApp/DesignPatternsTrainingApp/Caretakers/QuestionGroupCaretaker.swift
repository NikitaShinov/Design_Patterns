//
//  QuestionGroupCaretaker.swift
//  DesignPatternsTrainingApp
//
//  Created by max on 22.04.2022.
//

import Foundation

final class QuestionGroupCaretaker {
    // MARK: - Properties
    private let fileName = "QuestionGroupData"
    var questionGroups: [QuestionGroup] = []
    var selectedQuestionGroup: QuestionGroup!
    // MARK: - Object Lifecycle
    public init() {
        // 3
        loadQuestionGroups()
    }
    // 4
    private func loadQuestionGroups() {
        if let questionGroups =
            try? DiskCaretaker.retrieve([QuestionGroup].self,
                                        from: fileName) {
            self.questionGroups = questionGroups
        } else {
            let bundle = Bundle.main
            let url = bundle.url(forResource: fileName,
                                 withExtension: "json")!
            self.questionGroups = try!
            DiskCaretaker.retrieve([QuestionGroup].self, from: url)
            try! save()
        } }
    // MARK: - Instance Methods
    // 5
    func save() throws {
        try DiskCaretaker.save(questionGroups, to: fileName)
    }
}
