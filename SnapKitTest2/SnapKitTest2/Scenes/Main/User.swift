//
//  User.swift
//  SnapKitTest2
//
//  Created by Aaron Lee on 2021/04/07.
//

import Foundation

struct User {
    
    let email: String
    
}

extension User: CustomStringConvertible {
    
    var description: String {
        return "User Email: \(email)"
    }
    
}
