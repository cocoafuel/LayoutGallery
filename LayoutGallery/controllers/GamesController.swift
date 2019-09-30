//
//  GamesController.swift
//  LayoutGallery
//
//  Created by Muhammad Asad on 9/27/19.
//  Copyright © 2019 Muhammad Asad. All rights reserved.
//

import Foundation
import UIKit

class GamesController: UIViewController {
    

    struct TableCell {
        var  name : String
        var email : String
        var image : String
        
    }
    
    @IBOutlet weak var playersTableView: UITableView!
    var dummyData : [TableCell] = [TableCell(name: "Johan Lakiskamov", email: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisi scelerisque eu ultrices vitae auctor eu augue ut. Porttitor lacus luctus accumsan tortor posuere ac ut. Netus et malesuada fames ac turpis.", image: "https://randomuser.me/api/portraits/women/65.jpg"), TableCell(name: "Kiara Nightly", email: " Porttitor lacus luctus accumsan tortor posuere ac ut. Netus et malesuada fames ac turpis.", image: "https://randomuser.me/api/portraits/men/43.jpg"),
                                   TableCell(name: "Alex Milan", email: "Dui vivamus arcu felis bibendum ut tristique. Nec tincidunt praesent semper feugiat. Dolor sit amet consectetur adipiscing elit ut aliquam purus. Elementum nisi quis eleifend quam adipiscing vitae proin sagittis", image: "https://pbs.twimg.com/profile_images/974603248119222272/N5PLzyan.jpg")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       playersTableView.tableFooterView = UIView()
    }
}
extension GamesController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   self.dummyData.count
    }



    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell =  playersTableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as?   TableViewCell else {return UITableViewCell()}
        
        
        cell.name.text = dummyData[indexPath.row].name
        cell.email.text = dummyData[indexPath.row].email
cell.setImage(imageUrl: dummyData[indexPath.row].image)
        return cell
    }
}
