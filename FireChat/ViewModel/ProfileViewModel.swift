//
//  ProfileViewModel.swift
//  FireChat
//
//  Created by Robert Morrow on 6/1/20.
//  Copyright © 2020 Athos, Inc. All rights reserved.
//

import Foundation

enum ProfileViewModel: Int, CaseIterable{
    case accountInfo
    case settings
    
    var description: String {
        switch self {
        case .accountInfo: return "Account Info"
        case .settings: return "Settings"
        }
    }
    
    var iconImageName: String {
        switch self {
        case .accountInfo: return "person.circle"
        case .settings: return "gear"
        }
    }
}
