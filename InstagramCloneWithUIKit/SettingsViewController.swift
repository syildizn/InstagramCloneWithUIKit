//
//  SettingsViewController.swift
//  InstagramCloneWithUIKit
//
//  Created by Seçkin Yıldız on 28.11.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }catch{
            print("error: ")
        }
    }
    


}
