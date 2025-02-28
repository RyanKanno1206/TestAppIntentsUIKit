//
//  OpenTab.swift
//  TestAppIntents
//
//  Created by Ryan Kanno on 2/27/25.
//

import AppIntents
import Foundation

struct OpenTab: AppIntent {
    static let title: LocalizedStringResource = "Open tab2"
    
    static let description = IntentDescription("Opens tab2")
    
    static let openAppWhenRun: Bool = true
    
    @MainActor func perform() async throws -> some IntentResult {
        tabVC.selectedIndex = 1
        return .result()
    }
    
    @Dependency private var tabVC: MainTabVC
}
