//
//  FeedViewController.swift
//  InstagramCloneWithUIKit
//
//  Created by Seçkin Yıldız on 28.11.2023.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage
import FirebaseCore


class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        
        cell.userEmailLabel.text = userEmailArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        cell.commentLabel.text = userCommentArray[indexPath.row]
        cell.userImageView.image = UIImage(named: "photo1.jpg")
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    var userEmailArray = [String] ()
    var userCommentArray = [String] ()
    var likeArray = [Int] ()
    var userImageArray = [String] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        getDataFromFirestore()
    }
    
    
    func getDataFromFirestore () {
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Posts").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }else{
                
                if snapshot?.isEmpty != true && snapshot != nil {
                    /*for document in snapshot?.documents{
                        let documentID = document.documentID
                        print(documentID)
                    }*/
                    
                    if let documents = snapshot?.documents, !documents.isEmpty {
                        for document in documents {
                            let documentID = document.documentID
                            print(documentID)
                            
                            if let postedBy = document.get("postedBy") as? String {
                                print(postedBy)
                                self.userEmailArray.append(postedBy)
                            }
                            
                            if let postComment = document.get("postComment") as? String {
                                print(postComment)
                                self.userCommentArray.append(postComment)
                            }

                            if let likes = document.get("likes") as? Int {
                                print(likes)
                                self.likeArray.append(likes)
                            }
                            
                            if let imageUrl = document.get("imageUrl") as? String {
                                print(imageUrl)
                                self.userImageArray.append(imageUrl)
                            }
                        }
                        
                        self.tableView.reloadData()
                    }

                }else{
                    
                }
                
                
            }
        }
        
        
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
