//
//  UITextfieldExtnsion.swift
//  AllInOneiOSProject
//
//  Created by Bharat Shilavat on 02/12/23.
//

import Foundation
import UIKit

extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == passwordTextField {
//            textField.resignFirstResponder()
//            loginButtonAction(sender: loginButtonOutlet)
//            return true
//        }
//        return false
//    }
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        // You can add more specific validation for phone numbers if needed
        return phoneNumber.count == 10
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // You can add more specific validation for passwords if needed
        return !password.isEmpty
    }
}

