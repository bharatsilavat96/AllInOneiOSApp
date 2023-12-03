//
//  CustomSignUpCell.swift
//  AllInOneiOSProject
//
//  Created by Bharat Shilavat on 03/12/23.
//

import UIKit

protocol CustomSignUpCellDelegate{
    func inputView(for key:User.Key) -> UIView
    func textFieldStartEditing(for key:User.Key)
}

class CustomSignUpCell: UITableViewCell, UITextFieldDelegate{
    
    @IBOutlet weak var textFieldSignUp: UITextField?
     
    var delegate : CustomSignUpCellDelegate?
    var user: User = User()
    var key: User.Key?
        
    func updateUI(with key:User.Key, for user:User){

        self.user = user
        self.key = key
        textFieldSignUp?.placeholder = key.rawValue
        textFieldSignUp?.delegate = self
        guard let delegate = delegate else{
            return
        }
        
        switch key{
        case .name:
            textFieldSignUp?.keyboardType = .default
            textFieldSignUp?.text = user.name
        
        case .country:
            
            textFieldSignUp?.inputView = delegate.inputView(for: key)
            textFieldSignUp?.text = user.country
        
        case .dob:
            
            textFieldSignUp?.inputView = delegate.inputView(for: key)
            textFieldSignUp?.text =  formattedDate()
            
        case .email:
            textFieldSignUp?.keyboardType = .emailAddress
            textFieldSignUp?.text = user.email
            
        case .sex:
          
            textFieldSignUp?.text = user.sex?.rawValue
            textFieldSignUp?.inputView = delegate.inputView(for: key)
 
        }
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard let delegate = delegate else{
            return false
        }
        delegate.textFieldStartEditing(for: key!)
        return true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func formattedDate() -> String{
        guard let dob = user.dob else {
            return ""
        }
        let date = Date(timeIntervalSince1970: dob)
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM yyyy"
        let dateStr = formatter.string(from: date)
        return dateStr
    }

}
