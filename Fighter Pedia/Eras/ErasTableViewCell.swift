//
//  ErasTableViewCell.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 30/09/2020.
//

import UIKit

class ErasTableViewCell: UITableViewCell {

    static let identifier:String = "ErasTableViewCell"
    
    @IBOutlet weak var labelYearRange: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelYearRange.layer.masksToBounds = true
        labelYearRange.layer.cornerRadius = 5
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 25, left: 10, bottom: 25, right: 10))
    }
    
    func configureDate(from startYear:Int, to endYear:Int){
        labelYearRange.text = "\(startYear) - \(endYear)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    
    
}
