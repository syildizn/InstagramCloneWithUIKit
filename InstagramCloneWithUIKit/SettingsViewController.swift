//
//  SettingsViewController.swift
//  InstagramCloneWithUIKit
//
//  Created by Seçkin Yıldız on 28.11.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut(_ sender: Any) {
        performSegue(withIdentifier: "toViewControler", sender: nil)
    }
    


}
