//
//  FighterDetailViewController.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 01/10/2020.
//

import UIKit

extension UICollectionView {
    @objc func collectionView(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSliderCollectionViewCell.identifier, for: indexPath) as! ImageSliderCollectionViewCell
        cell.configure(image: "pakistan")
        cell.layer.borderWidth = 3
        cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.layer.cornerRadius = 5
        return cell
    }
    @objc func getCellCountSize() -> Int {
        return 0
    }
}

class FighterPicsCollection:UICollectionView{
    var picturesList:[String]!
    override func collectionView(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSliderCollectionViewCell.identifier, for: indexPath) as! ImageSliderCollectionViewCell
            cell.configure(image: picturesList[indexPath.row])
            cell.layer.borderWidth = 3
            cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            cell.layer.cornerRadius = 5
            return cell
    }
    func configure(list:[String]){
        picturesList = list
    }
    
    
    override func getCellCountSize() -> Int {
        return picturesList.count
    }
}

class FighterOperatorsCollection:UICollectionView{
    var picturesList:[String]!
    override func collectionView(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSliderCollectionViewCell.identifier, for: indexPath) as! ImageSliderCollectionViewCell
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 17
        cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.configure(image: picturesList[indexPath.row].lowercased())
        return cell
    }
    
    func configure(list:[String]){
        picturesList = list
    }
    
    override func getCellCountSize() -> Int {
        return picturesList.count
    }
}


class FighterDetailViewController: UIViewController {

    public static let reuseIdentifier = "FighterDetailViewController"
    @IBOutlet weak var fighterPicsCollectionView:FighterPicsCollection!
    @IBOutlet weak var FighterOperatorsCollectionView: FighterOperatorsCollection!
    
    
    
    
    
   
    @IBOutlet weak var viewFighterInfoBG: UIView!
    @IBOutlet var btnCollection: [UIButton]!
    
    
    
    var selectedFighter:Fighter!
    
    let picCollectionViewTag = 1
    let flagCollectionViewTag = 2
    
    @IBOutlet weak var btnGeneralInfo: UIButton!
    @IBOutlet weak var btnGeneralCharacteristics: UIButton!
    @IBOutlet weak var btnPerformance: UIButton!
    
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
        
        fighterPicsCollectionView.tag = 1
        FighterOperatorsCollectionView.tag = 2
        
        fighterPicsCollectionView.register(ImageSliderCollectionViewCell.nib(), forCellWithReuseIdentifier: ImageSliderCollectionViewCell.identifier)
        FighterOperatorsCollectionView.register(ImageSliderCollectionViewCell.nib(), forCellWithReuseIdentifier: ImageSliderCollectionViewCell.identifier)
        
        
        fighterPicsCollectionView.configure(list: selectedFighter.picturesList)
        
        FighterOperatorsCollectionView.configure(list: selectedFighter.getFlagList())
        
        
        for btn in btnCollection {
            btn.layer.cornerRadius = 3
        }
        
        if selectedFighter == nil {
            print("you are idiot")
            navigationController?.popViewController(animated: true)
        }else{
            navigationItem.title = selectedFighter.flightname
            
            
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle.fill") , style: .plain, target: self, action: #selector(moreInfo))
        }
        
       
    }
    
    @objc func moreInfo(){
        print("right button tapped")
    }
    
    @IBAction func onClickGeneralInfo(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: InformationViewController.identifier) as! InformationViewController
        print("clicked1")
        vc.title = "General Information"
        vc.configure(list: selectedFighter.getGeneralInfoList())
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func onClickGeneralCharacteristics(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: InformationViewController.identifier) as! InformationViewController
        print("clicked2")
        vc.title = "General Characteristics"
        vc.configure(list: selectedFighter.getGeneralCharachteristicsList())
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func onClickPerformance(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: InformationViewController.identifier) as! InformationViewController
        print("clicked3")
        vc.title = "Performance"
        vc.configure(list: selectedFighter.getPerformanceList())
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension FighterDetailViewController:UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if(collectionView.tag == picCollectionViewTag){
//            return selectedFighter.picturesList.count
//        }else {
//            return selectedFighter.flightOperatorsList.count
//        }
        return collectionView.getCellCountSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if(collectionView.tag == picCollectionViewTag){
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSliderCollectionViewCell.identifier, for: indexPath) as! ImageSliderCollectionViewCell
//            cell.configure(image: selectedFighter.picturesList[indexPath.row])
//            cell.layer.borderWidth = 3
//            cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            cell.layer.cornerRadius = 5
//            return cell
//        }else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSliderCollectionViewCell.identifier, for: indexPath) as! ImageSliderCollectionViewCell
//            cell.layer.borderWidth = 1
//            cell.layer.cornerRadius = 17
//            cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            let flagName = selectedFighter.flightOperatorsList[indexPath.row].countryName
//            cell.configure(image: flagName.lowercased())
//            return cell
//        }
        return collectionView.collectionView(collectionView: collectionView, indexPath: indexPath)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you touched me \(indexPath.row)")
    }
    
}
