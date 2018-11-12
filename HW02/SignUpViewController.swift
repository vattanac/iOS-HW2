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
    func ValidateUserName() -> Bool {
        let username = usernameLabel.text!
        let regex = "[A-Z0-9a-z]+"
        let valid = NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: username)
        return valid
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
        
        else{
            if !ValidateUserName(){
                print(ValidateUserName())
                displayMessage(msg: "Please Input String User's Name!")
            }else{
                
                  print("Hello")
            }

           
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
    
    override  func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "logoutId" {
            
            if( usernameLabel.text?.isEmpty == true && passwordLabel.text?.isEmpty == true && ConfirmPasswordLabel.text?.isEmpty == true){
                print("*** NOPE, segue wont occur")
                return false
            }
            else {
                print("*** YEP, segue will occur")
            }
        }
        
        return true
    }
    func displayMessage(msg:String){
        let myAlert = UIAlertController(title: "Alert", message: msg, preferredStyle:.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    

}
