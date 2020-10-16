//
//  SingleSmallPicCollectionView.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 16/10/2020.
//

import Foundation
import UIKit

class SinglePicCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var imageDataList:[ImageDataContainer]!
    override func getCellRowCount() -> Int {
        imageDataList.count
    }
    override func getSelectedCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleSmallPicCollectionViewCell.identifier, for: indexPath) as! SingleSmallPicCollectionViewCell
        let im = Utility.resizeImage(image: imageDataList[indexPath.row].uiImage, newWidth:60)
        cell.setImage(image: im)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.layer.cornerRadius = 3
        return cell
    }
    func setDataSource(imgList:[ImageDataContainer]){
        imageDataList = imgList
    }
    
    func getDataSource() -> [ImageDataContainer] {
        return imageDataList
    }
    
    func appendElement(element:ImageDataContainer){
        self.imageDataList.append(element)
    }
    
    func removeElement(index:Int){
        self.imageDataList.remove(at: index)
    }
    
    
    override func resizeCell() -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    override func deleteSelectedRow(index:IndexPath){
        removeElement(index: index.row)
        self.deleteItems(at: [index])
        self.reloadData()
    }
}
