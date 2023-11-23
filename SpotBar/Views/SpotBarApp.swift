//
//  SpotBarApp.swift
//  SpotBar
//
//  Created by Philip Larsson on 2023-10-12.
//

import SwiftUI

@main
struct SpotBarApp: App {
    var body: some Scene {
        MenuBarExtra("SpotBar", systemImage: "music.note") {
            //AuthView()
            AppMenu()
        }.menuBarExtraStyle(.window)
        WindowGroup {
            ContentView()
        }
    }
}
