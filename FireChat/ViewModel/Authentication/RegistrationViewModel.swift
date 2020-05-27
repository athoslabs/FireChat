//
//  RegistrationViewModel.swift
//  FireChat
//
//  Created by Robert Morrow on 5/27/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import Foundation

struct RegistrationViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
            && fullname?.isEmpty == false
            && username?.isEmpty == false
    }
}

