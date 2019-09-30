//
//  SegmentController.swift
//  LayoutGallery
//
//  Created by Muhammad Asad on 9/27/19.
//  Copyright © 2019 Muhammad Asad. All rights reserved.
//

import Foundation
import UIKit


class SegmentController : UIViewController {
@IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var foodSegment: UIView!
    
    @IBOutlet weak var artSegment: UIView!
    @IBOutlet weak var gameSegment: UIView!
    @IBAction func onSegmentChanged(_ sender: UISegmentedControl) {
        
        if segmentControl.selectedSegmentIndex == 0 {
            gameSegment.alpha = 1
            artSegment.alpha = 0
            foodSegment.alpha = 0
           
        }
            
            else if segmentControl.selectedSegmentIndex == 1 {
                gameSegment.alpha = 0
                artSegment.alpha = 1
                foodSegment.alpha = 0
           
            }
            else if segmentControl.selectedSegmentIndex == 2 {
                gameSegment.alpha = 0
                artSegment.alpha = 0
                foodSegment.alpha = 1
           
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.backgroundColor = .clear
        segmentControl.tintColor = .clear

        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "HelveticaNeue", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ], for: .normal)

        segmentControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "HelveticaNeue", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
            ], for: .selected)



    }

}

extension UISegmentedControl {
    
    func removeBorder(){
        
        self.tintColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        self.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor : UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)], for: .selected)
        self.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor : UIColor.gray], for: .normal)
        
    }
    
    func setupSegment() {
        self.removeBorder()
        let segmentUnderlineWidth: CGFloat = self.bounds.width
        let segmentUnderlineHeight: CGFloat = 2.0
        let segmentUnderlineXPosition = self.bounds.minX
        let segmentUnderLineYPosition = self.bounds.size.height - 1.0
        let segmentUnderlineFrame = CGRect(x: segmentUnderlineXPosition, y: segmentUnderLineYPosition, width: segmentUnderlineWidth, height: segmentUnderlineHeight)
        let segmentUnderline = UIView(frame: segmentUnderlineFrame)
        segmentUnderline.backgroundColor = UIColor.clear
        
        self.addSubview(segmentUnderline)
        self.addUnderlineForSelectedSegment()
        
    }
    func addUnderlineForSelectedSegment(){
        
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        underline.tag = 1
        self.addSubview(underline)
    }
    
    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        underline.frame.origin.x = underlineFinalXPosition
        
    }
}
