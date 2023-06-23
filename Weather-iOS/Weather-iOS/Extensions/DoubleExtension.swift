//
//  DoubleExtension.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 22/06/2023.
//

import Foundation

extension Double {
    func convertKelvinToDegree() -> Int {
        return Int(self - 273.15)
    }
}
