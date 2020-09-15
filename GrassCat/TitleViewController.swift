//
//  TitleViewController.swift
//  GrassCat
//
//  Created by Xyndi on 2020/3/26.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import UIKit
import RealmSwift
import AVFoundation


class TitleViewController: UIViewController,UITextFieldDelegate {
    
    let realm = try! Realm()
    
    var stories = Stories()
    var tmpName = ""
    
    var player: AVAudioPlayer!
    var BGMplayer: AVPlayerLooper!
    var queuePlayer: AVQueuePlayer!
    //var mainArray : Results<MainData>?
    
    @IBOutlet weak var anywhereButton: UIButton!
    @IBOutlet weak var logoimage: UIImageView!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var logoStack: UIStackView!
    @IBOutlet weak var StartStack: UIStackView!
    
    @IBOutlet weak var startImage: UIImageView!
    
    @IBOutlet weak var StoryView0: UIStackView!
    @IBOutlet weak var StoryView1: UIStackView!
    @IBOutlet weak var StoryImage0: UIImageView!
    @IBOutlet weak var StoryText0: UILabel!
    @IBOutlet weak var NamedBox: UITextField!
    @IBOutlet weak var NamedConfirm: UIButton!
    @IBOutlet weak var ConfirmNO: UIButton!
    @IBOutlet weak var ConfirmYes: UIButton!
    
    @IBOutlet weak var startPage: UIImageView!
    
    @IBOutlet weak var StoryImageL: UIImageView!
    @IBOutlet weak var StoryImageR: UIImageView!
    @IBOutlet weak var StoryText: UILabel!
    
    @IBOutlet weak var storySkip: UIButton!
    
    
    var goToStory = false
    var chap = ""
    var logoPlayed = false
    override func viewDidAppear(_ animated: Bool) {
        NamedBox.delegate = self
        //        view.addSubview(NamedBox)
        //        NamedBox.becomeFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainArray = realm.objects(MainData.self)
        //        if mainArray.count == 0 {
        //
        //            let defaultMain = MainData(value:[0])
        //            try! realm.write {
        //                realm.add(defaultMain)
        //            }
        //        }
        
        let mainData = mainArray[0]
        if mainData.storyStatus == true{
            chap = "Story\(mainData.mainStory)"
        }
        else{
            chap = "Story\(mainData.reviewStory)"
        }
        
        if (mainArray[0].mainStory == 1 && mainArray[0].storyStatus == true) || (mainArray[0].storyStatus == false && mainArray[0].reviewStatus == false){
            logoAnime()
            StoryView0.alpha = 0
            StoryView1.alpha = 0
            storySkip.alpha = 0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5) {
                
                self.startAime()
            }}
            
