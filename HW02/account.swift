//
//  account.swift
//  HW02
//
//  Created by Vattanac on 11/9/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import Foundation

class Account {
    var username:String!
    var password:Int!
    init(){
        
    }
    init(username:String?,password:Int?) {
        self.username = username
        self.password = password
    }
}
