//
//  AddCityViewModelProtocol.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 23/06/2023.
//

import Foundation

protocol AddCityViewModelProtocol {
 
    var coordinator: AddCityCoordinator? { get }
    
    func childDidFinish(cityName: String)
}
