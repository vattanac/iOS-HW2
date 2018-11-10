//
//  SignUpViewController.swift
//  HW02
//
//  Created by Vattanac on 11/9/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit
protocol SignUpDelegation {
    func setUpAccount(name:String,password:Int)
    
}
class SignUpViewController: UIViewController {

    
    var accountList = [Account]()
    var sigupDelegation: SignUpDelegation!
    
    
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var ConfirmPasswordLabel: UITextField!
    @IBOutlet weak var signUpLabel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        signUpLabel.layer.cornerRadius = 5
        
    }
    
    
    @IBAction func SignUpButton(_ sender: Any) {
         var user = Account(username: nil, password: nil)
        
         let username = usernameLabel.text!
         let password = passwordLabel.text!
         let confirmpassword = ConfirmPasswordLabel.text!
        
        if(username.isEmpty || password.isEmpty || confirmpassword.isEmpty){
           
            displayMessage(msg: "Please Input value!!")
            return
        }
        if(password != confirmpassword){
            displayMessage(msg: "Password Not much!")
            ConfirmPasswordLabel.text = ""
            ConfirmPasswordLabel.becomeFirstResponder()
            return
        }
        //print("Name:\(username)","password:\(password)")
        
        else{
            user.username = username
            user.password = Int(password)
            
            accountList.append(user)
           
        }
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.synchronize()
        
        
        for a in accountList {
            print("name:\(a.username!)","password:\(a.password!)")
        }
        
        let myalert = UIAlertController(title: "alert", message: "Registeration is Succesful", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        myalert.addAction(okAction)
        self.present(myalert, animated: true, completion: nil)
        
    }
    
    
    func displayMessage(msg:String){
        let myAlert = UIAlertController(title: "Alert", message: msg, preferredStyle:.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    

}
