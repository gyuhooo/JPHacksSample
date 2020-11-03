//
//  FirebaseAction.swift
//  JPHacksSample
//
//  Created by Gyuho on 2020/11/02.
//

import Foundation
import UIKit
import Firebase

class FirebaseAction: NSObject {
    
    let storage = Storage.storage();
    var databaseRef: DatabaseReference!
    var userID: String!
    
    func fileupload(dataUrlStr: String?) -> String {
        //保存するURLを指定
        let storageRef = storage.reference(forURL: "path/to/project/url")
        //ディレクトリを指定
        let imageRef = storageRef.child("User").child("image.jpg")
        
        guard let dataUrlStr = dataUrlStr else {
                return ""
            }
        
        let dataUrl = URL(string: dataUrlStr)!
        var downloadUrl = ""
        
        // Upload the file to the path "images/image.jpg"
        let uploadTask = imageRef.putFile(from: dataUrl, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
            // Uh-oh, an error occurred!
            return
            }
            // Metadata contains file metadata such as size, content-type.
            let size = metadata.size
            // You can also access to download URL after upload.
            imageRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Uh-oh, an error occurred!
                    return
                }
                downloadUrl = downloadURL.absoluteString
            }
        }
        return downloadUrl
    }
    func uploadDocument(data: String, url: String){
        
    }
}
