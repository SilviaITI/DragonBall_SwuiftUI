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
    
    // viewModel global
    @StateObject var rootViewModel = RootViewModel()

    var body: some Scene {
        WindowGroup {
          RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(rootViewModel)
        }
    }
}
