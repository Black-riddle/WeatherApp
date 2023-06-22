//
//  CityDetailsViewModel.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import Foundation

final class CityDetailsViewModel {
    
    //MARK: - Properties
    var coordinator: CityDetailsCoordinator?
    
    //MARK: - Initializer
    init(coordinator: CityDetailsCoordinator) {
        self.coordinator = coordinator
    }
}
