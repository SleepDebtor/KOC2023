//
//  Item.swift
//  KOC2023
//
//  Created by Michael Lazar on 6/8/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
