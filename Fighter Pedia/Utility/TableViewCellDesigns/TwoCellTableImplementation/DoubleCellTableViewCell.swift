//
//  DoubleCellTableViewCell.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 14/10/2020.
//

import UIKit
class DoubleCellTableViewCell: UITableViewCell {
    static let identifier = "DoubleCellTableViewCell"
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var mMainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelTitle.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        labelTitle.layer.borderWidth = 1
        labelTitle.layer.cornerRadius = 3
        labelDescription.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        labelDescription.layer.borderWidth = 1
        labelDescription.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func nib() -> UINib {
        return UINib(nibName: DoubleCellTableViewCell.identifier, bundle: nil)
    }
    func setData(title: String, description: String) {
        labelTitle.text = title
        labelDescription.text = description
    }
    override func prepareForReuse() {
         super.prepareForReuse()
        labelTitle.text = ""
        labelDescription.text = ""
    }
}
