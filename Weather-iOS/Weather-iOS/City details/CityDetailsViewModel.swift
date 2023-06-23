//
//  CityDetailsViewModel.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import Foundation

final class CityDetailsViewModel {
    
    //MARK: - Private properties
    
    private var cityDetails: CityInformationViewModel
    
    //MARK: - Properties
    var coordinator: CityDetailsCoordinator?
    
    var cityName: String {
        return cityDetails.name
    }
    var temperature: String {
        return String(cityDetails.temperature)
    }
    var tempMax: String {
        return String(cityDetails.tempMax)
    }
    var tempMin: String {
        return String(cityDetails.tempMin)
    }
    var informationList: [(String, Int)] {
        return cityDetails.moreData.toKeyValueArray()
    }
    
    //MARK: - Initializer
    init(coordinator: CityDetailsCoordinator,
         cityDetails: CityInformationViewModel) {
        self.coordinator = coordinator
        self.cityDetails = cityDetails
    }
}
