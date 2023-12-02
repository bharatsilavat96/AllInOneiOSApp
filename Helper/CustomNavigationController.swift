//
//  CustomNavigationController.swift
//  DFAssesment
//
//  Created by Bharat Shilavat on 30/11/23.
//

import Foundation
import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButtonImage = UIImage(named: "ep_back")?.withTintColor(.black)
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: nil, action: nil)
        backButton.tintColor = .gray
        UINavigationBar.appearance().backIndicatorImage = backButtonImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backButtonImage
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -200, vertical: 0), for: .default)
    }
}
