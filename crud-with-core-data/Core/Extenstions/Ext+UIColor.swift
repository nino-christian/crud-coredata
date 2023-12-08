//
//  Ext+UIColor.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/5/23.
//

import Foundation
import UIKit


extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
            self.init(
                red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(hex & 0x0000FF) / 255.0,
                alpha: alpha
            )
        }
}
