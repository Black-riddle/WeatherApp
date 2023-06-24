//
//  Weather.swift
//  Weather-Kit
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import Foundation
import Combine

//MARK: - typealias
typealias StateHandler = (Subscribers.Completion<Error>) -> Void
typealias ReceivedValue<T> = (T) -> Void

public enum LoadWeatherDataState {
    case didLoadWeatherData
    case error(WError)
}

public class Weather {
    
    // MARK: - Properties
    public var state = PassthroughSubject<LoadWeatherDataState, Never>()
    public var weatherDetails: CityWeather?
    
    //MARK: - Private properties
    private var cancellable = Set<AnyCancellable>()
    
    //MARK: - init
    public init() {}
    
    //MARK: - Exposed methods
    /// This method allows getting weather for a city
    /// - Parameters:
    ///   - city: String
    public func getCityWeather(city: String) {
        let receiveCompletion : StateHandler = { completion in
            switch completion {
            case .finished:
                self.state.send(.didLoadWeatherData)
            case .failure(let error) :
                self.state.send(.error(error as? WError ?? WError()))
            }
        }
        let receivedValue : ReceivedValue<CityWeather> = { data in
            self.weatherDetails = data
        }
        
        APIManager().getCityWeather(cityParameter: city)
            .sink(receiveCompletion: receiveCompletion, receiveValue: receivedValue)
            .store(in: &cancellable)
    }
    // This method allows getting user location
    public func getUserLocationWeather() {
        LocationsManager.shared.onLocationChangedCallback = {
            if let location = LocationsManager.shared.userLocation {
                let latitude = location.coordinate.latitude
                let longitude = location.coordinate.longitude
                getUserLocationWeather(latitude: latitude, longitude: longitude)
            } else {
                // Failed to obtain a valid location
                print("Failed to get current location.")
            }
        }
        func getUserLocationWeather(latitude: Double, longitude: Double) {
            let receiveCompletion : StateHandler = { completion in
                switch completion {
                case .finished:
                    self.state.send(.didLoadWeatherData)
                case .failure(let error) :
                    self.state.send(.error(error as? WError ?? WError()))
                }
            }
            let receivedValue : ReceivedValue<CityWeather> = { data in
                self.weatherDetails = data
            }
            APIManager().getUserLocationWeather(latitude: latitude,
                                                longitude: longitude)
                .sink(receiveCompletion: receiveCompletion, receiveValue: receivedValue)
                .store(in: &cancellable)
        }
    }
}
