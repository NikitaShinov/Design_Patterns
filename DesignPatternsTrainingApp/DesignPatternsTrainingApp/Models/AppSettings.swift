//
//  AppSettings.swift
//  DesignPatternsTrainingApp
//
//  Created by max on 21.04.2022.
//

import Foundation

class AppSettings {
    
    private struct Keys {
        static let questionStrategy = "questionStrategy"
    }
    
    static let shared = AppSettings()
    
    // MARK: - Instance Properties
    public var questionStrategyType: QuestionStrategyType {
        get {
            let rawValue = userDefaults.integer(
                forKey: Keys.questionStrategy)
            return QuestionStrategyType(rawValue: rawValue)!
        } set {
            userDefaults.set(newValue.rawValue,
                             forKey: Keys.questionStrategy)
        }
    }
    private let userDefaults = UserDefaults.standard
    
    private init() {}
    
    // MARK: - Instance Methods
    public func questionStrategy(for questionGroupCaretaker: QuestionGroupCaretaker) -> QuestionStrategy {
        return questionStrategyType.questionStrategy(for: questionGroupCaretaker)
    }
}

enum QuestionStrategyType: Int, CaseIterable {
    
    case random
    case sequential
    
    func title() -> String {
        switch self {
        case .random:
            return "Random"
        case .sequential:
            return "Sequential"
        }
    }
    
    public func questionStrategy(
        for questionGroupCaretaker: QuestionGroupCaretaker) -> QuestionStrategy {
        switch self {
        case .random:
            return RandomQuestionStrategy(
                questionGroupCaretaker: questionGroupCaretaker)
        case .sequential:
            return SequentialQuestionStrategy(
                questionGroupCaretaker: questionGroupCaretaker)
        }
    }
}
