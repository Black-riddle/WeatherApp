//
//  AddCityViewController.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import UIKit

final class AddCityViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet var cityTextfield: UITextField!
    
    //MARK: - Properties
    var viewModel: AddCityViewModel?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction
    @IBAction func onButtonTapped(_ sender: Any) {
        guard let cityName = cityTextfield.text else { return }
        viewModel?.childDidFinish(cityName: cityName)
    }
}

