//
//  LoginView.swift
//  DragonBall_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 11/11/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        ZStack {
            // imagen de fondo
            backImage
            //imagen de logo
            VStack {
                Image(.title)
                    .resizable()
                    .scaledToFit()
                // grupo componentes login
                VStack(spacing: 40) {
                    loginSection
                    // registro de usuario
                    registerSection
                }
            }
        }
        .ignoresSafeArea()
    }
    var backImage: some View {
        Image(decorative: "backgroundLogin")
            .resizable()
            .overlay {
                Color.black
                    .opacity(0.2)
                    .id(1)
            }
    }
    
    var loginSection: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .foregroundColor(.blue)
                .cornerRadius(15.0)
                .shadow(radius: 10, x: 20, y:20)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .opacity(0.9)
                .id(2)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .foregroundColor(.blue)
                .cornerRadius(15.0)
                .shadow(radius: 10, x: 20, y:20)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .opacity(0.9)
                .id(3)
            Button {
                rootViewModel.login(user: email, password: password)
            } label: {
                Text("Entrar")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(.orange)
                    .cornerRadius(15.0)
                    .shadow(radius: 10, x: 20, y:20)
            }
            .padding(.top, 50)
            .id(4)
            
        }
        .padding(.horizontal)
    }
    var registerSection: some View {
        HStack {
            Text("¿No tienes cuenta?")
                .foregroundStyle(.white)
                .font(.title3)
            Button(action: {
                // TO DO acción de registro
            }, label: {
                Text("Registro")
                    .foregroundStyle(.blue)
                    .font(.title3)
            })
        }
    }
}

#Preview {
    LoginView()
        .environment(\.locale, .init(identifier: "en"))
}
