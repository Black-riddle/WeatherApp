//
//  ViewController.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import UIKit
import Combine

final class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    var viewModel: ViewModel?
    
    // MARK: - Private properties
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        bindData()
    }
    
    //MARK: - Private methods
    private func setupInterface() {
        activityIndicator.hidesWhenStopped = true
        initTableView()
    }
    
    private func bindData() {
        guard let viewModel = viewModel else { return }
        if viewModel.cityIsAdded {
            activityIndicator.startAnimating()
        }
        viewModel.state.sink { state in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            switch state {
            case .didLoadWeatherData: self.updateUI()
            case .error(_): break
            }
        }.store(in: &cancellable)
    }
    
    private func updateUI() {
        DispatchQueue.main.async { [self] in
            viewModel?.updateCitiesList()
            tableView.reloadData()
        }
    }
    
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil),
                           forCellReuseIdentifier: CityTableViewCell.identifier)
        
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction private func addNewCityAction(_ sender: Any) {
        viewModel?.showAddNewCity()
    }
}
//MARK: - UITableViewDataSource & UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.citiesList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier,
                                                 for: indexPath) as! CityTableViewCell
        let item = viewModel?.citiesList[indexPath.row]
        cell.setupView(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = viewModel?.citiesList[indexPath.row] {
            viewModel?.showCityDetails(details: item)
        }
    }
}

