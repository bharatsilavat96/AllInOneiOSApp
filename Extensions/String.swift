//
//  String.swift
//  DFAssesment
//
//  Created by Bharat Shilavat on 30/11/23.
//

import Foundation
import UIKit

extension String {
    func underline() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: self.count))
        return attributedString
    }
}
