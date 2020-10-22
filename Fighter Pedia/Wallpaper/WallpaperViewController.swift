//
//  WallpaperViewController.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 08/10/2020.
//

import UIKit

class WallpaperViewController: UIViewController {
    static let identifier = "wallpaperViewController"
    @IBOutlet weak var wallpeperCollectionViewContainer: UICollectionView!
    @IBOutlet weak var buttonGroupView: UIView!
    var wallpaperList: [ImageDataContainer]!
    @IBOutlet weak var btnPrevious: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        wallpeperCollectionViewContainer.delegate = self
        wallpeperCollectionViewContainer.dataSource = self
        self.wallpaperList = WallpaperRepository.getWallapaperList()
        wallpeperCollectionViewContainer.layer.cornerRadius = 7
        buttonGroupView.layer.cornerRadius = 7
        btnNext.layer.cornerRadius = 4
        btnPrevious.layer.cornerRadius = 4
        //
        btnPrevious.layer.borderWidth = 1
        btnNext.layer.borderWidth  = 1
        btnNext.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnPrevious.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    @IBAction func onClickPrevious(_ sender: UIButton) {
        wallpeperCollectionViewContainer.scrollToPreviousItem()
    }
    @IBAction func onClickNext(_ sender: UIButton) {
        wallpeperCollectionViewContainer.scrollToNextItem()
    }
}
extension WallpaperViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        wallpaperList.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WallpaperCollectionViewCell.identifier,
            for: indexPath) as? WallpaperCollectionViewCell {
            cell.layer.borderWidth = 2
            cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            cell.layer.cornerRadius = 5
            cell.configure(imageStr: self.wallpaperList[indexPath.row].img)
            return cell
       } else {
            print("WallpaperViewController Cell is nil")
            return UICollectionViewCell()
       }
    }
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        //print("tapped")
        if let viewController = storyboard?.instantiateViewController(
            identifier: SingleWallpaperViewController.identifier) as? SingleWallpaperViewController {
            viewController.setImage(img: wallpaperList[indexPath.row].img)
            self.navigationItem.backButtonTitle = "Back"
            self.navigationController?.pushViewController(viewController, animated: true)
        } else {
            print("SingleWallpaper View controller can't be instantiated")
        }
        //collectionView.scrollToNextItem()
    }
}
extension UICollectionView {
    func scrollToNextItem() {
        let collectionBounds = self.bounds
        let contentOffset = CGFloat(floor(self.contentOffset.x + collectionBounds.size.width))
//        print("<---------scroll to next-------->")
//        print("contenOffset: \(contentOffset)")
//        print("self.contenOffset.x: \(self.contentOffset.x)")
//        print("bounds.size: \(bounds.size)")
//        print("bounds.width: \(bounds.width)")
//        print("bounds.size.width: \(bounds.size.width)")
//        print("max width: \(contentSize.width - bounds.width + contentInset.right)")
        guard contentOffset <= contentSize.width + contentInset.right else { return }
        self.moveToFrame(contentOffset: contentOffset)
    }
    func scrollToPreviousItem() {
        let collectionBounds = self.bounds
        let contentOffset = CGFloat(floor(self.contentOffset.x - collectionBounds.size.width))
        print("<---------scroll to previous-------->")
        print("contenOffset: \(contentOffset)")
        print("self.contenOffset.x: \(self.contentOffset.x)")
        print("bounds.size: \(bounds.size)")
        print("bounds.width: \(bounds.width)")
        print("bounds.size.width: \(bounds.size.width)")
        print("max width: \(contentSize.width - bounds.width + contentInset.right)")
        if contentOffset >= 0 {
            self.moveToFrame(contentOffset: contentOffset)
        } else {
            self.moveToFrame(contentOffset: 0)
        }
    }
    func moveToFrame(contentOffset: CGFloat) {
        self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
    }
}
