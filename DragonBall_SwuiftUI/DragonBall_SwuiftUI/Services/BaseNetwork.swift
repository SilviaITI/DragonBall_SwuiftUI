//
//  BaseNetwork.swift
//  DragonBall_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation
// Constantes deben ir a un fichero de constantes

let urlBase = "https://dragonball.keepcoding.education"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    
    static let content = "application/json"
}

enum Endpoints: String {
    case login = "/api/auth/login"
    
}
struct BaseNetwork {
    func getSessionLogin(user: String, password: String) -> URLRequest {
        let urlString = "\(urlBase)\(Endpoints.login.rawValue)"
        let encodeCredentials = "\(user):\(password)".data(using: .utf8)?.base64EncodedString()
        var secCredentials = ""
        if let credentials = encodeCredentials {
            secCredentials = "Basic \(credentials)"
        }
        var request:URLRequest = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HTTPMethods.post
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-Type")
        request.addValue(secCredentials, forHTTPHeaderField: "Authorization")
        return request
    }
}
