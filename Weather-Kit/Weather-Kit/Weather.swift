//
//  Weather.swift
//  Weather-Kit
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import Foundation
import Combine

//MARK: typealias
typealias StateHandler = ((Subscribers.Completion<Error>) -> Void)
typealias ReceivedValue<T>  = (T) -> Void

public enum LoadWeatherDataState {
    case didLoadWeatherData
    case error(Error)
}

public class Weather {
    
    // MARK: Properties
    public var state = PassthroughSubject<LoadWeatherDataState, Never>()
    public var weatherDetails: CityWeather?
    
    //MARK: Private properties
    private var cancellable = Set<AnyCancellable>()
    
    //MARK: init
    public init() {}
    
    //MARK: getCityWeather
    public func getCityWeather(city: String) {
        let receiveCompletion : StateHandler = { completion in
            switch completion {
            case .finished:
                self.state.send(.didLoadWeatherData)
            case .failure(let error) :
                self.state.send(.error(error))
            }
        }
        let receivedValue : ReceivedValue<CityWeather> = { data in
            self.weatherDetails = data
        }
        
        APIManager().getCityWeather(cityParameter: city)
            .sink(receiveCompletion: receiveCompletion, receiveValue: receivedValue)
            .store(in: &cancellable)
    }
}
