//
//  PostSectionHeaderView.swift
//  Makestagram
//
//  Created by nurzhan on 7/4/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import UIKit

class PostSectionHeaderView: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var postTimeLabel: UILabel!
    
    
    var post: Post? {
        didSet {
            if let post = post {
                usernameLabel.text = post.user?.username
            }
        }
    }
}
