//
//  ViewController.swift
//  HW02
//
//  Created by Vattanac on 11/9/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginLabel: UIButton!
    @IBOutlet weak var signupLabel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginLabel.layer.cornerRadius = 5
        signupLabel.layer.cornerRadius = 5
    }


}

