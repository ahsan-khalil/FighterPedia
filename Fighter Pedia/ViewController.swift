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
    
    @IBAction func onClickEras(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: ErasViewController.identifier) as! ErasViewController
                vc.modalPresentationStyle = .fullScreen
        vc.title = "Eras"
        var dateRangeList = [ErasYearRangeModel]()
        dateRangeList.append(ErasYearRangeModel(StartYear: 1900, EndYear: 1910))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1911, EndYear: 1920))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1921, EndYear: 1930))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1931, EndYear: 1940))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1941, EndYear: 1950))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1951, EndYear: 1960))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1961, EndYear: 1970))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1971, EndYear: 1980))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1981, EndYear: 1990))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1991, EndYear: 2000))
        dateRangeList.append(ErasYearRangeModel(StartYear: 2001, EndYear: 2010))
        dateRangeList.append(ErasYearRangeModel(StartYear: 2011, EndYear: 2020))
        vc.setDateRangeList(list: dateRangeList)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}

