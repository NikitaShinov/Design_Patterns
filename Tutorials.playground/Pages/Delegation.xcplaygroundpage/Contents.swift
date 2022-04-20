/*
 Шаблон делегирования позволяет объекту использовать другой «вспомогательный» объект для предоставления данных или выполнения задачи, а не для выполнения самой задачи. Этот шаблон состоит из трех частей:

 • Объект, которому требуется делегат, также известный как делегирующий объект. Это объект, у которого есть делегат. Делегат обычно хранится как слабое свойство, чтобы избежать цикла сохранения, когда делегирующий объект сохраняет делегата, который сохраняет делегирующий объект.
 • Протокол делегата, который определяет методы, которые делегат может или должен реализовать.
 • Делегат, который является вспомогательным объектом, реализующим протокол делегата.
 Полагаясь на протокол делегата вместо конкретного объекта, реализация становится намного более гибкой: любой объект, реализующий протокол, может использоваться в качестве делегата!
 
 Используйте этот шаблон, чтобы разбить большие классы или создать универсальные повторно используемые компоненты. Отношения делегата распространены во всех платформах Apple, особенно в UIKit. Объекты с именами DataSource и Delegate на самом деле следуют шаблону делегирования, поскольку каждый из них включает в себя один объект, который просит другой предоставить данные или сделать что-то.

*/

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
