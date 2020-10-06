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
    var currentView:String = CharacteristicsCollectionViewCell.Identifier
    
    
    var keyValuePairList = [KeyValuePair]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(currentView == CharacteristicsCollectionViewCell.Identifier){
            infoCollectionView.register(CharacteristicsCollectionViewCell.nib(), forCellWithReuseIdentifier: CharacteristicsCollectionViewCell.Identifier)
        }
        
        infoCollectionView.delegate = self
        infoCollectionView.dataSource = self
    }
    
    func configure(list:[KeyValuePair]){
        self.keyValuePairList = list
    }
}

extension InformationViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.keyValuePairList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacteristicsCollectionViewCell.Identifier, for: indexPath) as! CharacteristicsCollectionViewCell
        cell.config(title: self.keyValuePairList[indexPath.row].title, explanation: self.keyValuePairList[indexPath.row].detail)
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicked")
    }
}
