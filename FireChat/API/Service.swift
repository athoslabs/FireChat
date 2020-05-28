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
    
    static func fetchUsers() {
        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            snapshot?.documents.forEach({ (document) in
                print(document.data())
            })
        }
    }
}
