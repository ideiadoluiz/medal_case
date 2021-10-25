//
//  MedalViewCell.swift
//  medalcase
//
//  Created by Luiz Peres on 2021-10-24.
//

import UIKit

class MedalViewCell: UICollectionViewCell {

    @IBOutlet private weak var medalIcon: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var transparentView: UIView!
    @IBOutlet private weak var titleHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func setup(title: String, subtitle: String?, iconName: String, achieved: Bool) {
        self.medalIcon.image = MedalViewCell.make(imageName: iconName)
        self.setupTitle(title)
        self.setupSubtitle(subtitle)
        self.setupTransparentView(achieved)
    }
    
    private func setupTitle(_ title:String) {
        self.titleLabel.text = title
        self.titleLabel.numberOfLines = 0
        let height = UIView.heightFor(text: title,
                                      font: self.titleLabel.font,
                                      width: self.titleLabel.frame.size.width)
        self.titleHeightConstraint.constant = height
        self.setNeedsLayout()
    }
    
    private func setupTransparentView (_ achieved: Bool) {
        self.transparentView.backgroundColor = ColorTheme.halfTransparent
        self.transparentView.isHidden = achieved
    }
    
    private func setupSubtitle(_ subtitle: String?) {
        if let subtitle = subtitle {
            self.subtitleLabel.text = subtitle
        } else {
            self.subtitleLabel.text = String.localized(forKey: "not_yet")
        }
    }
    
    private static func make(imageName: String) -> UIImage {
        return try! MedalViewCell.image(named: imageName)
    }
    
    private static func image(named:String) throws -> UIImage {
        guard let image = UIImage(named: named) else {
            throw Error.resourceNotFound()
        }
        
        return image
    }
}
