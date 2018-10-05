//
//  SwiftWebVCTitleStyle.swift
//  SwiftWebVCExample
//
//  Created by Fran on 10/5/18.
//  Copyright © 2018 Myles Ringle. All rights reserved.
//

import UIKit

typealias UIViewWithText = HasText & UIView

protocol HasText {
    var text: String? { get set }
    var textAlignment: NSTextAlignment { get set }
    var color: UIColor? { get set }
}

extension UITextField: HasText {
    var color: UIColor? {
        get {
            return textColor
        }
        set {
            textColor = color
        }
    }
}

class UILabelAutoSize: UILabel, HasText {
    override var text: String? {
        set {
            super.text = newValue
            sizeToFit()
        }

        get {
            return super.text
        }
    }

    var color: UIColor? {
        get {
            return textColor
        }
        set {
            textColor = color ?? .black
        }
    }
}

protocol SwiftWebVCTitleStyle {
    func getView(forContainer: UIView) -> UIViewWithText
}

class PlainSwiftWebVCTitleStyle: SwiftWebVCTitleStyle {
    private var label: UILabel?

    func getView(forContainer: UIView) -> UIViewWithText {
        label = UILabelAutoSize()
        label!.backgroundColor = .clear
        label!.font = UIFont(name: "HelveticaNeue-Small", size: 17.0)
        label!.textAlignment = .right
        return label! as! UIViewWithText
    }
}

class EditableSwiftWebVCTitleStyle: SwiftWebVCTitleStyle {
    private var textField: UITextField?


    func getView(forContainer: UIView) -> UIViewWithText {
        let baseBounds = forContainer.bounds
        textField = UITextField(frame: CGRect(origin: .zero,
                                              size: CGSize(width: baseBounds.width * 0.75,
                                                           height: baseBounds.height * 0.6)))
        textField!.textAlignment = .left
        textField!.borderStyle = .roundedRect
        textField!.backgroundColor = UIColor.white
        return textField!
    }
}
