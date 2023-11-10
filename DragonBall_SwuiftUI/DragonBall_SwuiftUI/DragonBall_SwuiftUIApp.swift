//
//  DragonBall_SwuiftUIApp.swift
//  DragonBall_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 10/11/23.
//

import SwiftUI

@main
struct DragonBall_SwuiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
