//
//  UserModel.swift
//  AllInOneiOSProject
//
//  Created by Bharat Shilavat on 03/12/23.
//

import Foundation

class User{
    //MARK: - For Labels: -
    enum Key: String {
        case name = "Name"
        case email = "Email"
        case dob = "DOB"
        case sex = "Sex"
        case country = "Country"
    }
    //MARK: - For Textfields to store data at: -
    var name: String?
    var email: String?
    var dob: Double?
    var sex: Sex?
    var country: String?
    
    //MARK: - for Sex entry selection  -
    enum Sex: String{
        case male = "Male"
        case female = "Female"
        case unknown = "Don't want to reveal"
    }
}
