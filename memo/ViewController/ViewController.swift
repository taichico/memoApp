import UIKit

class ViewController: UIViewController {
    
    let textView = UITextView()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        textView.delegate = self
        textView.keyboardType = .default
        textView.layer.cornerRadius = 5
        textView.layer.borderColor = UIColor(white: 0.9, alpha: 1).cgColor
        textView.backgroundColor = .cyan
        textView.text = "TextView"
        view.addSubview(textView)
        
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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViews()
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
