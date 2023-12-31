//
//  ViewModel.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import Foundation
import Weather_Kit
import Combine

typealias StateHandler = ((Subscribers.Completion<Error>) -> Void)
typealias ReceivedValue<T>  = (T) -> Void

final class ViewModel: NSObject, ViewModelProtocol {
    
    //MARK: - Properties
    var state: PassthroughSubject<LoadWeatherDataState, Never> {
        return weather.state
    }
    var citiesList: [CityWeather] = []
    var coordinator: MainCoordinator?
    var cityIsAdded = false
    var onCityAdded: (String) -> Void = { _ in }
    
    //MARK: - Private properties
    private var weather = Weather()
    private  var weatherDetails: CityWeather? {
        return weather.weatherDetails
    }
    
    
    //MARK: - initializer
    init(coordinator: MainCoordinator) {
        super.init()
        self.coordinator = coordinator
        getUserLocationWeather()
        onCityAdded = { city in
            self.getCityWeather(cityName: city)
            self.cityIsAdded = true
        }
    }
    
    //MARK: - Private methods
    func manageCityDetails(details: CityWeather) -> CityInformationModel {
        let moreData = AdditionalWeatherData.init(pressure: details.main.pressure,
                                                  humidity: details.main.humidity,
                                                  windSpeed: Int(details.wind.speed),
                                                  feelsLike: details.main.feelsLike)
        return CityInformationModel.init(name: details.name,
                                             temperature: details.main.temp,
                                             tempMax: details.main.tempMax,
                                             tempMin: details.main.tempMin,
                                             moreData: moreData)
    }
    
    private func getCityWeather(cityName: String) {
        weather.getCityWeather(city: cityName)
    }
    
    private func getUserLocationWeather() {
        weather.getUserLocationWeather()
    }
    
    //MARK: - Exposed methods
    func showAddNewCity() {
        coordinator?.showAddCity()
    }
    
    func showCityDetails(details: CityWeather) {
        coordinator?.showCityDetails(details: manageCityDetails(details: details))
    }

    func updateCitiesList() {
        guard let cityWeather = self.weatherDetails else { return }
        citiesList.append(cityWeather)
    }
}

