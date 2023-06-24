//
//  ViewModelProtocol.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 23/06/2023.
//

import Combine
import Weather_Kit

protocol ViewModelProtocol {
    var state: PassthroughSubject<LoadWeatherDataState, Never> { get }
    var citiesList: [CityWeather] { get }
    var coordinator: MainCoordinator? { get }
    var cityIsAdded: Bool { get }
    var onCityAdded: (String) -> Void { get }
    
    func showAddNewCity()
    func showCityDetails(details: CityWeather)
    func updateCitiesList()
}
