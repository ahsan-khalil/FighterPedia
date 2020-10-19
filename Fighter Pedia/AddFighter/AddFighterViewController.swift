//
//  AddFighterViewController.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 12/10/2020.
//
import UIKit
import DatePicker



class AddFighterViewController: UIViewController {


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
        tableViewGI.appendElement(element: inputGIUsername.text!)
        tableViewGI.reloadData()
    }
    //General Characteristics
    @IBOutlet weak var inputGCTitle: UITextField!
    @IBOutlet weak var inputGCDetail: UITextField!
    
    @IBOutlet weak var tableViewGC: TwoCellTableView!
    @IBAction func onClickGCAddInfo(_ sender: UIButton) {
        tableViewGC.appendElement(element: KeyValuePair(title: inputGCTitle.text!, detail: inputGCDetail.text!))
        tableViewGC.reloadData()
    }
    
    //Performance
    @IBOutlet weak var inputP_Title: UITextField!
    @IBOutlet weak var inputP_detail: UITextField!
    @IBOutlet weak var tableViewP: TwoCellTableView!
    @IBAction func onClickP_Add(_ sender: UIButton) {
        tableViewP.appendElement(element: KeyValuePair(title: inputP_Title.text!, detail: inputP_detail.text!))
        tableViewP.reloadData()
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
        /*--- Start Input Delegation -----*/
        
        inputGIFirstFlight.delegate = self
        inputGIFirstFlight.tag = 1
        inputGIIntroduced.delegate = self
        inputGIIntroduced.tag = 2
        /*---  End Input Delegations -----*/
        /***************************************/
        
        
        /***************************************/
        /*---  Start GI Intialization -----*/
        tableViewGI.register(SingleCellTableViewCell.nib(), forCellReuseIdentifier: SingleCellTableViewCell.identifier)
        tableViewGI.setDataSource(textData: [String]())
        tableViewGI.rowHeight = UITableView.automaticDimension
        tableViewGI.estimatedRowHeight = 600
        /*---  End GI Intialization   -----*/
        /**************************************/
       
        
        
        /***************************************/
        /*---  Start GC Intialization -----*/
        let cell1 = DoubleCellTableViewCell()
        tableViewGC.register(cell1.nib(), forCellReuseIdentifier: DoubleCellTableViewCell.identifier)
        tableViewGC.setDataSource(Data: [KeyValuePair]())
        tableViewGC.rowHeight = UITableView.automaticDimension
        tableViewGC.estimatedRowHeight = 600
        /*---  End GC Intialization   -----*/
        /**************************************/
        
        
        
        
        /***************************************/
        /*---  Start Perf Intialization -----*/
        let cell2 = DoubleCellTableViewCell()
        tableViewP.register(cell2.nib(), forCellReuseIdentifier: DoubleCellTableViewCell.identifier)
        tableViewP.setDataSource(Data: [KeyValuePair]())
        tableViewP.rowHeight = UITableView.automaticDimension
        tableViewP.estimatedRowHeight = 600
        /*---  End Perf Intialization   -----*/
        /**************************************/
        
        
        
        /**********************************************/
        /*---  Start Operators Intialization -----*/
        let operatorCell = SingleSmallPicCollectionViewCell()
        collectionViewOperators.register(operatorCell.nib(), forCellWithReuseIdentifier: SingleSmallPicCollectionViewCell.identifier)
        collectionViewOperators.setDataSource(imgList: [ImageDataContainer]())
        /*---  End Operators Intialization   -----*/
        /**********************************************/
        
        
        
        
        /*******************************************/
        /*---  Start Images Intialization -----*/
        let imageCell = SingleSmallPicCollectionViewCell()
        collectionViewImages.register(imageCell.nib(), forCellWithReuseIdentifier: SingleSmallPicCollectionViewCell.identifier)
        collectionViewImages.setDataSource(imgList: [ImageDataContainer]())
        
        /*---  End Images Intialization   -----*/
        /*******************************************/
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Fighter", style: .plain, target: self, action: #selector(addFighter))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle.fill") , style: .plain, target: self, action: #selector(addFighter))
        
        
        
    
        //Colander View
