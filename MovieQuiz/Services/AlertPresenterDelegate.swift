import UIKit

protocol AlertPresenterDelegate: AnyObject {
    func show(model: AlertModel)
    func didLoad(_ vc: UIViewController)
}

class AlertPresenter: AlertPresenterDelegate {
    
    weak var delegate: UIViewController?
    
    func didLoad(_ vc: UIViewController) {
        self.delegate = vc
    }
    func show(model: AlertModel) {
        let alert = UIAlertController(title: model.title,
                                      message: model.message,
                                      preferredStyle: .alert)
        alert.view.accessibilityIdentifier = "Game results"
        let actionAlert = UIAlertAction(title: model.buttonText,
                                        style: .default) { _ in model.comletion()
            
            
        }
        alert.addAction(actionAlert)
        showAlert(alert: alert)
    }
    func showAlert(alert: UIAlertController) {
        delegate?.present(alert, animated: true)
    }
}

