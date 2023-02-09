import Foundation
import UIKit

protocol PresenterInput {
    func presenter()
    var numberOfItems: Int { get }
    func didSelect(index: Int)
}

protocol PresenterOutput {
    func presentViewController()
    func update(text: String)
}

class Presenter: PresenterInput {
    let view: PresenterOutput
    let model: ModelInput
    
    init(view: PresenterOutput, model: ModelInput) {
        self.view = view
        self.model = model
    }
    func presenter() {
        view.presentViewController()
    }
    
    
}
