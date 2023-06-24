//
//  CityDetailsViewModelProtocol.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 23/06/2023.
//

import Foundation

protocol CityDetailsViewModelProtocol {
 
    var coordinator: CityDetailsCoordinator? { get }
    var cityName: String  { get }
    var temperature: String  { get }
    var tempMax: String  { get }
    var tempMin: String  { get }
    var informationList: [(WeatherDetails, Int)]  { get }
}

