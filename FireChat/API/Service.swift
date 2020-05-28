//
//  Service.swift
//  FireChat
//
//  Created by Robert Morrow on 5/28/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import Foundation
import Firebase

struct service {
    
    static func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            snapshot?.documents.forEach({ (document) in
                
                let dictionary = document.data()
                let user = User(dictionary: dictionary)
                users.append(user)
                completion(users)
            })
        }
    }
}
