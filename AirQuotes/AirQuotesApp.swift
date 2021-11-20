//
//  AirQuotesApp.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import SwiftUI

@main
struct AirQuotesApp: App {
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    
    init() {
        UITableView.appearance().backgroundColor = .themeColor
    }
    
    var body: some Scene {
        WindowGroup {
            NavgationView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
