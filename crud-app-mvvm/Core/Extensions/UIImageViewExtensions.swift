//
//  UIImageViewExtensions.swift
//  crud-app-mvvm
//
//  Created by Ergün Yunus Cengiz on 19.10.2022.
//

import Foundation
import UIKit


extension UIImageView {
    
    func makeCircleImage() {
        
        layer.borderWidth = 0
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
