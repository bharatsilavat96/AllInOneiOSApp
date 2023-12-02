//
//  ViewController.swift
//  AllInOneiOSProject
//
//  Created by Bharat Shilavat on 25/11/23.
//

import UIKit

class ViewController: UIViewController {

    let todaysTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255, green: 143, blue: 143)
        print("UTC Time :",todaysTime)
        let shortStyle = DateFormatter.localizedString(from:.now, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.short)
        print("Short Style : \(shortStyle)")
        
         let dateFormatter = DateFormatter()
         dateFormatter.dateStyle = .medium
         dateFormatter.timeStyle = .none
         dateFormatter.locale = Locale(identifier: "ru-Ru")
        let ruStyle = dateFormatter.string(from: .now)
         //shortStyle is '29 июня 2023 г.'
         dateFormatter.dateFormat = "yyyy-MM-dd"
        let customStyle = dateFormatter.string(from: .now)
         //customStyle is '2023-06-29'
         print("shortStyle = '\(shortStyle)'")
         print("ruStyle = '\(ruStyle)'")
         print("customStyle = '\(customStyle)'")
    }
}

