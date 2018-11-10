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
    var Lusername:String!
    var Lpassword:Int!
    
    
    @IBAction func LoginButton(_ sender: Any) {
        
        let userNameInput = usernameTextField.text
        let passwordInput = passwordTextField.text
        
        let namedatastore = UserDefaults.standard.string(forKey: "username")
        let passworddatastore = UserDefaults.standard.string(forKey: "password")
        
        print("UserName:\(namedatastore) & Password:\(passworddatastore)")
        if(namedatastore == userNameInput){
            if(passworddatastore == passwordInput){
                UserDefaults.standard.set(true, forKey: "isUserLogin")
                UserDefaults.standard.synchronize()
                
                shouldPerformSegue(withIdentifier: "logoutId", sender: self)
               // self.dismiss(animated: true, completion: nil)
              //self.performSegue(withIdentifier: "logoutId", sender: self)
              //  PrePairSegueWithIdentifier(identifier: "logoutId", sender: self)
            }
            else {return}
            
        }
        print("Helloo")
        
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
           self.performSegue(withIdentifier: "signupId", sender: self)
//       var delegate = storyboard?.instantiateViewController(withIdentifier: "signup") as! SignUpViewController
//
//        delegate.sigupDelegation = self //as! SignUpDelegation
//        present(delegate, animated: true, completion: nil)
//
//
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
    }
    
    override  func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "logoutId" { // you define it in the storyboard (click on the segue, then Attributes' inspector > Identifier
            
            if( usernameTextField.text?.isEmpty == true && passwordTextField.text?.isEmpty == true){
                print("*** NOPE, segue wont occur")
                return false
            }
            else {
                print("*** YEP, segue will occur")
            }
        }
        
        // by default, transition
        return true
    }
}
extension LoginViewController:SignUpDelegation{
    func setUpAccount(name: String, password: Int) {
        Lusername = name
        Lpassword = password
    }
    
    
}

    
    

