//
//  ImageCollectionSelectorVC.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 14/10/2020.
//

import UIKit

protocol ImageCollectionSelectorDelegator: class {
    func getSelectedImageName(imgStr: String)
}
class ImageCollectionSelectorVC: UIViewController {
    weak var imgDelegate: ImageCollectionSelectorDelegator?
    var imgList: [ImageDataContainer]!
    static let identifier  = "ImageCollectionSelectorVC"
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.layer.borderWidth = 2
        collectionView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        collectionView.layer.cornerRadius = 5
        collectionView.delegate = self
        collectionView.dataSource = self
        imgList = WallpaperRepository.getOperatorsList()
        let tempCell = SingleSmallPicCollectionViewCell()
        collectionView.register(tempCell.nib(), forCellWithReuseIdentifier: SingleSmallPicCollectionViewCell.identifier)
        // Do any additional setup after loading the view.
    }
}
extension ImageCollectionSelectorVC: UICollectionViewDelegate,
                                     UICollectionViewDataSource,
                                     UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imgList.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SingleSmallPicCollectionViewCell.identifier,
            for: indexPath) as? SingleSmallPicCollectionViewCell {
            cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 3
            cell.setImage(image: imgList[indexPath.row].img)
            return cell
        } else {
            print("ImageCollectionSelectorVC Cell is nil")
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imgDelegate?.getSelectedImageName(imgStr: imgList[indexPath.row].img)
        print(imgList[indexPath.row].img)
        navigationController?.popViewController(animated: true)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
