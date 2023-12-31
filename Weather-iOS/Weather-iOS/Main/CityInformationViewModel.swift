//
//  CityInformationViewModel.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 22/06/2023.
//

import Foundation

// MARK: - CityInformationViewModel
// This model contains only weather information that we will display later on city details screen
struct CityInformationModel {
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
         feelsLike: Double) {
        
        self.pressure = pressure
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.feelsLike = feelsLike.convertKelvinToDegree()
        
    }
    
    func toKeyValueArray() -> [(WeatherDetails, Int)] {
            return [
                (.pressure, pressure),
                (.humidity, humidity),
                (.windSpeed, windSpeed),
                (.feelsLike, feelsLike)
            ]
        }
}

enum WeatherDetails {
    case pressure
    case humidity
    case windSpeed
    case feelsLike

    var title: String {
        switch self {
        case .pressure: return "Pressure"
        case .humidity: return "Humidity"
        case .feelsLike: return "Feels like"
        case .windSpeed: return "Wind speed"
        }
    }
    var unit: String {
        switch self {
        case .pressure: return "h/pa"
        case .humidity: return "%"
        case .feelsLike: return "°"
        case .windSpeed: return "metre/sec"
        }
    }
}
