//
//  AppCoordinator.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController = UINavigationController()
    
    private let window : UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let mainCoordinator =
        MainCoordinator(navigationController: navigationController)
        mainCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        navigationController.navigationBar.isHidden = false
    }
  
}

