//
//  PostController.swift
//  LayoutGallery
//
//  Created by Muhammad Asad on 9/28/19.
//  Copyright © 2019 Muhammad Asad. All rights reserved.
//

import Foundation
import UIKit


import Kingfisher
class PostController :UIViewController {
    
    struct postCell {
        var poster: String
        var thumb : String
        var body: String
    }
    
    var posts  = [postCell]()
    struct localDataCell {
        
        var thumb:String
        var body:String
        var image:String
        var id : Int
        var likes: Int = 0
       
        
    }
    
    var localData = [localDataCell(thumb: "https://tinyfac.es/data/avatars/7D3FA6C0-83C8-4834-B432-6C65ED4FD4C3-500w.jpeg", body:"First perhaps based to viable time to myself. And the have frame.", image: "https://media.treehugger.com/assets/images/2016/09/urban-cabin-tiny-portable-cedar-cabins-4.jpg.400x300_q90_crop-smart.jpg" ,id:1,likes:32),
                     localDataCell(thumb: "https://pbs.twimg.com/profile_images/974736784906248192/gPZwCbdS.jpg", body:"Their off universal writers, said go. In stand of your the yards and my note designer; Narrowness may day a the for on temple seal transactions language waved at never then he know big a myself place it simple", image: "https://s3-production.bobvila.com/slides/4208/widened/smallapartment_freshome.com.jpg?1501001230",id:2,likes:12),
                       localDataCell(thumb: "https://randomuser.me/api/portraits/men/33.jpg", body:"Let disciplined and to switching and presented. ", image: "https://www.midsouthshooterssupply.com/images/product_images/020-0013/020-0013_2.jpg",id:3,likes:21),
                       localDataCell(thumb: "https://tinyfac.es/data/avatars/A7299C8E-CEFC-47D9-939A-3C8CA0EA4D13-200w.jpeg", body:"Maybe crap much very the away stupid text graduate. Steps. Clearly, handles various belly, the the hologram here. Choose be those is was way ", image: "https://mcn-images.bauersecure.com/PageFiles/643168/450x300/burgman-xmax-scooter-01.jpg",id:4,likes:41)]
    
    
    @IBOutlet weak var postTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsers { (status, data, error) in
            if(status) {
                guard let postData = data as? [postCell] else {return}
               
                self.posts = postData
                self.postTableView.reloadData()
                //self.indicator.stopAnimating()
                //self.tableView.reloadData()
            }
                
            else if let error = error {
                print(error)
            }
        }
        
        postTableView.estimatedRowHeight = 200
        postTableView.rowHeight = UITableView.automaticDimension
        
    }
    
    
    
    func getUsers(completion: @escaping (Bool, Any?, Error?) -> Void){
        
        
        guard let url = URL(string: "https://www.reddit.com/r/pics.json") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url){
            (data,response,error) in
          
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    do {
                        
                        guard   let finalJson = try json as? [String: Any] else {return}
 
                        if let data = finalJson["data"] as? [String:Any] {
                            if let array = data["children"] as? [[String:Any]] {
                                //here array contains children elements...
                           
                                var names = [postCell] ()
                                for user in array {
                                    guard let obj = user["data"] as? [String:Any] else {return}
                                    guard let poster = obj["author_fullname"] as? String else {return}
                                    guard let thumb = obj["thumbnail"] as? String else {return}
                                    guard let body = obj["title"] as? String else {return}
                                    
                                    names.append(postCell(poster: poster, thumb: thumb, body: body))
                                }
                               
                                DispatchQueue.main.async {
                                    completion(true,names, nil)
                                    
                                }
                            
                            }
                        }
                       
                    } catch  {
                        print(error)
                        completion(false, nil, error)
                    }
                }
                catch {
                    print (error)
                }
                
            }
            if let error = error {
                print(error)
            }
            
            }.resume()
        
    }
    
}

extension PostController : PostCellDelegate {
    func moreButtonTapped(data: Any) {
        print(data)
        //show action sheet
        
        
        let actionSheet = UIAlertController(title: "Options for cell", message: "What you wanna do?", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let rate = UIAlertAction(title: "Rate", style: .default) { (action) in
            //do something
        }
        let cancelbooking = UIAlertAction(title: "Cancel Booking", style: .default) { (action) in
            //do something
        }
        actionSheet.addAction(rate)
        actionSheet.addAction(cancelbooking)
        actionSheet.addAction(cancel)
        
        present(actionSheet,animated: true,completion: nil)
    }
    
    func likeButtonTapped(data:Int){
        
//        guard let cell = sender.superview?.superview as? YourCellClassHere else {
//            return // or fatalError() or whatever
//        }
//
//        let indexPath = itemTable.indexPath(for: cell)
        
        if let foo = self.localData.index(where: {$0.id == data}) {
           
            
           self.localData[foo].likes = self.localData[foo].likes+1
         
            DispatchQueue.main.async { self.postTableView.reloadData() }

            // do something with foo
        } else {
            // item could not be found
        }
        print(data)
    }
}


extension PostController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.localData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell =  postTableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as?   PostViewCell else {return UITableViewCell()}
        
//       cell.postCreator.text = posts[indexPath.row].poster
//        cell.postTitle.text = posts[indexPath.row].body
//        cell.setImage(imageUrl: posts[indexPath.row].thumb)
        
        cell.postCreator.text = "Damien martin"
           cell.postTitle.text = localData[indexPath.row].body
                cell.setImage(imageUrl: localData[indexPath.row].thumb)
       cell.likesCount.text = String(localData[indexPath.row].likes)
        cell.setPostImage(imageUrl: localData[indexPath.row].image)
        
        cell.cellId = localData[indexPath.row].id
        cell.delegate = self
        return cell
    }
    }
