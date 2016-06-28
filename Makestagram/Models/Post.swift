//
//  Post.swift
//  Makestagram
//
//  Created by nurzhan on 6/28/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import Parse

// 1 Customized Parse Class for Post (consists of user and image). Use every time you want to create customized Parse class

class Post : PFObject, PFSubclassing {
    
    var image: UIImage?
    
    func uploadPost() {
        if let image = image {
            
            // we call method, grab the photo from image property, turn it into a PFFile called 'imageFile'
            let imageData = UIImageJPEGRepresentation(image, 0.8)!
            let imageFile = PFFile(name: "image.jpg", data: imageData)!
            
            //we assign imagefile to self.imageFile and then call saveInBackground to upload the Post
            self.imageFile = imageFile
            saveInBackground()
            
            
        }
    
    }
    
    // 2
    @NSManaged var imageFile: PFFile?
    @NSManaged var user: PFUser?
    
    // MARK: PFSubclassing protocol
    // 3
    
    static func parseClassName() -> String {
        return "Post"
    }
    
    // 4
    
    override init() {
        super.init()
    }
    override class func initialize() {
        var onceToken: dispatch_once_t = 0;
        dispatch_once(&onceToken) {
        // inform Parse about this subclass
            self.registerSubclass()
        }
        
    }
}