//
//  ViewController.swift
//  InstagramCloneWithUIKit
//
//  Created by Seçkin Yıldız on 27.11.2023.
//

import UIKit
import FirebaseAuth
import FirebaseCore



class ViewController: UIViewController {

    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     


    }


  
    @IBAction func signIn(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                /*if error != nil {
                    self.makeAlert(titleInput: "Error !", messageInput: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }*/
                
                if let error = error as NSError? {
                    print("Hata Kodu: \(error.code), Hata Mesajı: \(error.localizedDescription)")
                        var message = ""

                        switch error.code {
                        case AuthErrorCode.invalidEmail.rawValue:
                            message = "Geçersiz email adresi."
                        default:
                            message = "E-posta adresi veya şifre hatalı. Lütfen bilgilerinizi kontrol edin."
                        }

                        self.makeAlert(titleInput: "Hata!", messageInput: message)
                    } else {
                        self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    }
            }
            
        }else{
            makeAlert(titleInput: "Error !", messageInput: "Email or password is empty")
        }
        
        
        print("basıldı")
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
         
            
            Auth.auth().createUser(withEmail: emailText.text! , password: passwordText.text! ) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error !", messageInput: error?.localizedDescription ?? "Error !")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else{
            makeAlert(titleInput: "Error !", messageInput: "Email or password is empty")
        }
        
        
    }
    
    func makeAlert(titleInput:String,messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

