//
//  LogOutViewController.swift
//  HW02
//
//  Created by Vattanac on 11/9/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit

class LogOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.performSegue(withIdentifier: "loginId", sender: self)
    }
    

}
