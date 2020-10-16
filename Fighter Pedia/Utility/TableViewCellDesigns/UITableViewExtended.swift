//
//  UITableViewExtended.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 16/10/2020.
//

import Foundation
import UIKit

extension UITableView {
    
    @objc func getCellRowCount() -> Int {
        0
    }
    @objc func getSelectedCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SingleCellTableViewCell.identifier)
        return cell!
    }
    
    @objc func slideLeft(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }
    
    @objc func onClickEditWithAlertController(index :IndexPath,viewController:UIViewController){
        print("Clicked")
    }
}
