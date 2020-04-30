//
//  ViewController.swift
//  ScannerApp
//
//  Created by Raul Flores on 4/8/20.
//  Copyright © 2020 LosTresAmigos. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: Any) {
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
                let userID = Auth.auth().currentUser!.uid
                let db = Firestore.firestore()
                let docRef = db.collection("user").document(userID)
                docRef.getDocument() { (document, error) in
                    if let document = document{
                                   
                        if document.exists {
                            self.performSegue(withIdentifier: "goHome", sender: self)
                        }
                        else {
                        //   self.performSegue(withIdentifier: "goHome", sender: self)

                        self.performSegue(withIdentifier: "goSetUp", sender: self)
                                       }
                                   }
                            }
            }
}

