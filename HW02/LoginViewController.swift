//
//  LoginViewController.swift
//  HW02
//
//  Created by Vattanac on 11/9/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController  {
    
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var LoginLabel: UIButton!
    @IBOutlet weak var SignUpLabel: UIButton!
    var Lusername:String!
    var Lpassword:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         LoginLabel.layer.cornerRadius = 5
         SignUpLabel.layer.cornerRadius = 5
        
       

    }
    @IBAction func LoginButton(_ sender: Any) {
        
        let userNameInput = usernameTextField.text
        let passwordInput = passwordTextField.text
        
        let namedatastore = UserDefaults.standard.string(forKey: "username")
        let passworddatastore = UserDefaults.standard.string(forKey: "password")
        
        print("UserName:\(namedatastore!) & Password:\(passworddatastore!)")
        
        
        if( usernameTextField.text?.isEmpty != true && passwordTextField.text?.isEmpty != true){
            
            if(namedatastore == userNameInput && passworddatastore == passwordInput){
                
                    UserDefaults.standard.set(true, forKey: "isUserLogin")
                    UserDefaults.standard.synchronize()
                    
                   // shouldPerformSegue(withIdentifier: "logoutId", sender: self)
                    
                }
                else {
                    displayMessage(msg: "Please Check your Input again ")
                }
                
            }
            
    
        else{
            
            if(usernameTextField.text?.isEmpty == true && passwordTextField.text?.isEmpty == true ){
                
                displayMessage(msg: "Please Fill the Information ")
            }
            else if(passwordTextField.text?.isEmpty == true){
                displayMessage(msg: "Please Input Your password!")
            }
            else {
                displayMessage(msg: "Please Input Your User Name!")
            }
        }
        
    }
    
    
  
    func displayMessage(msg:String){
        let myAlert = UIAlertController(title: "Alert", message: msg, preferredStyle:.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    override  func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "logoutId" {
            if( usernameTextField.text?.isEmpty == true && passwordTextField.text?.isEmpty == true){
                displayMessage(msg: "Input text can't be empty!!")
                return false
            }
            else {
                print("Hello")
            }
        }
        
        return true
    }
}
extension LoginViewController:SignUpDelegation{
    func setUpAccount(name: String, password: Int) {
        Lusername = name
        Lpassword = password
    }
    
    
}



