//
//  Models.swift
//  Weather-Kit
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import Foundation

// MARK: - CityWeather
public struct CityWeather: Codable {
    public let coord: Coord
    public let weather: [WeatherModel]
    public let base: String
    public let main: Main
    public let visibility: Int
    public let wind: Wind
    public let clouds: Clouds
    public let dt: Int
    public let sys: Sys
    public let id: Int
    public let name: String
    public let cod: Int
    
    init(id: Int,
         coord: Coord,
         weather: [WeatherModel],
         base: String,
         main: Main,
         visibility: Int,
         wind: Wind,
         clouds: Clouds,
         dt: Int,
         sys: Sys,
         name: String,
         cod: Int) {
        
        self.id = id
        self.coord = coord
        self.weather = weather
        self.base = base
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.clouds = clouds
        self.dt = dt
        self.sys = sys
        self.name = name
        self.cod = cod
        
    }
}

// MARK: - Clouds
public struct Clouds: Codable {
    public let all: Int
    
    init(all: Int) {
        self.all = all
    }
}

// MARK: - Coord
public struct Coord: Codable {
    public let lon, lat: Double
    
    init(lon: Double,
         lat: Double) {
        self.lon = lon
        self.lat = lat
    }
}

// MARK: - Main
public struct Main: Codable {
    public let temp: Double
    public let pressure, humidity: Int
    public let tempMin, tempMax, feelsLike: Double
    
    init(temp: Double,
         tempMin: Double,
         tempMax: Double,
         pressure: Int,
         humidity: Int,
         feelsLike: Double) {
        
        self.temp = temp
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.humidity = humidity
        self.feelsLike = feelsLike
    }

    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case feelsLike = "feels_like"
    }
}

// MARK: - Sys
public struct Sys: Codable {
    public let type, id: Int
    public let country: String
    public let sunrise, sunset: Int
    
    
    init(id: Int,
         type: Int,
         country: String,
         sunrise: Int,
         sunset: Int) {
        
        self.id = id
        self.type = type
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
}

// MARK: - Weather
public struct WeatherModel: Codable {
    public let id: Int
    public let main, description, icon: String
    
    
    init(id: Int,
         main: String,
         description: String,
         icon: String) {
        
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}

// MARK: - Wind
public struct Wind: Codable {
    public let speed: Double
    public let deg: Int
    
    init(speed: Double,
         deg: Int) {
        self.speed = speed
        self.deg = deg
    }
}
// MARK: - Error
public class WError: Error, Decodable {
    public var cod: String?
    public var message: String?
}
