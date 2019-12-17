//
//  singleton_huntItems.swift
//  IOS Final
//
//  Created by Gering Dong on 2/13/19.
//  Copyright © 2019 Gering Dong. All rights reserved.
//

import Foundation

class singleton_huntItems{
    static let sharedInstance = singleton_huntItems()
    var items = [huntItems]()
    private init() {}
    // access like this :
    // singleton_huntItems.sharedInstance.items.append(a):
}
