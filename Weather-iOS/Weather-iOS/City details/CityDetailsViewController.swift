//
//  CityDetailsViewController.swift
//  Weather-iOS
//
//  Created by Oumayma Guefrej on 21/06/2023.
//

import UIKit

final class CityDetailsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var tempMaxlabel: UILabel!
    @IBOutlet var tempMinLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    //MARK: - Properties
    var viewModel: CityDetailsViewModel?
    
    //MARK: - Private properties
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return layout
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initCollectionView()
    }
    
    //MARK: - Private methods
    private func initUI() {
        guard let viewModel = viewModel else { return }
        cityNameLabel.text = viewModel.cityName
        temperatureLabel.text = "\(viewModel.temperature)°"
        tempMaxlabel.text = "\(viewModel.tempMax)°"
        tempMinLabel.text = "\(viewModel.tempMin)°"
    }
    private func initCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CityDetailCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: CityDetailCollectionViewCell.identifier)
        collectionView.collectionViewLayout = flowLayout
    }

}

//MARK: - UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension CityDetailsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityDetailCollectionViewCell.identifier, for: indexPath) as? CityDetailCollectionViewCell
        else { fatalError("Could not dequeue cell with identifier: \(CityDetailCollectionViewCell.identifier)") }
        cell.setupView(items: viewModel?.informationList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.informationList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: itemDimension, height: itemDimension)
   }
}
