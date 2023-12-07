//
//  FeedCell.swift
//  InstagramCloneWithUIKit
//
//  Created by Seçkin Yıldız on 7.12.2023.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseCore
import FirebaseStorage

class FeedCell: UITableViewCell {
    
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    
    @IBOutlet weak var documentIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func likeButtonClicked(_ sender: Any) {
        
        print("like button clicked")
        
        let fireStoreDatabase = Firestore.firestore()
        
        if let  likecount = Int(likeLabel.text!){
            
            let likeStore = ["likes": likecount + 1] as [String: Any]
            
            fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
            
            
        }
    }
    
}
