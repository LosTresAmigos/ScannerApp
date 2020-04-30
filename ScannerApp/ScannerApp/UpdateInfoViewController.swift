//
//  UpdateInfoViewController.swift
//  ScannerApp
//
//  Created by Ervin Del Cid on 4/25/20.
//  Copyright © 2020 LosTresAmigos. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class UpdateInfoViewController: UIViewController {

    @IBOutlet weak var primaryNameVar: UITextField!
    @IBOutlet weak var primaryPhoneVar: UITextField!

    @IBOutlet weak var secondaryNameVar: UITextField!
    @IBOutlet weak var secondaryPhoneVar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func updateButtonClicked(_ sender: UIButton) {
        let primaryName = primaryNameVar.text!
        let primaryPhone = primaryPhoneVar.text!
        let secondaryName = secondaryNameVar.text!
        let secondaryPhone = secondaryPhoneVar.text!
        
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser!.uid
               
        let docRef = db.collection("user").document(userID)
        docRef.setData(["Primary Name":primaryName,"Primary Phone": primaryPhone,"Secondary Name": secondaryName,"Secondary Phone": secondaryPhone], merge: true)
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
