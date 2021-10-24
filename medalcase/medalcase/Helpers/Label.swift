//
//  Font.swift
//  medalcase
//
//  Created by Luiz Peres on 2021-10-24.
//

import UIKit

public struct Label {

    @available(*, unavailable) private init() {}
    
    internal static func makeLabel16(textColor: UIColor) -> UILabel {
        return makeLabel(size: 16, textColor: textColor)
    }
    
    internal static func makeLabel14(textColor: UIColor) -> UILabel {
        return makeLabel(size: 14, textColor: textColor)
    }
    
    internal static func makeLabel12(textColor: UIColor) -> UILabel {
        return makeLabel(size: 12, textColor: textColor)
    }
    
    internal static func makeLabel(size: CGFloat, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: label.font.fontName, size: size)
        label.textColor = textColor;
        return label;
    }
}
