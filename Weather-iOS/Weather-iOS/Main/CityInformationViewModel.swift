//
//  CityInformationViewModel.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 22/06/2023.
//

import Foundation

// MARK: - CityInformationViewModel
struct CityInformationViewModel {
    let name: String
    let temperature: Int
    let tempMax: Int
    let tempMin: Int
    let moreData: AdditionalWeatherData
    
    init(name: String,
         temperature: Double,
         tempMax: Double,
         tempMin: Double,
         moreData: AdditionalWeatherData) {
        
        self.name = name
        self.temperature = temperature.convertKelvinToDegree()
        self.tempMax = tempMax.convertKelvinToDegree()
        self.tempMin = tempMin.convertKelvinToDegree()
        self.moreData = moreData
        
    }
}

struct AdditionalWeatherData {
    let pressure: Int
    let humidity: Int
    let windSpeed: Int
    let feelsLike: Int
    
    init(pressure: Int,
         humidity: Int,
         windSpeed: Int,
         feelsLike: Int) {
        
        self.pressure = pressure
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.feelsLike = feelsLike
        
    }
    
    func toKeyValueArray() -> [(String, Int)] {
            return [
                ("pressure", pressure),
                ("humidity", humidity),
                ("windSpeed", windSpeed),
                ("feelsLike", feelsLike)
            ]
        }
}

//enum weatherDetails {
//
//    case pressure
//    case humidity
//    case windSpeed
//    case feelsLike
//
//    var title = {
//
//    }
//    var unit
//}
