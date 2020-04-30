//
//  SignUpViewController.swift
//  ScannerApp
//
//  Created by Raul Flores on 4/11/20.
//  Copyright © 2020 LosTresAmigos. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var primaryContactName: UITextField!
    @IBOutlet weak var primaryContactPhone: UITextField!
    @IBOutlet weak var secondaryContactName: UITextField!
    @IBOutlet weak var secondaryContactPhone: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createAccountTapped(_ sender: Any) {
        let firstName = firstNameField.text!
        let lastName = lastNameField.text!
        let primaryName = primaryContactName.text!
        let primaryPhone = primaryContactPhone.text!
        let secondaryName = secondaryContactName.text!
        let secondaryPhone = secondaryContactPhone.text!
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser!.uid
        
        let newDocument = db.collection("user").document(userID)
        newDocument.setData(["First Name": firstName, "Last Name": lastName, "Primary Name": primaryName,"Primary Phone": primaryPhone, "Secondary Name": secondaryName,"Secondary Phone": secondaryPhone, "id":newDocument.documentID,"userID": userID  ])
                
        performSegue(withIdentifier: "goProfile", sender: self)

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
