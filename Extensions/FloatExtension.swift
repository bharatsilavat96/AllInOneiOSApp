//
//  FloatExtension.swift
//  AllInOneiOSProject
//
//  Created by Bharat Shilavat on 02/12/23.
//

import Foundation

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
