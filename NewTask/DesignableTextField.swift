//
//  DesignableTextField.swift
//  NewTask
//
//  Created by Nazim Asadov on 13.03.22.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {
     
    
        // Provides left padding for images
        override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
            var textRect = super.leftViewRect(forBounds: bounds)
            textRect.origin.x += leadingPadding
            return textRect
        }
        
        // Provides right padding for images
        override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
            var textRect = super.rightViewRect(forBounds: bounds)
            textRect.origin.x -= leadingPadding
            return textRect
        }
        
        @IBInspectable var leadingImage: UIImage? {
            didSet {
                updateView()
            }
        }
        
        @IBInspectable var leadingPadding: CGFloat = 0
        
        @IBInspectable var color: UIColor = UIColor.lightGray {
            didSet {
                updateView()
            }
        }
        
        @IBInspectable var rtl: Bool = false {
            didSet {
                updateView()
            }
        }
        
        func updateView() {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
            
            if let image = leadingImage {
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                imageView.image = image
                // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
                imageView.tintColor = color
                
                if rtl {
                    rightViewMode = UITextField.ViewMode.always
                    rightView = imageView
                } else {
                    leftViewMode = UITextField.ViewMode.always
                    leftView = imageView
                }
            }
            
            // Placeholder text color
            attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
        }
    }


