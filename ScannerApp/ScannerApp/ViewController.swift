//
//  ViewController.swift
//  ScannerApp
//
//  Created by Raul Flores on 4/8/20.
//  Copyright © 2020 LosTresAmigos. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController {

    @IBOutlet weak var scanButton: UIButton!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var newaccountButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: UIButton) {
   
    //Get the default auth UI Objext
                 let authUI = FUIAuth.defaultAuthUI()
                 
                 guard authUI != nil else {
                     //log the error
                     return
                 }
             
                 
                 // Set ourselbes as the delegate
                 authUI?.delegate = self
                 authUI?.providers = [FUIEmailAuth()]
                 
                 // Get the reference to the auth UI view controller
                 let authViewController = authUI?.authViewController()
                 
                 // Show it
                 present(authViewController!, animated: true, completion: nil)
                 
             
         }
         
        
     }
         extension ViewController: FUIAuthDelegate {
             func authUI(_ authUi: FUIAuth, didSignInWith authDataResult:
                 AuthDataResult?, error: Error?){
                 
                 if error != nil {
                     //Log error
                     return
                 }
                 
                 // authDataResult?.user.uid
                 
                 performSegue(withIdentifier: "goSetUp", sender: self)
             }
}

