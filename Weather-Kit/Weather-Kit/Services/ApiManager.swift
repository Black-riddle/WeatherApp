//
//  ApiManager.swift
//  Weather-Kit
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import Foundation
import Combine

class APIManager {
    
    func getCityWeather(cityParameter: String) -> Future<(CityWeather), Error> {
        let jsonUrlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityParameter)&appid=91cdbfcc7952a714bd12d5e9c5f5de5e"
        return request(jsonUrlString: jsonUrlString)
        
    }
    
    func getUserLocationWeather(latitude: Double, longitude: Double) -> Future<(CityWeather), Error> {
        let jsonUrlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=91cdbfcc7952a714bd12d5e9c5f5de5e"
        return request(jsonUrlString: jsonUrlString)
        
    }
    
    func request(jsonUrlString: String) -> Future<(CityWeather), Error>  {
        return Future {  promise in
            
            guard let url = URL(string: jsonUrlString) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, res, err) in
                
                guard let data = data else {
                    return
                }
                
                let result: Result<CityWeather, Error>  =
                JSONDecoder().decodeResponse(from: data, error: err)
                
                switch result {
                    
                case .success(let result):
                    promise(.success(result))
                    
                case .failure(let error):
                    promise(.failure(error))
                }
                
            }.resume()
        }
    }
}
