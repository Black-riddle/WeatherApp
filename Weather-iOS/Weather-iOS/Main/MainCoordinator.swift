//
//  MainCoordinator.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import Foundation
import UIKit
import Weather_Kit

final class MainCoordinator: Coordinator {
    
    //MARK: - Private attributes
    private var navigationController : UINavigationController
    private var viewController: ViewController?
    
    //MARK: - initializer
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Exposed methods
    func start() {
        viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ViewController") as? ViewController
        
        guard let viewController = viewController else { return }
        viewController.viewModel = ViewModel(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showAddCity() {
        let addCityCoordinator = AddCityCoordinator(navigationController: navigationController)
        addCityCoordinator.parentCoordinator = self
        addCityCoordinator.start()
    }
    
    func showCityDetails(details: CityInformationViewModel) {
        let cityDetailsCoordinator = CityDetailsCoordinator(navigationController: navigationController,
                                                            cityDetails: details)
        cityDetailsCoordinator.start()
    }
    
    func childDidFinish(cityName: String) {
        guard let viewController = viewController,
              let viewModel = viewController.viewModel else { return }
        viewModel.onCityAdded(cityName)
    }
}
