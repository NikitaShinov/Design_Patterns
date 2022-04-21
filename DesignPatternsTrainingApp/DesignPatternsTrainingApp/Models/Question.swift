//
//  Qusetion.swift
//  DesignPatternsTrainingApp
//
//  Created by max on 19.04.2022.
//

import Foundation

class Question: Codable {
  public let answer: String
  public let hint: String?
  public let prompt: String
    
    public init(answer: String, hint: String?, prompt: String) {
        self.answer = answer
        self.hint = hint
        self.prompt = prompt
    }
}
