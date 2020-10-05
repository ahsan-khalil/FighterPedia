//
//  CharacteristicsCollectionViewCell.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 02/10/2020.
//

import UIKit

class CharacteristicsCollectionViewCell: UICollectionViewCell {

    static let Identifier = "CharacteristicsCollectionViewCell"
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelExplanation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        UINib(nibName: Identifier, bundle: nil)
    }
    
    func config(title:String,explanation:String){
        labelTitle.text = title
        labelExplanation.text = explanation
    }

}
