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
        if let viewController = storyboard?.instantiateViewController(
                            identifier: ErasViewController.identifier)
                            as? ErasViewController {
            viewController.modalPresentationStyle = .fullScreen
            viewController.title = "Eras"
            let dateRangeList = FighterRepository.getErasList()
            viewController.setDateRangeList(list: dateRangeList)
            self.navigationController?.pushViewController(viewController, animated: true)
        } else {
            print("ErasViewController is not instantiated")
        }
    }
    @IBAction func onClickNameBtn(_ sender: Any) {
        if let viewController = storyboard?.instantiateViewController(
                    identifier: FighterCollectionViewController.reuseIdentifier)
                    as? FighterCollectionViewController {
            viewController.setFighterList(fighterList: FighterRepository.getFighterList())
            self.navigationController?.pushViewController(viewController, animated: true)
        } else {
            print("FighterCollectionViewController is not instantiated")
        }
    }
}
