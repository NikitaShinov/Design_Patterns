//
//  QuestionGroupCell.swift
//  DesignPatternsTrainingApp
//
//  Created by max on 20.04.2022.
//

import UIKit
import Combine

class QuestionGroupCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    public var percentageSubscriber: AnyCancellable?
}
