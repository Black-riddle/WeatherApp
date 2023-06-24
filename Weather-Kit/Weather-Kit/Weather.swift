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
    public init() {
        LocationsManager.shared.onLocationChangedCallback = {
            self.getUserLocationWeather()
        }
    }
    
    //MARK: - Exposed methods
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
    
    public func getUserLocationWeather() {
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
        guard let latitude = LocationsManager.shared.latitude,
              let longitude = LocationsManager.shared.longitude else { return }
        
        APIManager().getUserLocationWeather(latitude: latitude,
                                            longitude: longitude)
            .sink(receiveCompletion: receiveCompletion, receiveValue: receivedValue)
            .store(in: &cancellable)
    }
}
