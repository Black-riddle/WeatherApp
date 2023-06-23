//
//  CityDetailCollectionViewCell.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 23/06/2023.
//

import UIKit

class CityDetailCollectionViewCell: UICollectionViewCell {

    // MARK: - Static properties
    static let identifier = "cityDetailCollectionViewCell"
    
    //MARK: - IBOutlets
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
    }
    
    // MARK: - Exposed functions
    func setupView(items: (WeatherDetails, Int)?) {
        guard let items = items else { return }
        let (key, value) = items
        titleLabel.text = key.title
        valueLabel.text = "\(value) \(key.unit)"
    }

}