//        let calendarView = CalendarView()
//
//        // Optional (but probably something you'll want to do): register cell and header types
//        // NOTE: both of these must conform to the Dated protcol, which mandates they have a Date? var with public get and set
//
//        // Wire up datasource and delegate
//        calendarView.dataSource = self
//        calendarView.delegate = self
//        view.addSubview(calendarView)
//
//        // Assuming you're using SnapKit...
//        calendarView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
        
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
        let GIUserList = tableViewGI.getDataSource()
        for user in GIUserList {
            userList.append(PrimaryUsersModel(username: user))
        }
        
        let generalInfoModel = GeneralInfoModel(role: role, manufacturer: manufacturer, designedBy: desginedBy, FirstFlight: date!, introduced: Int(introduced) ?? 1900, retired: retired, PrimaryUsers: userList, numberBuilt: numberBuilt)
        fighterModel.generalInfo = generalInfoModel
        
        var genCharacterisiticsList = [GeneralCharachteristicsModel]()
        let GCList = tableViewGC.getDataSource()
        for gc in GCList {
            genCharacterisiticsList.append(GeneralCharachteristicsModel(title: gc.title, detail: gc.detail))
        }
        fighterModel.generalCharacteristicsList = genCharacterisiticsList
        
        var genPerforamanceList = [PerformanceModel]()
        let Plist = tableViewP.getDataSource()
        for perf in Plist {
            genPerforamanceList.append(PerformanceModel(title: perf.title, detail: perf.detail))
        }
        
        fighterModel.peromanceList = genPerforamanceList
        
        var operatorModelList = [FlightOperatorModel]()
        let operatorImgList = collectionViewOperators.getDataSource()
        for op in operatorImgList {
            operatorModelList.append(FlightOperatorModel(countryName: op.img, countryFlag: op.img))
        }
        fighterModel.flightOperatorsList = operatorModelList
        
        var tempGallaryImagesList = [String]()
        let gallaryImgList = collectionViewImages.getDataSource()
        for img in gallaryImgList {
            Utility.saveImage(imageName: img.img, image: img.uiImage)
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
    
//    func getDateFromDatePicker() -> Date? {
//        
//        var tempdate:Date?
//        let minDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 1990)!
//                let maxDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 2030)!
//                let today = Date()
//                // Create picker object
//                let datePicker = DatePicker()
//                // Setup
//        
//                datePicker.setup(beginWith: today, min: minDate, max: maxDate) { (selected, date) in
//                    if selected, let selectedDate = date {
//                        print(selectedDate.string())
//                        tempdate = selectedDate
//                        
//                    } else {
//                        print("Cancelled")
//                        
//                    }
//                }
//                // Display
//                datePicker.show(in: self)
//        return tempdate
//    }
}



extension AddFighterViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tableView.getCellRowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.getSelectedCell(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        tableView.slideLeft(tableView, commit: editingStyle, forRowAt: indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.onClickEditWithAlertController(index :indexPath,viewController: self)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let refreshAlert = UIAlertController(title: "Alert", message: "Do You want to delete it?", preferredStyle: .alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
            (action: UIAlertAction!) in
            collectionView.deleteSelectedRow(index: indexPath)
                print("Handle Ok logic here")
          }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
          }))

        present(refreshAlert, animated: true, completion: nil)
    }
}

//A delegator to get data from next activity
extension AddFighterViewController:ImageCollectionSelectorDelegator {
    func getSelectedImageName(imgStr: String) {
        collectionViewOperators.appendElement(element: ImageDataContainer(img: imgStr,uiImage: UIImage(named: imgStr)!))
        collectionViewOperators.reloadData()
    }
}

extension AddFighterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            print("Image taken")
            let imageName = Utility.getUniqueImageName(picFormate: "png")
            collectionViewImages.appendElement(element: ImageDataContainer(img: imageName, uiImage: image))
            collectionViewImages.reloadData()
        } else {
            print("error in selecting")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}



//Tag = 1 InputGIFirstFlight
//Tag = 2 InputGIIntroduced
extension AddFighterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField.tag == 1 || textField.tag == 2){
            let minDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 1990)!
                    let maxDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 2030)!
                    let today = Date()
                    // Create picker object
                    let datePicker = DatePicker()
                    // Setup
            
                    datePicker.setup(beginWith: today, min: minDate, max: maxDate) { (selected, date) in
                        if selected, let selectedDate = date {
                            print(selectedDate.string())
                            
                            textField.text = Utility.convertDateToStr(date: selectedDate, formate: "dd MMM yyyy")
                            
                            
                        } else {
                            print("Cancelled")
                            
                        }
                    }
                    // Display
                    datePicker.show(in: self)
        }
        print("start editing")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("end editing")
    }
}
