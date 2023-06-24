//
//  UIViewControllerExtension.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 24/06/2023.
//

import UIKit

extension UIViewController {
    /// Function displays an alert with one validate action
    /// - Parameters:
    ///   - message: the alert message
    ///   - title: the alert title
    func showCAlertView(message: String, title: String?) {
        let alertController = UIAlertController(title: title ?? "",
                                                message: message,
                                                preferredStyle: .alert)
        let validatAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            alertController.dismiss(animated: true)
        }
        alertController.addAction(validatAction)
        self.present(alertController, animated: true)
    }
}
