//
//  GeneralInfoCollectionViewCell.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 02/10/2020.
//

import UIKit

class GeneralInfoCollectionViewCell: UICollectionViewCell {

    static let Identifier = "GeneralInfoCollectionViewCell"
    @IBOutlet weak var labelDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        UINib(nibName: Identifier, bundle: nil)
    }
    
    func configure(description:String){
        labelDescription.text = description
    }


}
