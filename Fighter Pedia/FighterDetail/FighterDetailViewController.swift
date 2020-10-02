//
//  FighterDetailViewController.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 01/10/2020.
//

import UIKit



class FighterDetailViewController: UIViewController {

    public static let reuseIdentifier = "FighterDetailViewController"
    @IBOutlet weak var fighterPicsCollectionView:UICollectionView!
    @IBOutlet weak var FighterOperatorsCollectionView: UICollectionView!
    
   
    @IBOutlet weak var viewFighterInfoBG: UIView!
    @IBOutlet var btnCollection: [UIButton]!
    
    enum CollectionViewTag:Int {
        case picCollectionViewTag = 1
        case flagCollectionViewTag = 2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fighterPicsCollectionView.delegate = self
        fighterPicsCollectionView.dataSource = self
        FighterOperatorsCollectionView.delegate = self
        FighterOperatorsCollectionView.dataSource = self
        
        fighterPicsCollectionView.layer.cornerRadius = 5
        FighterOperatorsCollectionView.layer.cornerRadius = 3
        viewFighterInfoBG.layer.cornerRadius = 5
        viewFighterInfoBG.layer.borderWidth = 2
        viewFighterInfoBG.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        for btn in btnCollection {
            btn.layer.cornerRadius = 3
        }
        
        
        self.title = "Fighter Information"
        
        navigationItem.title = "Fighter Information"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle.fill") , style: .plain, target: self, action: #selector(moreInfo))
       
    }
    
    @objc func moreInfo(){
        print("right button tapped")
    }

}


extension FighterDetailViewController:UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //if(collectionView == self.fighterPicsCollectionView){
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.resuseIdentifier, for: indexPath) as! ImageCollectionViewCell
        cell.layer.borderWidth = 3
        cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you touched me \(indexPath.row)")
    }
    
    
    
    
    
}
