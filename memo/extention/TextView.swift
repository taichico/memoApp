import UIKit
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
