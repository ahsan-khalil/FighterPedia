//
//  UICollectionViewExtended.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 16/10/2020.
//

import Foundation
import UIKit

extension UICollectionView {
    @objc func getCellRowCount() -> Int {
        0
    }
    @objc func getSelectedCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: SingleSmallPicCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    @objc func resizeCell() -> CGSize {
        return CGSize(width: 240, height: 240)
    }
    
    @objc func deleteSelectedRow(index:IndexPath){
        print("delete index")
    }
}
