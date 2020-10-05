//
//  ErasViewController.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 30/09/2020.
//

import UIKit


class ErasViewController: UIViewController {

    public static let identifier = "ErasViewController"
    
    @IBOutlet var erasTableView: UITableView!
    private var dateRangeList = [ErasYearRangeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        erasTableView.delegate = self
        erasTableView.dataSource = self
        erasTableView.separatorColor = UIColor.clear
        erasTableView.backgroundColor = #colorLiteral(red: 0.06467689574, green: 0.04641190916, blue: 0.1739622355, alpha: 1)
        erasTableView.register(ErasTableViewCell.nib(), forCellReuseIdentifier: ErasTableViewCell.identifier)
    }
    
    func setDateRangeList(list:[ErasYearRangeModel]){
        dateRangeList = list
    }

}

extension ErasViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dateRangeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ErasTableViewCell.identifier, for: indexPath) as! ErasTableViewCell
        cell.configureDate(from: dateRangeList[indexPath.row].StartYear,to: dateRangeList[indexPath.row].EndYear)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("i was touched")
        let vc = storyboard?.instantiateViewController(identifier: FighterCollectionViewController.reuseIdentifier) as! FighterCollectionViewController
        let tempRange = dateRangeList[indexPath.row]
        
        vc.setFighterList(fighterList: FighterRepository.getFightersInYearsRange(StartYear: tempRange.StartYear, EndYear: tempRange.EndYear))
        vc.title = "Collection (\(tempRange.StartYear) - \(tempRange.EndYear))"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

