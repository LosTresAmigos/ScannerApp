//
//  InfoViewController.swift
//  ScannerApp
//
//  Created by Raul Flores on 4/11/20.
//  Copyright © 2020 LosTresAmigos. All rights reserved.
//

import UIKit
import Firebase

class InfoViewController: UIViewController{

    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var email: UILabel!
    
    
    @IBOutlet weak var phone: UILabel!
    
    var num = ""
    override func viewDidLoad() {
    super.viewDidLoad()
        let db = Firestore.firestore()
        db.collection("user").whereField("QRCode", arrayContains: num)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        self.nameLabel.text = document.get("Primary Name") as? String
                        self.email.text = document.get("Primary Phone") as? String
                        self.phone.text = document.get("Secondary Phone") as? String
                }
        }
    }
    
}
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
}
