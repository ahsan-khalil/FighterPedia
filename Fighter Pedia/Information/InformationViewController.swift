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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(currentView == CharacteristicsCollectionViewCell.Identifier){
            infoCollectionView.register(CharacteristicsCollectionViewCell.nib(), forCellWithReuseIdentifier: CharacteristicsCollectionViewCell.Identifier)
        }
        
        infoCollectionView.delegate = self
        infoCollectionView.dataSource = self
    }
}

extension InformationViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacteristicsCollectionViewCell.Identifier, for: indexPath) as! CharacteristicsCollectionViewCell
        cell.config(title: "Role", explanation: "Fighter")
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicked")
    }
}
