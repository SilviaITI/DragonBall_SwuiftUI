//
//  PropertyWrapper.swift
//  DragonBall_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import Foundation

@propertyWrapper
class kcPersistenceKeyChain {
    private var key: String
    
    init(key: String) {
        self.key = key
    }
    
    var wrappedValue: String {
        //leen tu propiedad
        get{
            if let value = loadKC(key: key){
                return value
            } else{
                return ""
            }
        }
        
        //te asignan valor.
        set{
            //Grabar
            saveKC(key: key, value: newValue)
        }
    }
}
