//
//  AddFighterViewController.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 12/10/2020.
//
/****************************************/
/*----------Start Table View Extensions--------*/
extension UITableView {
    @objc func getCellRowCount() -> Int {
        0
    }
    @objc func getSelectedCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SingleCellTableViewCell.identifier)
        return cell!
    }
    
    
}


class UISingleCeTableView:UITableView {
    var mtextData:[String]!
    func setData(textData:[String]){
        mtextData = textData
        reloadData()
    }
    
    override func getCellRowCount() -> Int {
        return mtextData.count
    }
    
    override func getSelectedCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SingleCellTableViewCell.identifier) as! SingleCellTableViewCell
        
        cell.setData(text: mtextData[indexPath.row])
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.layer.cornerRadius = 3
        return cell
    }
}

class TwoCellTableView:UITableView {
    var mdata:[KeyValuePair]!
    override func getCellRowCount() -> Int {
        print("count: \(mdata.count)")
        return mdata.count
    }
    
    override func getSelectedCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DoubleCellTableViewCell.identifier) as! DoubleCellTableViewCell
        cell.setData(title: mdata[indexPath.row].title, description: mdata[indexPath.row].detail)
        print("2 table view: title: \(mdata[indexPath.row].title) , description: \(mdata[indexPath.row].detail)")
        
        return cell
    }
    func setData(Data mdata:[KeyValuePair]){
        self.mdata = mdata
        reloadData()
    }
}
/*----------End Table View Extensions--------*/
/****************************************/

/****************************************/
/*----------Start Collection View Extensions--------*/
extension UICollectionView {
    @objc func getCellRowCount() -> Int {
        0
    }
    @objc func getSelectedCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: SingleSmallPicCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    @objc func resizeCell() -> CGSize {
        return CGSize(width: 240, height: 240)
    }
}

class SinglePicCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var imageDataList:[UIImage]!
    override func getCellRowCount() -> Int {
        imageDataList.count
    }
    override func getSelectedCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleSmallPicCollectionViewCell.identifier, for: indexPath) as! SingleSmallPicCollectionViewCell
        let im = Utility.resizeImage(image: imageDataList[indexPath.row], newWidth:60)
        

        
        cell.setImage(image: im)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.layer.cornerRadius = 3
        return cell
    }
    func setData(imgList:[UIImage]){
        imageDataList = imgList
        reloadData()
    }
    
    override func resizeCell() -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}

/*----------End Table View Extensions--------*/
/****************************************/

import UIKit

class AddFighterViewController: UIViewController {

    var operatorImgList = [ImageDataContainer]()
    var gallaryImgList = [ImageDataContainer]()
    var operatorUIImageList = [UIImage]()
    var selectedUIImagesList = [UIImage]()
    
    //GI
    var GIUserList = [String]()
    //GC
    var GCList = [KeyValuePair]()
    //P
    var Plist = [KeyValuePair]()
    
    
    static let identifier = "AddFighterViewCollection"
    @IBOutlet weak var scrollView: UIScrollView!
    
    // General Info
    @IBOutlet weak var inputGIRole: UITextField!
    @IBOutlet weak var inputGIManufacturer: UITextField!
    @IBOutlet weak var inputGIDesignedBy: UITextField!
    @IBOutlet weak var inputGIFirstFlight: UITextField!
    @IBOutlet weak var inputGIIntroduced: UITextField!
    @IBOutlet weak var inputGIRetired: UITextField!
    @IBOutlet weak var inputGINumberBuilt: UITextField!
    @IBOutlet weak var inputGIUsername: UITextField!
    @IBOutlet weak var tableViewGI: UISingleCeTableView!
    @IBAction func onClickAddGIUser(_ sender: UIButton) {
        GIUserList.append(inputGIUsername.text!)
        tableViewGI.setData(textData: GIUserList)
    }
    //General Characteristics
    @IBOutlet weak var inputGCTitle: UITextField!
    @IBOutlet weak var inputGCDetail: UITextField!
    
