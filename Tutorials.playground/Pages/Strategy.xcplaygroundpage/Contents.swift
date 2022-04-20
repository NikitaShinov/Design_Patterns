import UIKit
/*
 Шаблон стратегии определяет семейство взаимозаменяемых объектов, которые можно задавать или переключать во время выполнения. Этот шаблон состоит из трех частей:
 
 • Объект, использующий стратегию. Чаще всего это контроллер представления, когда шаблон используется в разработке приложений для iOS, но технически это может быть любой объект, требующий взаимозаменяемого поведения.
 • Протокол стратегии определяет методы, которые должна реализовывать каждая стратегия.
 • Стратегии — это объекты, соответствующие протоколу стратегии.
 
 Используйте шаблон стратегии, когда у вас есть два или более разных поведения, которые взаимозаменяемы.
 Этот шаблон похож на шаблон делегирования: оба шаблона полагаются на протокол, а не на конкретные объекты для повышения гибкости. Следовательно, любой объект, реализующий протокол стратегии, может использоваться в качестве стратегии во время выполнения.
 В отличие от делегирования, шаблон стратегии использует семейство объектов.
 Делегаты часто фиксируются во время выполнения. Например, dataSource и делегат для UITableView можно установить из Interface Builder, и они редко меняются во время выполнения.
 Однако стратегии должны быть легко взаимозаменяемы во время выполнения.
 
 */

protocol MovieRatingStrategy {
    
    var ratingServiceName: String { get }
    
    func fetchRating(for movieTitle: String,
                     success: (_ rating: String, _ review: String) -> Void)
}

class RottenTomatoesClient: MovieRatingStrategy {
    let ratingServiceName = "Rotten Tomatoes"
    
    func fetchRating(for movieTitle: String, success: (String, String) -> Void) {
        let rating = "95%"
        let review = "It's rocked!"
        success(rating, review)
    }
}

class IMDbClient: MovieRatingStrategy {
    
    let ratingServiceName = "IMDb"
    
    func fetchRating(for movieTitle: String, success: (String, String) -> Void) {
        let rating = "3/10"
        let review = "Very poor film."
        success(rating, review)
    }
}

class MovieRatingViewController: UIViewController {
    
    var movieRatingClient: MovieRatingStrategy!
    
    @IBOutlet public var movieTitleTextField: UITextField!
    @IBOutlet public var ratingServiceNameLabel: UILabel!
    @IBOutlet public var ratingLabel: UILabel!
    @IBOutlet public var reviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingServiceNameLabel.text = movieRatingClient.ratingServiceName
    }
    @IBAction public func searchButtonPressed(sender: Any) {
        guard let movieTitle = movieTitleTextField.text else { return }
        
        movieRatingClient.fetchRating(for: movieTitle) { rating, review in
            self.ratingLabel.text = rating
            self.reviewLabel.text = review
        }
    }
}
