//
//  SingleSmallPicCollectionViewCell.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 14/10/2020.
//

import UIKit

class SingleSmallPicCollectionViewCell: UICollectionViewCell {

    static let identifier = "SingleSmallPicCollectionViewCell"
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func nib() -> UINib {
        return UINib(nibName: SingleSmallPicCollectionViewCell.identifier, bundle: nil)
    }
    
    func setImage(image:String){
        img.image = UIImage(named: image)
    }
    
    func setImage(image:UIImage){
        img.image = image
    }

}
