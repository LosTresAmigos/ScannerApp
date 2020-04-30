//
//  EditInfoViewController.swift
//  ScannerApp
//
//  Created by Ervin Del Cid on 4/25/20.
//  Copyright © 2020 LosTresAmigos. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class EditInfoViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var confirmEmailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateButtonClicked(_ sender: Any) {
        let firstName = firstNameField.text!
        let lastName = lastNameField.text!
        
        
         let userID = Auth.auth().currentUser!.uid
         let db = Firestore.firestore()
         
        // if (emailField == confirmEmailField){
             let email = emailField.text!
             let docRef = db.collection("user").document(userID)
             docRef.setData(["First Name":firstName,"Last Name": lastName,"Email": email], merge: true)
         //   }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
