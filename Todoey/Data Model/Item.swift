//
//  Item.swift
//  Todoey
//
//  Created by Matt Cosgrove on 5/28/19.
//  Copyright © 2019 Cosgrove Guitar Studio. All rights reserved.
//

import Foundation

class Item: Encodable, Decodable {
    var title: String = ""
    var done: Bool = false
}
