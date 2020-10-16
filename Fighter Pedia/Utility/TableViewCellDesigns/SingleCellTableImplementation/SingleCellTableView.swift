//
//  SingleCellTableView.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 16/10/2020.
//

import Foundation
import UIKit

class UISingleCeTableView:UITableView {
    var mtextData:[String]!
    func setDataSource(textData:[String]){
        mtextData = textData
        reloadData()
    }
    
    func getDataSource() -> [String] {
        return mtextData
    }
    
    func appendElement(element:String){
        self.mtextData.append(element)
    }
    
    func removeElement(index:Int){
        self.mtextData.remove(at: index)
    }
    
    override func getCellRowCount() -> Int {
        print("count: = \(mtextData.count)")
        return mtextData.count
    }
    
    override func getSelectedCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SingleCellTableViewCell.identifier) as! SingleCellTableViewCell
        
        cell.setData(text: mtextData[indexPath.row])
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.layer.cornerRadius = 3
        
        return cell
    }
    
    override func slideLeft(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            mtextData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
            //tableView.reloadData()
        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }
    
    
    
    override func onClickEditWithAlertController(index: IndexPath, viewController:UIViewController) {
        let alert = UIAlertController(title: "Edit", message: "Enter Updated Name", preferredStyle: .alert)

        
        alert.addTextField { (textField) in
            textField.text = self.mtextData[index.row]
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            self.mtextData[index.row] = (textField?.text)!
            self.reloadData()
        }))

        // 4. Present the alert.
        viewController.present(alert, animated: true, completion: nil)
    }
}
