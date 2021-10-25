//
//  HeaderView.swift
//  medalcase
//
//  Created by Luiz Peres on 2021-10-24.
//

import UIKit

internal class HeaderView: UICollectionReusableView {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!

    internal static let desiredHeight = 50.0
    
    internal override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func setup(title: String, subtitle: String, color: UIColor) {
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        self.backgroundColor = color
        self.setupSubtitleLabel(hidden: false)
    }
    
    internal func setup(title: String, color: UIColor) {
        self.titleLabel.text = title
        self.backgroundColor = color
        self.setupSubtitleLabel(hidden: true)
    }
    
    private func setupSubtitleLabel(hidden: Bool) {
        self.subtitleLabel.textColor = ColorTheme.headerSubtitleGray
        self.subtitleLabel.isHidden = hidden
    }
}
