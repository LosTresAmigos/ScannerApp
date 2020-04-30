//
//  ProfileViewController.swift
//  ScannerApp
//
//  Created by Raul Flores on 4/11/20.
//  Copyright © 2020 LosTresAmigos. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {

    
    
    @IBOutlet weak var keysButton: UIButton!
    
    
    
    @IBOutlet weak var contactButton: UIButton!
    
    
    @IBOutlet weak var infoButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser!.uid
        let docRef = db.collection("user").document(userID)
        docRef.getDocument { (document, error) in
            if let document = document{
                                   
                        if document.exists {
                            self.nameLabel.text = document.get("Primary Name") as? String
                        }
                        else {
                        print("Error getting documents: ")
                            }
                        }
                    }
        }
        // Do any additional setup after loading the view

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

