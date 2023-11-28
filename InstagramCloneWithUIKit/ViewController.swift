//
//  ViewController.swift
//  InstagramCloneWithUIKit
//
//  Created by Seçkin Yıldız on 27.11.2023.
//

import UIKit


class ViewController: UIViewController {

    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


  
    @IBAction func signIn(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
        print("basıldı")
    }
    
    @IBAction func signUp(_ sender: Any) {
        
    }
    
}

