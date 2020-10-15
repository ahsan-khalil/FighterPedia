//
//  SingleCellTableViewCell.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 14/10/2020.
//

import UIKit

class SingleCellTableViewCell: UITableViewCell {
    static let identifier = "SingleCellTableViewCell"
    @IBOutlet weak var labelText: UILabel!
    var dataStr:String!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelText.text = dataStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    func setData(text:String)
    {
        dataStr = text
        labelText.text = dataStr
        
    }
    
}
