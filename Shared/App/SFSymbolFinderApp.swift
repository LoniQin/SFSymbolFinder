//
//  SFSymbolFinderApp.swift
//  Shared
//
//  Created by Lonnie on 2021/3/31.
//

import SwiftUI

@main
struct SFSymbolFinderApp: App {

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(AppModel.shared)
            }
        }
    }
}
