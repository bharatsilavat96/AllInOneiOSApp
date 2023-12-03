//
//  ViewController.swift
//  AllInOneiOSProject
//
//  Created by Bharat Shilavat on 25/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource ,CustomSignUpCellDelegate{
    
    var countryList: [Country] = []
    var editingKey: User.Key?
    var user: User = User()
    
    var genderArray: [User.Sex] = [.male,.female,.unknown]
    var keyArray:[User.Key] = [.name , .email, .dob, .sex, .country]
    
    
    @IBOutlet weak var signUpTableView: UITableView!
    @IBOutlet var signUpDatePicker: UIDatePicker!
    @IBOutlet var signUpPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCountry()
        signUpTableView.dataSource = self
        signUpTableView.delegate = self
        signUpPickerView.delegate = self
        signUpPickerView.dataSource = self
        signUpTableView.separatorStyle = .none
    }
    
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        print("SignUpButton Tapped")
    }
    
    func loadCountry() {
        guard let url = Bundle.main.url(forResource: "country", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            countryList = try decoder.decode([Country].self, from: data)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                self.signUpPickerView.reloadAllComponents()
            }
        } catch let error {
            print(error)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
      
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customSignUpCell", for: indexPath) as! CustomSignUpCell
        cell.delegate = self
        cell.updateUI(with: keyArray[indexPath.row], for: self.user)
        return cell
    }
     
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch editingKey{
        case .sex:
            let sex = genderArray[row]
            return sex.rawValue
        case .country:
            let country = countryList[row].name
            return country
        default:
            return ""
        }
        
      
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch editingKey{
        case .sex:
            return 1
        case .country:
            return 1
        default :
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch editingKey{
        case .sex:
            print("Sex Count : \(genderArray.count)")
            return genderArray.count
        case .country:
            print("Sex Count : \(genderArray.count)")
            return countryList.count
        default:
            return 0
        }
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch editingKey{
        case .sex:
            let sex = genderArray[row]
            self.user.sex = sex
        case .country:
            let country = countryList[row].name
            self.user.country = country
        default:
            print("")
        }

        signUpTableView.reloadData()
    }
    
    func textFieldStartEditing(for key: User.Key) {
        editingKey = key
    }
    
    @IBAction func datePickerValueChange(){
        user.dob = signUpDatePicker.date.timeIntervalSince1970
        signUpTableView.reloadData()
        self.signUpDatePicker.isEnabled = false
        self.signUpPickerView.isHidden = false
        
    }

    
    func inputView(for key: User.Key) -> UIView {
        switch key{
        case .sex, .country:
            return self.signUpPickerView
        case .dob:
            return self.signUpDatePicker
        default:
            return UIView()
        }
    }
}



