//
//  Frame.swift
//  medalcase
//
//  Created by Luiz Peres on 2021-10-24.
//

import UIKit

extension UIView {

    internal static func heightFor(text:String, font:UIFont, width:CGFloat) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
                            
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text

        label.sizeToFit()
        return label.frame.height
    }
}
