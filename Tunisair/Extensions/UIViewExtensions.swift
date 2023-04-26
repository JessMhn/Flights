//
//  UIViewExtensions.swift
//  Tunisair
//
//  Created by Mac on 26.04.23.
//

import UIKit

extension UIView {

    /// The ratio (from 0.0 to 1.0, inclusive) of the view's corner radius
    /// to its width. For example, a 50% radius would be specified with
    /// `cornerRadiusRatio = 0.5`.
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius / frame.width
        }

        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }
    
    func applyRoundedCornerRadius () -> Void {
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }
}
