import UIKit

//4 step
protocol MenuViewControllerDelegate {
    func menuViewController(_ menuViewController: MenuViewController,
                            didSelectItemAtIndex index: Int)
}

class MenuViewController: UIViewController {
    
    //5 step
    
    var delegate: MenuViewControllerDelegate?
    
    //1 Step
    
    @IBOutlet public var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    //2 Step
    
    private let items = ["Item 1", "Item 2", "Item 3"]
}

//3 step

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
}

//6 step
extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.menuViewController(self, didSelectItemAtIndex: indexPath.row)
    }
}
