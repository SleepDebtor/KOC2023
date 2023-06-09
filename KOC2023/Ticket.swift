//
//  Item.swift
//  KOC2023
//
//  Created by Michael Lazar on 6/8/23.
//

import Foundation
import SwiftData

@Model
final class Ticket {
    var timestamp: Date
	var number: Int
	var cost: Decimal = 5.00
	var selected: Bool = false
	
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
