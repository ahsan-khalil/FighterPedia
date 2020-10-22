//
//  FighterCollectionViewCell.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 30/09/2020.
//

import UIKit

class FighterCollectionViewCell: UICollectionViewCell {
    public static let reuseIdentifier = "FighterCollectionViewCell"
    @IBOutlet weak var labelFlightName: UILabel!
    @IBOutlet weak var imageViewFlight: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        labelFlightName.layer.borderWidth = 1
        labelFlightName.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        labelFlightName.layer.cornerRadius = 5
        imageViewFlight.layer.masksToBounds = true
        imageViewFlight.layer.cornerRadius = 5
        imageViewFlight.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imageViewFlight.layer.borderWidth = 2
    }
    func configure(flightName: String, flightImage: UIImage) {
        labelFlightName.text = flightName
        imageViewFlight.image = flightImage
    }
    static func nib() -> UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
