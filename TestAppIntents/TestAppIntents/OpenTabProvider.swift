//
//  OpenTabProvider.swift
//  TestAppIntents
//
//  Created by Ryan Kanno on 2/28/25.
//

import AppIntents
import Foundation

struct OpenTabProvider: AppShortcutsProvider {
    static let shortcutTileColor: ShortcutTileColor = .navy
    
    static let appShortcuts: [AppShortcut] = [
        AppShortcut(
            intent: OpenTab(),
            phrases: [
                "Open second tab"
            ],
            shortTitle: "Open second tab",
            systemImageName: "magnifyingglass"),
        AppShortcut(
            intent: DynamicUserInputIntent(),
            phrases: [
                "Open and take user input text"
            ],
            shortTitle: "Set label text",
            systemImageName: "a.circle")
    ]
    
}
