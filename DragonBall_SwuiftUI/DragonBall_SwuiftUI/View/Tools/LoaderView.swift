//
//  LoaderView.swift
//  DragonBall_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 13/11/23.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
       Image(systemName: "clock.fill")
            .resizable()
            .frame(width: 100, height: 100)
        Text("Por favor espere")
            .font(.title)
        
    }
}

#Preview {
    LoaderView()
}
