//
//  LogOutViewController.swift
//  HW02
//
//  Created by Vattanac on 11/9/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit

class LogOutViewController: UIViewController {

    @IBOutlet weak var WelcomNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

   
        let namedatastore = UserDefaults.standard.string(forKey: "username")
       // let passworddatastore = UserDefaults.standard.string(forKey: "password")
       
        WelcomNameLabel.text = "Welcome \(namedatastore!)"
    }
    

}
