//
//  LoginViewModel.swift
//  FireChat
//
//  Created by Robert Morrow on 5/27/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
    }
}
