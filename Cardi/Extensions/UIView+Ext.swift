//
//  UIView+Ext.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 26/02/2022.
//

import UIKit

extension UIView {
    // MARK: - Properties
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
//            if cornerRadius > 0 {
//                clipsToBounds = true
//            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor ?? CGColor(gray: 1, alpha: 0))
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(cgColor: layer.shadowColor ?? CGColor(gray: 1, alpha: 0))
        }
        set {
            layer.shadowColor = newValue.cgColor
//            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.layer.cornerRadius).cgPath
//            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    func makeCircle() {
        print(frame.width)
        print(bounds.width)
        layer.cornerRadius = bounds.size.width / 2
        clipsToBounds = true
    }
}