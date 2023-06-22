//
//  CityTableViewCell.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import UIKit
import Weather_Kit

final class CityTableViewCell: UITableViewCell {
    
    // MARK: - Static properties
    static let identifier = "cityTableViewCell"
    
    // MARK: - IBOutlets
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var temperatureValueLabel: UILabel!
    @IBOutlet var maxTemperatureLabel: UILabel!
    @IBOutlet var minTemperatureLabel: UILabel!
    @IBOutlet var weatherImageView: UIImageView!
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initUI()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: - Private functions
    private func initUI() {}
    
    // MARK: - Exposed functions
    func setupView(item: CityWeather?) {
        guard let viewModel = item else { return }
        let temperature = viewModel.main.temp.convertKelvinToDegree()
        let tempMax = viewModel.main.tempMax.convertKelvinToDegree()
        let tempMin = viewModel.main.tempMin.convertKelvinToDegree()
        let icon = viewModel.weather.first?.icon
        cityNameLabel.text = viewModel.name
        temperatureValueLabel.text = "\(temperature)°"
        maxTemperatureLabel.text = "\(tempMax)°"
        minTemperatureLabel.text = "\(tempMin)°"
        guard let icon = icon else { return }
        weatherImageView?.image = UIImage(named: icon)
    }
    
}
