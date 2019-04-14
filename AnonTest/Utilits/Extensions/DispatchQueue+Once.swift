//
//  DispatchQueue+Once.swift
//  CheapFitness
//
//  Created by Eugen Lipatov on 22.07.2018.
//  Copyright © 2018 Eugen Lipatov. All rights reserved.
//

import Foundation

extension DispatchQueue {

    private static var _onceTracker = [String]()

    /**
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    public class func once(token: String, block: () -> Void) {
        objc_sync_enter(self); defer { objc_sync_exit(self) }

        if _onceTracker.contains(token) {
            return
        }

        _onceTracker.append(token)
        block()
    }
}
