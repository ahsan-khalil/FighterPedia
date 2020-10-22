//
//  InformationViewController.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 02/10/2020.
//

import UIKit

class InformationViewController: UIViewController {
    static let identifier = "InformationViewController"
    @IBOutlet weak var infoCollectionView: UICollectionView!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    var keyValuePairList = [KeyValuePair]()
    override func viewDidLoad() {
        super.viewDidLoad()
        infoCollectionView.register(CharacteristicsCollectionViewCell.nib(),
                                    forCellWithReuseIdentifier: CharacteristicsCollectionViewCell.Identifier)
        infoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        infoCollectionView.delegate = self
        infoCollectionView.dataSource = self
    }
    func configure(list: [KeyValuePair]) {
        self.keyValuePairList = list
    }
}
extension InformationViewController: UICollectionViewDelegate,
                                    UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.keyValuePairList.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacteristicsCollectionViewCell.Identifier,
            for: indexPath) as? CharacteristicsCollectionViewCell {
            cell.config(title: self.keyValuePairList[indexPath.row].title,
                        explanation: self.keyValuePairList[indexPath.row].detail)
            cell.layer.cornerRadius = 5
            cell.layer.borderWidth = 2
            cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            return cell
        } else {
            print("InformationViewController Cell is nil")
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicked")
    }
}
