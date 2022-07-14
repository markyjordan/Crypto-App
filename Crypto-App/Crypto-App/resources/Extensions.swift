//
//  Extensions.swift
//  Crypto-App
//
//  Created by Marky Jordan on 7/12/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    // Set button states to 'enabled' or 'disabled'.
    
    func disableButton(_ buttonIsEnabled: Bool, button: UIButton) {
        if buttonIsEnabled {
            button.isEnabled = true
            button.alpha = 1.0
        }
        else {
            button.isEnabled = false
            button.alpha = 0.5
        }
    }
}

extension UITextField {
    func setPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