    @IBOutlet weak var tableViewGC: TwoCellTableView!
    @IBAction func onClickGCAddInfo(_ sender: UIButton) {
        GCList.append(KeyValuePair(title: inputGCTitle.text!, detail: inputGCDetail.text!))
        tableViewGC.setData(Data: GCList)
    }
    
    //Performance
    @IBOutlet weak var inputP_Title: UITextField!
    @IBOutlet weak var inputP_detail: UITextField!
    @IBOutlet weak var tableViewP: TwoCellTableView!
    @IBAction func onClickP_Add(_ sender: UIButton) {
        Plist.append(KeyValuePair(title: inputP_Title.text!, detail: inputP_detail.text!))
        tableViewP.setData(Data: Plist)
    }
    
    //Operators
    @IBOutlet weak var collectionViewOperators: SinglePicCollectionView!
    @IBAction func onClickOperators_Add(_ sender: UIButton) {
        let vc  = storyboard?.instantiateViewController(identifier: ImageCollectionSelectorVC.identifier) as! ImageCollectionSelectorVC
        vc.imgDelegate = self
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //images
    @IBOutlet weak var collectionViewImages: SinglePicCollectionView!
    @IBAction func onClickImages_Add(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    
    @IBOutlet var All_labelCollection: [UILabel]!
    @IBOutlet var viewCollection: [UIView]!
    @IBOutlet var collectionViewList: [UICollectionView]!
    @IBOutlet var collection_Button: [UIButton]!
    @IBOutlet var tableViewCollection: [UITableView]!
    @IBOutlet weak var inputFighterName: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Fighter"
        /***************************************/
        /*---  Start Rounding   Layers-----*/
        for label in All_labelCollection {
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 5
            
        }
        for view in viewCollection {
            view.layer.masksToBounds = true
            view.layer.cornerRadius = 5
        }
        for collection in collectionViewList {
            collection.layer.masksToBounds = true
            collection.layer.cornerRadius = 5
        }
        for btn in collection_Button {
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 5
        }
        
        for table in tableViewCollection {
            table.layer.masksToBounds = true
            table.layer.cornerRadius = 5
        }
        
        /*---  End Rounding Layers    -----*/
        /***************************************/
        
        /***************************************/
        /*---  Start Collections Delegation -----*/
        tableViewGI.delegate = self
        tableViewGI.dataSource = self
        tableViewGC.delegate = self
        tableViewGC.dataSource = self
        tableViewP.delegate = self
        tableViewP.dataSource = self
        
        collectionViewOperators.delegate = self
        collectionViewImages.delegate = self
        collectionViewOperators.dataSource = self
        collectionViewImages.dataSource = self
        
        /*---  End Collection Delegations -----*/
        /***************************************/
        
        
        /***************************************/
        /*---  Start GI Intialization -----*/
        
        tableViewGI.register(SingleCellTableViewCell.nib(), forCellReuseIdentifier: SingleCellTableViewCell.identifier)
        
        tableViewGI.setData(textData: GIUserList)
        
        
        
        
        
        /*---  End GI Intialization   -----*/
        /**************************************/
       
        /***************************************/
        /*---  Start GC Intialization -----*/
        
        
        let cell1 = DoubleCellTableViewCell()
        tableViewGC.register(cell1.nib(), forCellReuseIdentifier: DoubleCellTableViewCell.identifier)
        
        tableViewGC.setData(Data: GCList)
        
        
        /*---  End GC Intialization   -----*/
        /**************************************/
        
        /***************************************/
        /*---  Start Perf Intialization -----*/
        
        let cell2 = DoubleCellTableViewCell()
        tableViewP.register(cell2.nib(), forCellReuseIdentifier: DoubleCellTableViewCell.identifier)
        
        tableViewP.setData(Data: Plist)
        
        
        /*---  End Perf Intialization   -----*/
        /**************************************/
        
        /**********************************************/
        /*---  Start Operators Intialization -----*/
        
        let operatorCell = SingleSmallPicCollectionViewCell()
        collectionViewOperators.register(operatorCell.nib(), forCellWithReuseIdentifier: SingleSmallPicCollectionViewCell.identifier)
        collectionViewOperators.setData(imgList: [UIImage]())
        
        
        /*---  End Operators Intialization   -----*/
        /**********************************************/
        
        /*******************************************/
        /*---  Start Images Intialization -----*/
        let imageCell = SingleSmallPicCollectionViewCell()
        collectionViewImages.register(imageCell.nib(), forCellWithReuseIdentifier: SingleSmallPicCollectionViewCell.identifier)
        collectionViewImages.setData(imgList: [UIImage]())
        
        /*---  End Images Intialization   -----*/
        /*******************************************/
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Fighter", style: .plain, target: self, action: #selector(addFighter))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle.fill") , style: .plain, target: self, action: #selector(addFighter))
        
    }
    @objc func addFighter(){
        
        
        
        let fighterModel = FighterModel()
        fighterModel.flightname = inputFighterName.text!
        
        //GeneralInfo
        let role = inputGIRole.text!
        let manufacturer = inputGIManufacturer.text!
        let desginedBy = inputGIDesignedBy.text!
        let firstFlight = inputGIFirstFlight.text!
        let introduced = inputGIIntroduced.text!
        let retired = inputGIRetired.text!
        let numberBuilt = inputGINumberBuilt.text!
        
        let date = Utility.dateFormator(date: firstFlight)
        
        //Primary Users
        var userList = [PrimaryUsersModel]()
        for user in GIUserList {
            userList.append(PrimaryUsersModel(username: user))
        }
        
        let generalInfoModel = GeneralInfoModel(role: role, manufacturer: manufacturer, designedBy: desginedBy, FirstFlight: date!, introduced: Int(introduced) ?? 1900, retired: retired, PrimaryUsers: userList, numberBuilt: numberBuilt)
        
        fighterModel.generalInfo = generalInfoModel
        
        var genCharacterisiticsList = [GeneralCharachteristicsModel]()
        for gc in GCList {
            genCharacterisiticsList.append(GeneralCharachteristicsModel(title: gc.title, detail: gc.detail))
        }
        fighterModel.generalCharacteristicsList = genCharacterisiticsList
        
        var genPerforamanceList = [PerformanceModel]()
        for perf in Plist {
            genPerforamanceList.append(PerformanceModel(title: perf.title, detail: perf.detail))
        }
        
        fighterModel.peromanceList = genPerforamanceList
        
        var operatorModelList = [FlightOperatorModel]()
        for op in operatorImgList {
            operatorModelList.append(FlightOperatorModel(countryName: op.img, countryFlag: op.img))
        }
        
        fighterModel.flightOperatorsList = operatorModelList
        
        var tempGallaryImagesList = [String]()
        for img in gallaryImgList {
            tempGallaryImagesList.append(img.img)
        }
        
        fighterModel.picturesList = tempGallaryImagesList
        
        print(fighterModel.flightname)
        print(fighterModel.flightOperatorsList.count)
        print(fighterModel.flightOperatorsList[0].countryName)
        print(fighterModel.picturesList.count)
        print(fighterModel.picturesList[0])
        
        print("right button tapped")
        FighterRepository.AddFighterList(fighterModel: fighterModel)
        
    }
}



extension AddFighterViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tableView.getCellRowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.getSelectedCell(tableView, cellForRowAt: indexPath)
    }
    
    
}

extension AddFighterViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.getCellRowCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.getSelectedCell(collectionView, cellForItemAt: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.resizeCell()
    }
}


extension AddFighterViewController:ImageCollectionSelectorDelegator {
    func getSelectedImageName(imgStr: String) {
        print(imgStr)
        self.operatorImgList.append(ImageDataContainer(img: imgStr))
        self.operatorUIImageList.append(UIImage(named: imgStr)!)
        collectionViewOperators.setData(imgList: self.operatorUIImageList)
    }
}

extension AddFighterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            print(image)
            
            
            print("Image taken")
            let imageName = Utility.getUniqueImageName(picFormate: "png")
            Utility.saveImage(imageName: imageName, image: image)
            self.selectedUIImagesList.append(image)
            self.gallaryImgList.append(ImageDataContainer(img: imageName))
            collectionViewImages.setData(imgList: self.selectedUIImagesList)
        } else {
            print("error in selecting")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
