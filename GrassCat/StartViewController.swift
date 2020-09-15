//
//  ViewController.swift
//  GrassCat
//
//  Created by Xyndi on 2020/3/25.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var anywhereButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        
        //var logoIndex = 0.0
        let logoArray = [#imageLiteral(resourceName: "LOGO01"),#imageLiteral(resourceName: "LOGO02"),#imageLiteral(resourceName: "LOGO03"),#imageLiteral(resourceName: "LOGO04"),#imageLiteral(resourceName: "LOGO05"),#imageLiteral(resourceName: "LOGO06"),#imageLiteral(resourceName: "LOGO07"),#imageLiteral(resourceName: "LOGO08")]
        let timeArray = [1,0.03,0.03,0.05,0.05,0.05,0.05,0.5]
        //var imageTime = 0.0
        logoImage.animationImages = logoArray
        logoImage.animationDuration = timeArray[logoArray.count - 1] * 1.3
        logoImage.animationRepeatCount = 1
        logoImage.image = logoArray.last
        logoImage.startAnimating()

        
        
        self.titleLabel.text = K.teamNameCh
        //        var charIndex = 0.0
        //        let titleText = K.teamNameCh
        //        for letter in titleText{
        //            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false){ (timer) in
        //                self.titleLabel.text?.append(letter)
        //            }
        //            charIndex += 1
        //        }
        
    }
    
    @IBAction func anywherePressed(_ sender: UIButton) {
        print("pressed")
        performSegue(withIdentifier: K.titleSegue, sender: self)
        
    }
    
}

