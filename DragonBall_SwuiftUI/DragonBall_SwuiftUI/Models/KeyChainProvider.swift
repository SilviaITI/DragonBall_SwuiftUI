//
//  KeyChainProvider.swift
//  DragonBall_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 11/11/23.
//

import KeychainSwift
// hay que guardar el value en un utf8
func saveKC(key: String, value: String) -> Bool {
    if let data = value.data(using: .utf8) {
        let kc = KeychainSwift()
       return  kc.set(data, forKey: key)
    } else {
        return false
    }
}

func loadKC(key: String) -> String? {
    if let data = KeychainSwift().get(key) {
        return data
    } else {
        return""
    }
}

func deleteKC(key: String) {
    KeychainSwift().delete(key)
}
