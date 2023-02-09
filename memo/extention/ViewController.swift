import Foundation

extension HomeViewController :PresenterOutput {
    func presentViewController() {
        let second = ViewController()
        self.navigationController?.pushViewController(second, animated: true)
    }
    
//    func setResultLabel(text: String) {
//        resultLabel.text = text
//    }
//
//    func showErrorAlert(title: String, message: String) {
//        let actionAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
//        let cancelAction = UIAlertAction(title: "閉じる", style: UIAlertAction.Style.cancel, handler: nil)
//        actionAlert.addAction(cancelAction)
//        self.present(actionAlert, animated: true, completion: nil)
//    }
}
