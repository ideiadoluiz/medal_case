//
//  Appearance.swift
//  medalcase
//
//  Created by Luiz Peres on 2021-10-24.
//

import UIKit

internal struct Appearance {

    @available(*, unavailable) private init() {}

    internal static func setup() {

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = ColorTheme.navBarBlue
        let label = Label.makeLabel16(textColor: .white)
        appearance.titleTextAttributes = [
            .foregroundColor : label.textColor!,
            .font : label.font!
        ]
        
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.standardAppearance = appearance;
        navigationBarAppearace.scrollEdgeAppearance = navigationBarAppearace.standardAppearance;
        navigationBarAppearace.tintColor = .white
    }
}
