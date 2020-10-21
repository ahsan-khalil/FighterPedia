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
        //FighterRepository.AddFighterList()
        FighterRepository.displayData()
        // Do any additional setup after loading the view.
        for btn in btnList {
            btn.layer.cornerRadius  = 5
        }
        
        labelTitle.layer.masksToBounds = true
        labelTitle.layer.cornerRadius = 5
    }
    
    @IBAction func onClickEras(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: ErasViewController.identifier) as! ErasViewController
                vc.modalPresentationStyle = .fullScreen
        vc.title = "Eras"
        let dateRangeList = FighterRepository.getErasList()
        vc.setDateRangeList(list: dateRangeList)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func onClickNameBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: FighterCollectionViewController.reuseIdentifier) as! FighterCollectionViewController
        
        vc.setFighterList(fighterList: FighterRepository.getFighterList())
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}

