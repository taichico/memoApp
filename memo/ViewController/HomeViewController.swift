import UIKit

class HomeViewController: UIViewController {
    var presenter: PresenterInput!
    
    var rightButton: UIBarButtonItem!
    var leftButton: UIBarButtonItem!
    var memoTableView = UITableView()
    var readFile: String
    var items: [String] = []
    var flag = false
    
    func inhect(presenter: Presenter) {
        self.presenter = presenter
    }
    
    init() {
        readFile = FileManager.default.readingFile() ?? ""
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.memoTableView = {
            let tableView = UITableView(frame: self.view.bounds, style: .plain)
            tableView.autoresizingMask = [
                .flexibleWidth,
                .flexibleHeight
            ]
            tableView.delegate = self
            tableView.dataSource = self
            self.view.addSubview(tableView)
            return tableView
        }()
        
        leftButton = UIBarButtonItem(title: "🚮", style: .done, target: self, action: #selector(leftClick))
        rightButton = UIBarButtonItem(title: "memo", style: .done, target: self, action: #selector(rightClick))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.leftBarButtonItem = leftButton
        view.addSubview(memoTableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        readFile = FileManager.default.readingFile() ?? ""
        items = readFile.components(separatedBy: "\n") ?? []
        print(items, "items")
        print(items.joined(separator: "\n"))
        memoTableView.reloadData()
    }
    
    @objc func rightClick() {
        presenter.presenter()
    }
    
    @objc func leftClick() {
        presenter
        flag = !flag
        memoTableView.isEditing = flag ? true : false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
