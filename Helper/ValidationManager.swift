//
//  ValidationManager.swift
//  DFAssesment
//
//  Created by Bharat Shilavat on 01/12/23.
//

import Foundation


class ValidationManager {
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    static func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        // Customize the phone number validation regex based on your requirements
        let phoneRegex = #"^\d{10}$"#
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phoneNumber)
    }
}
