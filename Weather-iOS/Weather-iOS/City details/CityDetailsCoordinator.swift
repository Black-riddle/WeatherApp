//
//  CityDetailsCoordinator.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 22/06/2023.
//

import Foundation
import UIKit

final class CityDetailsCoordinator: Coordinator {
    
    //MARK: - Properties
    weak var parentCoordinator: MainCoordinator?
    var cityDetails: CityInformationModel
    
    //MARK: - Private properties
    private var navigationController : UINavigationController
    
    //MARK: - Init
    init(navigationController: UINavigationController,
         cityDetails: CityInformationModel) {
        self.navigationController = navigationController
        self.cityDetails = cityDetails
    }
    
    //MARK: - Exposed methods
    func start() {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "CityDetailsViewController") as? CityDetailsViewController else { return }
        viewController.viewModel = CityDetailsViewModel(coordinator: self,
                                                        cityDetails: cityDetails)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}


