//
//  RootView.swift
//  DragonBall_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 13/11/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var body: some View {
        switch rootViewModel.status {
        case .none: 
            LoginView()
        case .register:
            Text("Registro")
        case.loading:
            withAnimation {
                LoaderView()
            }
        case .error(error: let errorString) :
            Text("Error: \(errorString)")
        case .loaded:
            Text("Home app")
     
            
        }
    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
