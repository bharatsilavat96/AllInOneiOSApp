//
//  CustomAlertView.swift
//  DFAssesment
//
//  Created by Bharat Shilavat on 30/11/23.
//

import Foundation
import UIKit

class AlertManager {
    static func showAlert(title: String, message: String, viewController: UIViewController, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
