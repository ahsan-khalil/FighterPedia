//
//  FighterDetailViewController.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 01/10/2020.
//

import UIKit

extension UICollectionView {
    @objc func collectionView(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                            ImageSliderCollectionViewCell.identifier,
                                                         for: indexPath) as? ImageSliderCollectionViewCell {
            cell.configure(image: "pakistan")
            cell.layer.borderWidth = 3
            cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            cell.layer.cornerRadius = 5
            return cell
        } else {
            print("CollectionView Cell is nil")
            return UICollectionViewCell()
        }
    }
    @objc func getCellCountSize() -> Int {
        return 0
    }
}
class FighterPicsCollection: UICollectionView {
    var picturesList: [String]!
    override func collectionView(collectionView: UICollectionView,
                                 indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = collectionView.dequeueReusableCell(
                                    withReuseIdentifier: ImageSliderCollectionViewCell.identifier,
                                    for: indexPath) as? ImageSliderCollectionViewCell {
                let image = Utility.retriveImage(imageName: picturesList[indexPath.row])
                if image != nil {
                    cell.configure(image: image!)
                } else {
                    cell.configure(image: picturesList[indexPath.row])
                }
                cell.layer.borderWidth = 3
                cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                cell.layer.cornerRadius = 5
                return cell
            } else {
                print("FighterPicsCollection Cell is nil")
                return UICollectionViewCell()
            }
    }
    func configure(list: [String]) {
        picturesList = list
    }
    override func getCellCountSize() -> Int {
        return picturesList.count
    }
}
class FighterOperatorsCollection: UICollectionView {
    var picturesList: [String]!
    override func collectionView(collectionView: UICollectionView,
                                 indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
                                withReuseIdentifier: ImageSliderCollectionViewCell.identifier,
            for: indexPath) as? ImageSliderCollectionViewCell {
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 17
            cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            cell.configure(image: picturesList[indexPath.row].lowercased())
            return cell
        } else {
            print("Fighter Operators Collection Cell is nil")
            return UICollectionViewCell()
        }
    }
    func configure(list: [String]) {
        picturesList = list
    }
    override func getCellCountSize() -> Int {
        return picturesList.count
    }
}
class FighterDetailViewController: UIViewController {

    public static let reuseIdentifier = "FighterDetailViewController"
    @IBOutlet weak var fighterPicsCollectionView: FighterPicsCollection!
    @IBOutlet weak var fighterOperatorsCollectionView: FighterOperatorsCollection!
    @IBOutlet weak var viewFighterInfoBG: UIView!
    @IBOutlet var btnCollection: [UIButton]!
    //
    var selectedFighter: FighterModel!
    //
    let picCollectionViewTag = 1
    let flagCollectionViewTag = 2
    //
    @IBOutlet weak var btnGeneralInfo: UIButton!
    @IBOutlet weak var btnGeneralCharacteristics: UIButton!
    @IBOutlet weak var btnPerformance: UIButton!
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        fighterPicsCollectionView.delegate = self
        fighterPicsCollectionView.dataSource = self
        fighterOperatorsCollectionView.delegate = self
        fighterOperatorsCollectionView.dataSource = self
        fighterPicsCollectionView.layer.cornerRadius = 5
        fighterOperatorsCollectionView.layer.cornerRadius = 3
        viewFighterInfoBG.layer.cornerRadius = 5
        viewFighterInfoBG.layer.borderWidth = 2
        viewFighterInfoBG.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //
        fighterPicsCollectionView.tag = 1
        fighterOperatorsCollectionView.tag = 2
        //
        fighterPicsCollectionView.register(ImageSliderCollectionViewCell.nib(),
                                           forCellWithReuseIdentifier: ImageSliderCollectionViewCell.identifier)
        fighterOperatorsCollectionView.register(ImageSliderCollectionViewCell.nib(),
                                                forCellWithReuseIdentifier: ImageSliderCollectionViewCell.identifier)
        //
        fighterPicsCollectionView.configure(list: selectedFighter.picturesList)
        fighterOperatorsCollectionView.configure(list: selectedFighter.getFlagList())
        for btn in btnCollection {
            btn.layer.cornerRadius = 3
        }
        if selectedFighter == nil {
            print("select fighter first")
            navigationController?.popViewController(animated: true)
        } else {
            navigationItem.title = selectedFighter.flightname
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                                image: UIImage(systemName: "info.circle.fill"), style: .plain,
                                target: self, action: #selector(moreInfo))
        }
    }
    @objc func moreInfo() {
        print("right button tapped")
    }
    @IBAction func onClickGeneralInfo(_ sender: UIButton) {
        if let viewController = storyboard?.instantiateViewController(
                                            identifier: InformationViewController.identifier)
                                            as? InformationViewController {
            print("clicked1")
            viewController.title = "General Information"
            viewController.configure(list: selectedFighter.getGeneralInfoList())
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            print("Information View Controller Can't be Loaded")
        }
    }
    @IBAction func onClickGeneralCharacteristics(_ sender: UIButton) {
        if let viewController = storyboard?.instantiateViewController(
                                            identifier: InformationViewController.identifier)
                                            as? InformationViewController {
            print("clicked2")
            viewController.title = "General Characteristics"
            viewController.configure(list: selectedFighter.getGeneralCharachteristicsList())
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            print("Information View Controller Can't be Loaded")
        }
    }
    @IBAction func onClickPerformance(_ sender: UIButton) {
        if let viewController = storyboard?.instantiateViewController(
                                            identifier: InformationViewController.identifier)
                                            as? InformationViewController {
            print("clicked3")
            viewController.title = "Performance"
            viewController.configure(list: selectedFighter.getPerformanceList())
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            print("Information View Controller Can't be Loaded")
        }
    }
}
extension FighterDetailViewController: UICollectionViewDataSource,
                                      UICollectionViewDelegate,
                                      UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.getCellCountSize()
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.collectionView(collectionView: collectionView, indexPath: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you touched me \(indexPath.row)")
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == fighterPicsCollectionView {
            let width = collectionView.frame.width -
                        collectionView.contentInset.left -
                        collectionView.contentInset.right  -
                        collectionView.safeAreaInsets.left - 10
            let height = collectionView.frame.height -
                            collectionView.contentInset.top -
                            collectionView.contentInset.bottom -
                            collectionView.safeAreaInsets.top - 10
            return CGSize(width: width, height: height)
        } else {
            return CGSize(width: 32, height: 32)
        }
    }
}
