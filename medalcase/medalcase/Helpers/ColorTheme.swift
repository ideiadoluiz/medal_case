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
public struct ColorTheme {

    @available(*, unavailable) private init() {}

    internal static func headerLightGray() -> UIColor {
        return UIColor(named: "header_light_gray") ?? UIColor.secondarySystemBackground;
    }

    internal static func headerTitleGray() -> UIColor {
        return UIColor(named: "header_title_gray") ?? UIColor.label;
    }

    internal static func headerSubtitleGray() -> UIColor {
        return UIColor(named: "header_subtitle_gray") ?? UIColor.secondaryLabel;
    }

    internal static func navBarBlue() -> UIColor {
        return UIColor(named: "navigation_bar_blue") ?? UIColor.systemBackground;
    }

    internal static func halfTransparent() -> UIColor {
        return UIColor.white.withAlphaComponent(0.5);
    }
}
