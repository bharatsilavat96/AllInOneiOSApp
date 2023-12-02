//
//  KeyboardManager.swift
//  DFAssesment
//
//  Created by Bharat Shilavat on 30/11/23.
//

import Foundation
import UIKit

class UIHelper {

    static func setupKeyboardObservers(for viewController: UIViewController) {
        NotificationCenter.default.addObserver(
            viewController,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            viewController,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc static func keyboardWillShow(_ notification: Notification) {
        guard let viewController = notification.object as? UIViewController,
              let userInfo = notification.userInfo,
              let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }

        UIView.animate(withDuration: 0.3) {
            viewController.view.frame.origin.y = -keyboardSize.height
        }
    }

    @objc static func keyboardWillHide(_ notification: Notification) {
        guard let viewController = notification.object as? UIViewController else {
            return
        }

        UIView.animate(withDuration: 0.3) {
            viewController.view.frame.origin.y = 0
        }
    }

    static func removeKeyboardObservers(for viewController: UIViewController) {
        NotificationCenter.default.removeObserver(viewController)
    }
}
