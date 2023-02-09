import UIKit

class ViewController: UIViewController {
    var home = HomeViewController()
    static var readFile: String = ""
    let textView: UITextView = {
        var textView = UITextView()
        textView.keyboardType = .default
        textView.layer.cornerRadius = 5
        textView.layer.borderColor = UIColor(white: 0.9, alpha: 1).cgColor
        textView.backgroundColor = .gray
        return textView
    }()
    let saveButton: UIButton = {
       let button = UIButton()
        button.setTitle("save", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    var navButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textView.delegate = self
        view.addSubview(textView)
        view.addSubview(saveButton)

        navButton = UIBarButtonItem(title: "メモ一覧", style: .done, target: self, action: #selector(click))
        // タップされたときのaction
        saveButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    func setupViews() {
        let safeArea = view.safeAreaInsets
        
        let partsArea_W = view.bounds.width - safeArea.left - safeArea.right
        let partsArea_H = view.bounds.height - safeArea.top - safeArea.bottom
        
        let margin_X = round(partsArea_W * 0.05)
        let margin_Y = round(partsArea_H * 0.05)
        
        let textView_W = partsArea_W - margin_X * 2
        let textView_H = round(partsArea_H * 0.5)
        let textView_X = margin_X
        let textView_Y = view.bounds.height / 2 - textView_H + safeArea.bottom
        textView.frame.size = CGSize(width: textView_W, height: textView_H)
        textView.frame.origin = CGPoint(x: textView_X, y: textView_Y)
        saveButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        saveButton.center = CGPoint(x: view.center.x, y: textView.bounds.height * 1.5)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViews()
    }
    
    @objc func buttonTapped() {
        FileManager.default.createFile()
        FileManager.default.appendText(string: textView.text)
        print("button tap")
    }
    
    @objc func click() {
        let third = HomeViewController()
        navigationController?.pushViewController(third, animated: true)
    }
}

extension ViewController: UITextViewDelegate {
    //編集開始直前に呼ばれる
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
      //trueを返すことにより編集開始を許可する
      return true
    }

    //編集開始直後に呼ばれる
    func textViewDidBeginEditing(_ textView: UITextView) {

    }

    //編集終了直前に呼ばれる
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
      //trueを返すことにより編集終了を許可する
      return true
    }

    //編集終了直後に呼ばれる
    func textViewDidEndEditing(_ textView: UITextView) {
      //textViewからテキストの取り出し
      guard let text = textView.text else { return }
      print(text)
    }

}
