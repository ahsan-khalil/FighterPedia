//
//  DoubleCellTableView.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 16/10/2020.
//

import Foundation
import UIKit

class TwoCellTableView:UITableView {
    var mdata:[KeyValuePair]!
    
    func setDataSource(Data mdata:[KeyValuePair]){
        self.mdata = mdata
    }
    
    func getDataSource() -> [KeyValuePair] {
        return mdata
    }
    
    func appendElement(element:KeyValuePair){
        self.mdata.append(element)
    }
    
    func removeElement(index:Int){
        self.mdata.remove(at: index)
    }
    
    
    override func getCellRowCount() -> Int {
        print("count: \(mdata.count)")
        return mdata.count
    }
    
    override func getSelectedCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DoubleCellTableViewCell.identifier) as! DoubleCellTableViewCell
        cell.setData(title: mdata[indexPath.row].title, description: mdata[indexPath.row].detail)
        print("2 table view: title: \(mdata[indexPath.row].title) , description: \(mdata[indexPath.row].detail)")
        
        return cell
    }
    
    
    override func slideLeft(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            mdata.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }
    
    override func onClickEditWithAlertController(index: IndexPath, viewController:UIViewController) {
        let alert = UIAlertController(title: "Edit", message: "Enter Updated Info", preferredStyle: .alert)

        
        alert.addTextField { (textField) in
            textField.text = self.mdata[index.row].title
        }
        
        alert.addTextField { (textField) in
            textField.text = self.mdata[index.row].detail
            
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            let textField1 = alert?.textFields![1]
            // Force unwrapping because we know it exists.
            self.mdata[index.row].title = (textField?.text)!
            self.mdata[index.row].detail = (textField1?.text)!
            self.reloadData()
        }))

        // 4. Present the alert.
        viewController.present(alert, animated: true, completion: nil)
    }
}
