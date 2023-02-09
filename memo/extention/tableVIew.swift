import UIKit
import Foundation

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    //表示数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //タップ
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(self.items[indexPath.row])")
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    //削除
    func tableView(_ sampleTableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") { (action, index) -> Void in
            print("taptaptap")
            self.items.remove(at: indexPath.row)
            sampleTableView.deleteRows(at: [indexPath], with: .fade)
            FileManager.default.writingFile(self.items.joined(separator: "\n"))
        }
        deleteButton.backgroundColor = UIColor.red
        return [deleteButton]
    }
}


