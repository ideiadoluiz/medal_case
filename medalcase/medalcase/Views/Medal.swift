//
//  MedalIcons.swift
//  medalcase
//
//  Created by Luiz Peres on 2021-10-23.
//

import UIKit

internal struct Medal {

    @available(*, unavailable) private init() {}
    
    private static func image(named:String) throws -> UIImage {
        guard let image = UIImage(named: named) else {
            throw Error.resourceNotFound()
        }
        
        return image
    }
    
    private static func make(imageName: String) -> UIImage {
        return try! Medal.image(named: imageName)
    }
    
    private static func all(allCases: [String]) -> [UIImage] {
        return allCases.map { el in try! Medal.image(named: el) }
    }
}
