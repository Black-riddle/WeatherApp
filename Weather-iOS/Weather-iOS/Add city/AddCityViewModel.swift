//
//  AddCityViewModel.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import Foundation

final class AddCityViewModel: NSObject, AddCityViewModelProtocol  {
    
    //MARK: - Properties
    var coordinator: AddCityCoordinator?
    
    //MARK: - Initializer
    init(coordinator: AddCityCoordinator) {
        self.coordinator = coordinator
    }
    
    //MARK: - Exposed methods
    func childDidFinish(cityName: String) {
        coordinator?.childDidFinish(cityName: cityName)
    }
}
