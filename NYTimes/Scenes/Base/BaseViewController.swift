////
//  SafeBoda
//
//	BaseViewController.swift written using Swift 4.0
//
//  Created on: 12/12/2018
//
//  Copyright © 2018 SafeBoda. All rights reserved.
//

import RxSwift

class BaseViewController: UIViewController, RxBaseProtocol, UIGestureRecognizerDelegate  {
    var disposeBag = DisposeBag()
    private var loadingAlert: UIAlertController?
    private var loadingView: UIView?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    func configureNavigationBar(_ title: String?) {
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.title = title
    }

    func configureBackButton() {
        navigationItem.setLeftBarButton(.init(image: UIImage(named: "left_arrow"),
                                              style: .plain, target: self,
                                              action: #selector(popController)), animated: false)
    }

    @objc private func popController() {
        navigationController?.popViewController(animated: true)
    }

    func configureCloseButton() {
        navigationItem.setLeftBarButton(.init(image: UIImage(named: "closeWhite"),
                                              style: .plain, target: self,
                                              action: #selector(closeController)), animated: false)
    }

    @objc func closeController() {
        dismiss(animated: true, completion: nil)
    }

    func dismissAlertLoading() {
        loadingAlert?.dismiss(animated: true)
    }

    func updateLoading(_ show: Bool, _ view: UIView) {
        if show {
            showLoadingIndicator()
        } else {
            dismissLoadingIndicator()
        }
    }

    func showAlert(_ title: String, message: String, actionTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: actionTitle, style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
