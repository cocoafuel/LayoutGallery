//
//  TableViewCell.swift
//  LayoutGallery
//
//  Created by Muhammad Asad on 9/27/19.
//  Copyright © 2019 Muhammad Asad. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  
   
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var postImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setImage(imageUrl: String){
        let url = URL(string: imageUrl)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            self.postImage.image = UIImage(data : imageData)
        }
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
