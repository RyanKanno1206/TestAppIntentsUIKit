//
//  DynamicUserInputIntent.swift
//  TestAppIntents
//
//  Created by Ryan Kanno on 3/3/25.
//

import AppIntents
import Foundation

struct DynamicUserInputIntent: AppIntent {
    static let title: LocalizedStringResource = "Get user input"
    static let description = IntentDescription("Get typed user input from outside the app")
    static var parameterSummary: some ParameterSummary {
        return Summary("Set label text to ")
    }
    static let openAppWhenRun = true
    
    @Dependency private var tabVC: MainTabVC
    
    @Parameter(title: "User input")
    var userInput: String
    
    init() {}
    
    init(userInput: String) {
        self.userInput = userInput
    }
    
    @MainActor func perform() async throws -> some IntentResult {
        tabVC.selectedIndex = 0
        tabVC.tab1.label.text = userInput
        return .result()
    }
}

struct LabelText: Identifiable, Hashable, Sendable {
    let id = UUID().uuidString
    let txt: String
}

struct LabelTextEntity: AppEntity {
    static let typeDisplayRepresentation = TypeDisplayRepresentation(name: LocalizedStringResource("SetLabel", table: "AppIntents"))
    
    static var defaultQuery = LabelTextEntityQuery()
    
    var id: LabelText.ID
    
    @Property(title: "Text")
    var txt: String
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(txt)")
    }
    
    init(wrapper: LabelText) {
        self.id = wrapper.id
        self.txt = wrapper.txt
    }
}

struct LabelTextEntityQuery: EntityQuery {
    func entities(for identifiers: [LabelTextEntity.ID]) async throws -> [LabelTextEntity] {
        return [
            LabelTextEntity(wrapper: LabelText(txt: "Testing1"))
        ]
    }
}

extension LabelTextEntityQuery: EnumerableEntityQuery {
    func allEntities() async throws -> [LabelTextEntity] {
        return [
            LabelTextEntity(wrapper: LabelText(txt: "Testing1"))
        ]
    }
}