        else{
            playMusic()
            
            loadMainDatas()
        }
        
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { (notification) in
            self.queuePlayer?.pause()
            
        }
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: nil) { (notification) in
            
            self.queuePlayer?.play()
            
        }
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) { (notification) in
            
            self.queuePlayer?.play()
            
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        queuePlayer?.removeAllItems()
    }
    @IBAction func pressAnywhere(_ sender: UIButton) {
        playSoundEffect(fileName: "5")
        
        let buttonName = sender.currentTitle!
        
        if buttonName == "Yes0"{//確認名字正確
            textFieldShouldReturn(NamedBox)
            print(tmpName)
            try! realm.write {
                realm.objects(MainData.self)[0].mainCatName = tmpName
            }
            
        }
        else if buttonName == "NO"{//名字錯誤（回到取名頁）
            stories.reNamed()
        }
        
        
        
        loadMainDatas()
        
    }
    
    
    func logoAnime(){
        anywhereButton.alpha = 0
        self.logoStack.alpha = 1
        self.startPage.alpha = 0
        self.StartStack.alpha = 0
        let logoArray = [#imageLiteral(resourceName: "LOGO01"),#imageLiteral(resourceName: "LOGO02"),#imageLiteral(resourceName: "LOGO03"),#imageLiteral(resourceName: "LOGO04"),#imageLiteral(resourceName: "LOGO05"),#imageLiteral(resourceName: "LOGO06"),#imageLiteral(resourceName: "LOGO07"),#imageLiteral(resourceName: "LOGO08")]
        let timeArray = [1.5,0.03,0.03,0.05,0.05,0.05,0.05,0.5]
        //var imageTime = 0.0
        logoimage.animationImages = logoArray
        logoimage.animationDuration = timeArray[logoArray.count - 1] * 1.3
        logoimage.animationRepeatCount = 1
        logoimage.image = logoArray.last
        logoimage.startAnimating()
        self.logoLabel.text = K.teamNameCh
        
        logoPlayed = true
    }
    
    func startAime(){
        anywhereButton.alpha = 0
        startPage.alpha = 1
        StartStack.alpha = 1
        
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut, .repeat], animations: {
            self.StartStack.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.anywhereButton.alpha = 1
        }
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        NamedConfirm.isHidden = false
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if (isBackSpace == -92) {
                
                print("DELETE")
                
                deleteText()
                
            }
        }
        if string.count == 0{
            return false
        }
        else {
            return true
        }
    }
    func deleteText(){
        let a = NamedBox.text
        print(a)
        print(a!.count)
        print(a!.prefix(upTo: a!.endIndex))
        if a?.count ?? 0 > 0{
            NamedBox.text = String(a!.prefix(upTo: a!.index(before: a!.endIndex)))
        }
        print(NamedBox.text)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tmpName = NamedBox.text!
        textField.resignFirstResponder()
        return true
    }
    func loadMainDatas(){
        let mainData = realm.objects(MainData.self)[0]
        if mainData.mainStory == 2 && mainData.train == false{
            print("should train")
            performSegue(withIdentifier: K.trainSegue, sender: self)
            
        }
        else if mainData.storyStatus == false && mainData.reviewStatus == false{
            playSoundEffect(fileName: "2")
            
            print("suould goto main")
            performSegue(withIdentifier: K.mainSegue, sender: self)
        }
        else{
            playMusic()
            let alpha0Array = [logoStack,startPage,StartStack]
            
            for a in alpha0Array{
                a!.alpha = 0
            }
            if mainData.storyStatus == false{
                               storySkip.alpha = 1
                           }
                           else{
                               storySkip.alpha = 0
                           }
            print("should play story \(chap)")
            //var chap = "Story\(mainData.mainStory)"
            
            var story = stories.getStory(chap)
            anywhereButton.alpha = 1
            
            if story.Chara == ""{
                
                let isHiddenArray = [NamedBox,NamedConfirm,ConfirmNO,ConfirmYes]
                for i in isHiddenArray{
                    i!.isHidden = true
                }
                let alpha1Array = [NamedBox,NamedConfirm,ConfirmNO,ConfirmYes,anywhereButton,StoryView0]
                for a in alpha1Array{
                    a!.alpha = 1
                }
                StoryView1.alpha = 0
                StoryImage0.image = UIImage(named: story.Tag)
                StoryText0.text = story.Lines
                StoryText0.textAlignment = NSTextAlignment.left
                StoryText0.transform = CGAffineTransform(translationX: 0, y: 0)
               StoryImage0.isHidden = false
                
                if story.Tag == "NAMED" {
                    StoryImage0.isHidden = true
                    anywhereButton.alpha = 0
                    NamedBox.isHidden = false
                    NamedBox.text = ""
                    StoryText0.textAlignment = NSTextAlignment.center
                    StoryText0.transform = CGAffineTransform(translationX: 0, y: -50)
                    NamedBox.delegate = self
                }
                if story.Tag == "Confirm Name" {
                    StoryImage0.isHidden = true
                    anywhereButton.alpha = 0
                    ConfirmYes.isHidden = false
                    ConfirmNO.isHidden = false
                    StoryText0.textAlignment = NSTextAlignment.center
                }
                if story.Tag == ""{
                    StoryImage0.isHidden = true
                }
            }
               
            else{
                StoryView0.alpha = 0
                StoryView1.alpha = 1
                StoryText.text = story.Lines
                if story.Chara == "主角"{
                    StoryImageL.image = UIImage(named: story.Image)
                    StoryImageL.alpha = 1
                    StoryImageR.alpha = 0.5
                    StoryImageL.layer.zPosition = 1
                    StoryImageR.layer.zPosition = 0
                }
                else{
                    StoryImageR.image = UIImage(named: story.Image)
                    StoryImageR.alpha = 1
                    StoryImageL.alpha = 0.5
                    StoryImageR.layer.zPosition = 1
                    StoryImageL.layer.zPosition = 0
                }
            }
            print(story.EndPoint)
            stories.nextProgress(story.EndPoint)
        }
    }
    func playMusic(slider: Bool = false){
        
        if realm.objects(SoundData.self)[0].musicOpen == true{
            print(realm.objects(SoundData.self)[0].musicOpen)
            if queuePlayer?.items() == nil {
                let url = Bundle.main.url(forResource: "BGM2", withExtension: "wav")
                let asset = AVAsset(url: url!)
                let item = AVPlayerItem(asset: asset)
                self.queuePlayer = AVQueuePlayer(playerItem: item)
                BGMplayer = AVPlayerLooper(player: queuePlayer, templateItem: item)
            }
            
            queuePlayer.volume = realm.objects(SoundData.self)[0].musicVolume
            queuePlayer.play()
        }
        else{
            print(realm.objects(SoundData.self)[0].musicOpen)
            if queuePlayer?.items() != nil {
                queuePlayer.pause()
            }
        }
        
    }
    func playSoundEffect(fileName: String){
        if realm.objects(SoundData.self)[0].soundOpen == true{
            let url = Bundle.main.url(forResource: fileName, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            
            player.volume = realm.objects(SoundData.self)[0].soundVolume
            player.play()
        }
    }
    @IBAction func skipPressed(_ sender: UIButton) {
        playSoundEffect(fileName: "2")
        try! realm.write{
            realm.objects(MainData.self)[0].reviewStatus = false
        }
        performSegue(withIdentifier: K.mainSegue, sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
protocol digitFieldDelegate {
    
    func backspacePressed()
    
}
