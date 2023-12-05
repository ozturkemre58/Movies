//
//  UIView.swift
//  Movies
//
//  Created by Emre Öztürk on 4.12.2023.
//

import Foundation
import UIKit

extension UIView {
    
    func round( _ radius: CGFloat = 15) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
