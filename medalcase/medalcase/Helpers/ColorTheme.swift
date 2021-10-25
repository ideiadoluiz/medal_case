//
//  ColorTheme.swift
//  medalcase
//
//  Created by Luiz Peres on 2021-10-23.
//

import UIKit

/*
 * Note: You will see that this class always returns a color and I would
 * have two options:
 *   - throw an exception
 *   - return a default color for each of them
 * I chose the second so the app wouldn't crash if we changed the color's name
 * in the Colors.xcassets folder.
 */
internal struct ColorTheme {

    @available(*, unavailable) private init() {}

    internal static var headerLightGray: UIColor {
        return UIColor(named: "header_light_gray") ?? UIColor.secondarySystemBackground;
    }

    internal static var headerTitleGray: UIColor {
        return UIColor(named: "header_title_gray") ?? UIColor.label;
    }

    internal static var headerSubtitleGray: UIColor {
        return UIColor(named: "header_subtitle_gray") ?? UIColor.secondaryLabel;
    }

    internal static var navBarBlue: UIColor {
        return UIColor(named: "navigation_bar_blue") ?? UIColor.systemBackground;
    }

    internal static var halfTransparent: UIColor {
        return UIColor.white.withAlphaComponent(0.5);
    }
}
