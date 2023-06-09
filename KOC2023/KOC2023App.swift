//
//  KOC2023App.swift
//  KOC2023
//
//  Created by Michael Lazar on 6/8/23.
//

import SwiftUI
import SwiftData

@main
struct KOC2023App: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
