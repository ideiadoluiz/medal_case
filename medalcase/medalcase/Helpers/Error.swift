//
//  Error.swift
//  medalcase
//
//  Created by Luiz Peres on 2021-10-23.
//

import Foundation

public struct Error {

    @available(*, unavailable) private init() {}
    
    internal static func resourceNotFound() ->  NSError {
        return NSError(domain: "Resource name not found", code: -1, userInfo: nil)
    }
}
