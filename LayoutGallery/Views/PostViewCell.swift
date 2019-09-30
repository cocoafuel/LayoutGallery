//
//  PostViewCell.swift
//  LayoutGallery
//
//  Created by Muhammad Asad on 9/28/19.
//  Copyright © 2019 Muhammad Asad. All rights reserved.
//

import UIKit

import Kingfisher
protocol PostCellDelegate {
    func moreButtonTapped(data: Any)
    func likeButtonTapped (data: Int)
    
}


class PostViewCell: UITableViewCell {

    var cellData: Any?
    var imageUrl: String?
    var cellId:Int?
    
    
    
    
    @IBOutlet weak var likesCount: UILabel!
    
    @IBOutlet weak var postCreator: UILabel!
    @IBOutlet weak var postThumb: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    
    
    @IBAction func heartPressed(_ sender: UIButton) {
        delegate?.likeButtonTapped(data: cellId!)
    }
    var delegate : PostCellDelegate?
    
    
    
    @IBAction func morePressed(_ sender: UIButton) {
        delegate?.moreButtonTapped(data: self.cellId! )

        }
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        makeImageRound()
//        postTitle.text = "Passenger baggage trolleys are available at designated places on complementary basis alongside the drop lane in front of briefing areas."
    }
    
    func setImage(imageUrl: String){
        self.imageUrl = imageUrl
        let url = URL(string: imageUrl)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            self.postThumb.image = UIImage(data : imageData)
        }
    }
    
    func setPostImage(imageUrl: String){
        let url = URL(string: imageUrl)
//        let data = try? Data(contentsOf: url!)
//
//        if let imageData = data {
//            self.postImage.image = UIImage(data : imageData)
//        }
self.postImage.kf.setImage(with: url )
        postImage.contentMode = .scaleAspectFill
    }
    
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
   func makeImageRound(){
    postImage.layer.masksToBounds = false
    postImage.layer.cornerRadius = 12
    postImage.clipsToBounds = true
    
    
    postThumb.layer.masksToBounds = false
    postThumb.layer.cornerRadius = postThumb.frame.height/2
    postThumb.clipsToBounds = true
    }
}
