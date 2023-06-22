//
//  addCityCoordinator.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import Foundation
import UIKit

final class AddCityCoordinator: Coordinator {
    
    //MARK: - Properties
    weak var parentCoordinator: MainCoordinator?
    
    //MARK: - Private properties
    private var navigationController : UINavigationController
    
    //MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Exposed methods
    func start() {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "AddCityViewController") as? AddCityViewController else { return }
        viewController.viewModel = AddCityViewModel(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func childDidFinish(cityName: String) {
        parentCoordinator?.childDidFinish(cityName: cityName)
        navigationController.popViewController(animated: true)
    }
    
}

