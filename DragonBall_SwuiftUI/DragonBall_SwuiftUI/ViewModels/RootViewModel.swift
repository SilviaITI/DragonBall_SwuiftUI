//
//  RootViewModel.swift
//  DragonBall_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 11/11/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    
    public let CONST_TOKEN_ID = "TokenJWTAppiOSBoot17"
    @Published var status = Status.none
    @Published var islogged: Bool = false
    
    // token del login
    @Published var tokenJWT: String = ""
    var subscribers = Set<AnyCancellable>()
    // revisa si el token ya está almacenado en el keychain
    func logedUserControl() {
        let tokenOptional = loadKC(key: CONST_TOKEN_ID)
    }
    //login al servidor
    func login(user: String, password: String){
        status = .loading
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionLogin(user: user, password: password))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return String(decoding: $0.data, as: UTF8.self)
                   
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure:
                    self.status = .error(error: "Usuario y/o clave errónea")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { token in
                self.tokenJWT = token
                print("llega el token")
            }
            .store(in: &subscribers)

        
    }
    
}
