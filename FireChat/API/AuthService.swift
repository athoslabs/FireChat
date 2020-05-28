//
//  AuthService.swift
//  FireChat
//
//  Created by Robert Morrow on 5/28/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import Firebase
import UIKit

struct RegistrationCredentials {
    let email: String
    let passsword: String
    let fullname: String
    let username: String
    let profileImage: UIImage
    
}

struct AuthService {
    static let shared = AuthService()
    
    func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func createUser(credentials: RegistrationCredentials, completion: ((Error?) -> Void)?) {
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else {return}
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        ref.putData(imageData, metadata: nil) { (meta, error) in
            if let error = error {
                print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { (url, error) in
                guard let profileImageURL = url?.absoluteString else {return}
                
                
                Auth.auth().createUser(withEmail: credentials.email, password: credentials.passsword) { (result, error) in
                    if let error = error {
                        print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let uid = result?.user.uid else {return}
                    let data = ["email": credentials.email,
                                "fullname": credentials.fullname,
                                "profileImageUrl": profileImageURL,
                                "uid": uid,
                                "username": credentials.username] as [String: Any]
                    
                    Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
                }
            }
        }
    }
}
