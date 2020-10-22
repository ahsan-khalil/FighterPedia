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
        if Utility.validateInputForEmptyFields(inputCollection: [inputGIUsername]) {
            tableViewGI.appendElement(element: inputGIUsername.text!)
            tableViewGI.reloadData()
        } else {
            Utility.showToast(message: "Enter Username First", viewController: self)
        }
    }
    //General Characteristics
    @IBOutlet weak var inputGCTitle: UITextField!
    @IBOutlet weak var inputGCDetail: UITextField!
    @IBOutlet weak var tableViewGC: TwoCellTableView!
    @IBAction func onClickGCAddInfo(_ sender: UIButton) {
        if Utility.validateInputForEmptyFields(inputCollection: [inputGCTitle, inputGCDetail]) {
            tableViewGC.appendElement(element: KeyValuePair(title: inputGCTitle.text!, detail: inputGCDetail.text!))
            tableViewGC.reloadData()
        } else {
            Utility.showToast(message: "Enter Title and Detail First", viewController: self)
        }
    }
    //Performance
    @IBOutlet weak var inputPerformanceTitle: UITextField!
    @IBOutlet weak var inputPerformancedetail: UITextField!
    @IBOutlet weak var tableViewP: TwoCellTableView!
    @IBAction func onClickP_Add(_ sender: UIButton) {
        if Utility.validateInputForEmptyFields(
                        inputCollection: [inputPerformanceTitle, inputPerformancedetail]) {
            tableViewP.appendElement(element: KeyValuePair(title: inputPerformanceTitle.text!,
                                                        detail: inputPerformancedetail.text!))
            tableViewP.reloadData()
        } else {
            Utility.showToast(message: "Enter Title and Detail First", viewController: self)
        }
    }
    //Operators
    @IBOutlet weak var collectionViewOperators: SinglePicCollectionView!
    @IBAction func onClickOperators_Add(_ sender: UIButton) {
        if let viewController  = storyboard?.instantiateViewController(
                                    identifier: ImageCollectionSelectorVC.identifier) as? ImageCollectionSelectorVC {
            viewController.imgDelegate = self
            viewController.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(viewController, animated: true)

        } else {
            print("Can't Add Operators At this time")
        }
    }
    //images
    @IBOutlet weak var collectionViewImages: SinglePicCollectionView!
    @IBAction func onClickImages_Add(_ sender: UIButton) {
        let viewController = UIImagePickerController()
        viewController.sourceType = .photoLibrary
        viewController.delegate = self
        viewController.allowsEditing = true
        present(viewController, animated: true)
    }
    @IBOutlet var allLabelCollection: [UILabel]!
    @IBOutlet var viewCollection: [UIView]!
    @IBOutlet var collectionViewList: [UICollectionView]!
    @IBOutlet var collectionOfButton: [UIButton]!
    @IBOutlet var tableViewCollection: [UITableView]!
    //
    @IBOutlet var inputCollection: [UITextField]!
    @IBOutlet weak var inputFighterName: UITextField!
    //
    func roundAllLayoutViews() {
        /*---  Start Rounding   Layers-----*/
        for label in allLabelCollection {
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
        for btn in collectionOfButton {
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 5
        }
        for table in tableViewCollection {
            table.layer.masksToBounds = true
            table.layer.cornerRadius = 5
        }
        /*---  End Rounding Layers    -----*/
    }
    func delegateAllViews() {
        /*---  Start Collections Delegation -----*/
        tableViewGI.delegate = self
        tableViewGI.dataSource = self
        tableViewGC.delegate = self
        tableViewGC.dataSource = self
        tableViewP.delegate = self
        tableViewP.dataSource = self
        //
        collectionViewOperators.delegate = self
        collectionViewImages.delegate = self
        collectionViewOperators.dataSource = self
        collectionViewImages.dataSource = self
        /*---  End Collection Delegations -----*/
        /*--- Start Input Delegation -----*/
        inputGIFirstFlight.delegate = self
        inputGIFirstFlight.tag = 1
        inputGIIntroduced.delegate = self
        inputGIIntroduced.tag = 2
        inputGINumberBuilt.delegate = self
        inputGINumberBuilt.tag = 3
        /*---  End Input Delegations -----*/
    }
    func allTableViewCellRegisteration() {
        /*---  Start GI Intialization -----*/
        tableViewGI.register(SingleCellTableViewCell.nib(), forCellReuseIdentifier: SingleCellTableViewCell.identifier)
        tableViewGI.setDataSource(textData: [String]())
        tableViewGI.rowHeight = UITableView.automaticDimension
        tableViewGI.estimatedRowHeight = 600
        /*---  End GI Intialization   -----*/
        /*---  Start GC Intialization -----*/
        let cell1 = DoubleCellTableViewCell()
        tableViewGC.register(cell1.nib(), forCellReuseIdentifier: DoubleCellTableViewCell.identifier)
        tableViewGC.setDataSource(Data: [KeyValuePair]())
        tableViewGC.rowHeight = UITableView.automaticDimension
        tableViewGC.estimatedRowHeight = 600
        /*---  End GC Intialization   -----*/
        /*---  Start Perf Intialization -----*/
        let cell2 = DoubleCellTableViewCell()
        tableViewP.register(cell2.nib(), forCellReuseIdentifier: DoubleCellTableViewCell.identifier)
        tableViewP.setDataSource(Data: [KeyValuePair]())
        tableViewP.rowHeight = UITableView.automaticDimension
        tableViewP.estimatedRowHeight = 600
        /*---  End Perf Intialization   -----*/
    }
    func allCollectionViewRegister() {
        /*---  Start Operators Intialization -----*/
        let operatorCell = SingleSmallPicCollectionViewCell()
        collectionViewOperators.register(operatorCell.nib(),
                                         forCellWithReuseIdentifier: SingleSmallPicCollectionViewCell.identifier)
        collectionViewOperators.setDataSource(imgList: [ImageDataContainer]())
        /*---  End Operators Intialization   -----*/
        /*---  Start Images Intialization -----*/
        let imageCell = SingleSmallPicCollectionViewCell()
        collectionViewImages.register(imageCell.nib(),
                                      forCellWithReuseIdentifier: SingleSmallPicCollectionViewCell.identifier)
        collectionViewImages.setDataSource(imgList: [ImageDataContainer]())
        /*---  End Images Intialization   -----*/
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Fighter"
        roundAllLayoutViews()
        delegateAllViews()
        allTableViewCellRegisteration()
        allCollectionViewRegister()
        //Navigation Item Right button configuration
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Fighter",
                                                            style: .plain, target: self,
                                                            action: #selector(addFighter))
    }
    func validateInput() -> Bool {
        if !(Utility.validateInputForEmptyFields(inputCollection: inputCollection)) {
            Utility.generateAlertBox(title: "Alert", message: "Please Enter All input Fileds", viewController: self)
            return false
        }
        if tableViewGI.getDataSource().count == 0 {
            Utility.generateAlertBox(title: "Alert", message: "Add Atleast 1 user", viewController: self)
            return false
        }
        if tableViewGC.getDataSource().count == 0 {
            Utility.generateAlertBox(title: "Alert", message: "Add atleast 1 Characteristic", viewController: self)
            return false
        }
        if tableViewP.getDataSource().count == 0 {
            Utility.generateAlertBox(title: "Alert", message: "Add atleast 1 Performance", viewController: self)
            return false
        }
        if collectionViewOperators.getDataSource().count == 0 {
            Utility.generateAlertBox(title: "Alert", message: "Add atleast 1 Operator", viewController: self)
            return false
        }
        if collectionViewImages.getDataSource().count == 0 {
            Utility.generateAlertBox(title: "Alert", message: "Add atleast 1 Image", viewController: self)
            return false
        }
        return true
    }
    func addFighterInDB() {
        let fighterModel = FighterModel()
        fighterModel.flightname = inputFighterName.text!
        //GeneralInfo
        let firstFlight = inputGIFirstFlight.text!
        let date = Utility.dateFormator(date: firstFlight)
        //Primary Users
        var userList = [PrimaryUsersModel]()
        let GIUserList = tableViewGI.getDataSource()
        for user in GIUserList {
            userList.append(PrimaryUsersModel(username: user))
        }
        let generalInfoModel = GeneralInfoModel(role: inputGIRole.text!, manufacturer: inputGIManufacturer.text!,
                                                designedBy: inputGIDesignedBy.text!, firstFlight: date!,
                                                introduced: Int(inputGIIntroduced.text!) ?? 1900,
                                                retired: inputGIRetired.text!, primaryUsers: userList,
                                                numberBuilt: inputGINumberBuilt.text!)
        fighterModel.generalInfo = generalInfoModel
        //
        var genCharacterisiticsList = [GeneralCharachteristicsModel]()
        let GCList = tableViewGC.getDataSource()
        for generalCharacteristicObject in GCList {
            genCharacterisiticsList.append(GeneralCharachteristicsModel(title: generalCharacteristicObject.title,
                                                                        detail: generalCharacteristicObject.detail))
        }
        fighterModel.generalCharacteristicsList = genCharacterisiticsList
        var genPerforamanceList = [PerformanceModel]()
        let pList = tableViewP.getDataSource()
        for perf in pList {
            genPerforamanceList.append(PerformanceModel(title: perf.title, detail: perf.detail))
        }
        fighterModel.peromanceList = genPerforamanceList
        var operatorModelList = [FlightOperatorModel]()
        let operatorImgList = collectionViewOperators.getDataSource()
        for operatorImageObject in operatorImgList {
            operatorModelList.append(FlightOperatorModel(countryName: operatorImageObject.img,
                                                         countryFlag: operatorImageObject.img))
        }
        fighterModel.flightOperatorsList = operatorModelList
        var tempGallaryImagesList = [String]()
        let gallaryImgList = collectionViewImages.getDataSource()
        for img in gallaryImgList {
            Utility.saveImage(imageName: img.img, image: img.uiImage)
            tempGallaryImagesList.append(img.img)
        }
        fighterModel.picturesList = tempGallaryImagesList
        FighterRepository.addFighterList(fighterModel: fighterModel)
    }
    @objc func addFighter() {
        if validateInput() {
            addFighterInDB()
            Utility.showToast(message: "Fighter Added", viewController: self)
            navigationController?.popViewController(animated: true)
        }
        print("right button tapped")
    }
}
extension AddFighterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView.getCellRowCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.getSelectedCell(tableView, cellForRowAt: indexPath)
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        tableView.slideLeft(tableView, commit: editingStyle, forRowAt: indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.onClickEditWithAlertController(index: indexPath, viewController: self)
    }
}
extension AddFighterViewController: UICollectionViewDelegate,
                                     UICollectionViewDataSource,
                                     UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return collectionView.getCellRowCount()
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.getSelectedCell(collectionView, cellForItemAt: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.resizeCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let refreshAlert = UIAlertController(title: "Alert",
                                             message: "Do You want to delete it?", preferredStyle: .alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default,
                                             handler: {(_: UIAlertAction!) in
            collectionView.deleteSelectedRow(index: indexPath)
                print("Handle Ok logic here")
          }))
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel,
                                             handler: {(_: UIAlertAction!) in
                print("Handle Cancel Logic here")
          }))
        present(refreshAlert, animated: true, completion: nil)
    }
}
//A delegator to get data from next activity
extension AddFighterViewController: ImageCollectionSelectorDelegator {
    func getSelectedImageName(imgStr: String) {
        collectionViewOperators.appendElement(element: ImageDataContainer(img: imgStr,
                                                                          uiImage: UIImage(named: imgStr)!))
        collectionViewOperators.reloadData()
    }
}
extension AddFighterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey(
                                rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
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
//Tag = 3 InputGINumberBuild
extension AddFighterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 1 || textField.tag == 2 {
            let minDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 1990)!
                    let maxDate = DatePickerHelper.shared.dateFrom(day: 18, month: 08, year: 2030)!
                    let today = Date()
                    // Create picker object
                    let datePicker = DatePicker()
                    // Setup
                    datePicker.setup(beginWith: today, min: minDate, max: maxDate) { (selected, date) in
                        if selected, let selectedDate = date {
                            textField.text = Utility.convertDateToStr(date: selectedDate, formate: "dd MMM yyyy")
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
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if textField.tag == 3 {
                let allowedCharacters = CharacterSet(charactersIn: "0123456789")
                let characterSet = CharacterSet(charactersIn: string)
                if !(allowedCharacters.isSuperset(of: characterSet)) {
                    Utility.showToast(message: "Enter Numeric Numbers Only", viewController: self)
                }
                return allowedCharacters.isSuperset(of: characterSet)
            }
            return true
    }
}
