//
//  UITableViewExtension.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 23/06/2023.
//

import UIKit

extension UITableView {
    // This method is used to display a message when user haven't yet add a new city
    func setEmptyMessage() {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
        messageLabel.text = "Your cities list is empty"
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        backgroundView = messageLabel
    }
    // This method is used to remove the message after adding cities
    func restore() {
        backgroundView = nil
    }
}
