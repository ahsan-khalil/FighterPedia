//
//  FighterCollectionViewController.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 30/09/2020.
//

import UIKit

struct FlightModel{
    var id:String = ""
    var flightName:String = ""
    var flighImageSrc:String = ""
}

class FighterCollectionViewController: UIViewController {

    public static let reuseIdentifier = "FighterCollectionViewController"
    
    private var flightList = [FlightModel]()
    
    @IBOutlet weak var fighterCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fighterCollectionView.register(FighterCollectionViewCell.nib(), forCellWithReuseIdentifier: FighterCollectionViewCell.reuseIdentifier)
        flightList.append(FlightModel())
        flightList.append(FlightModel())
        flightList.append(FlightModel())
        flightList.append(FlightModel())
        flightList.append(FlightModel())
        flightList.append(FlightModel())
        flightList.append(FlightModel())
        
        fighterCollectionView.delegate = self
        fighterCollectionView.dataSource = self
    }
}

extension FighterCollectionViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        flightList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FighterCollectionViewCell.reuseIdentifier, for: indexPath)
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 0.06467689574, green: 0.04641190916, blue: 0.1739622355, alpha: 1)
        return cell
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 30, height: 300)
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("i was clicked")
        
        let vc = storyboard?.instantiateViewController(identifier: FighterDetailViewController.reuseIdentifier) as! FighterDetailViewController
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}
