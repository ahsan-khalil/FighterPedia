//
//  FighterCollectionViewController.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 30/09/2020.
//

import UIKit

class FighterCollectionViewController: UIViewController {

    public static let reuseIdentifier = "FighterCollectionViewController"
    
    private var flightList:[FighterModel]! = [FighterModel]()
    
    @IBOutlet weak var fighterCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fighterCollectionView.register(FighterCollectionViewCell.nib(), forCellWithReuseIdentifier: FighterCollectionViewCell.reuseIdentifier)
        //flightList = FighterRepository.getFighterList()
        fighterCollectionView.delegate = self
        fighterCollectionView.dataSource = self
    }
    
    func setFighterList(fighterList:[FighterModel]){
        self.flightList = fighterList
    }
}

extension FighterCollectionViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        flightList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FighterCollectionViewCell.reuseIdentifier, for: indexPath) as! FighterCollectionViewCell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 0.06467689574, green: 0.04641190916, blue: 0.1739622355, alpha: 1)
        let selectedFighter = self.flightList[indexPath.row]
        print(selectedFighter.picturesList[0])
        cell.configure(flightName: selectedFighter.flightname, FlightImage: Utility.retriveImage(imageName: selectedFighter.picturesList[0]) ?? UIImage(named: "aapLogo")!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 30, height: 300)
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedFighter = self.flightList[indexPath.row]
        let vc = storyboard?.instantiateViewController(identifier: FighterDetailViewController.reuseIdentifier) as! FighterDetailViewController
        vc.selectedFighter = selectedFighter
        navigationController?.pushViewController(vc, animated: true)
    }
}
