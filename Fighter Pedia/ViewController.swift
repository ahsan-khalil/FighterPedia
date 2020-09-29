//
//  ViewController.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 29/09/2020.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet var btnList: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for btn in btnList {
            btn.layer.cornerRadius  = 10
        }
        
        labelTitle.layer.masksToBounds = true
        labelTitle.layer.cornerRadius = 10
        
    }


}

