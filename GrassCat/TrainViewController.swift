//
//  TrainViewController.swift
//  GrassCat
//
//  Created by Xyndi on 2020/6/3.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import UIKit
import RealmSwift
import AVFoundation

let realm = try! Realm()
var trains = Trains()


class TrainViewController: UIViewController {
    
    private var pendingRequestWorkItem: DispatchWorkItem?
    
    @IBOutlet weak var fullScreenButton: UIButton!
    @IBOutlet weak var TrainView: UIView!
    
    @IBOutlet weak var Money: UILabel!
    
    @IBOutlet weak var TrainSiteButton: UIButton!
    @IBOutlet weak var TrainSeedButton: UIButton!
    @IBOutlet weak var TrainSeed1Button: UIButton!
    @IBOutlet weak var TrainSeed2Button: UIButton!
    @IBOutlet weak var TrainBoxButton: UIButton!
    
    @IBOutlet weak var seed0Paw: UIButton!
    @IBOutlet weak var seed1Paw: UIButton!
    @IBOutlet weak var seed2Paw: UIButton!
    
    @IBOutlet weak var box1Btn: UIButton!
    
    @IBOutlet weak var Seed0Btn: UIView!
    @IBOutlet weak var testCout: UIButton!
    
    @IBOutlet weak var Seed1Btn: UIView!
    @IBOutlet weak var testCount2: UIButton!
    
    @IBOutlet weak var Seed2Btn: UIView!
    @IBOutlet weak var testCount3: UIButton!
    
    @IBOutlet weak var TrainConfirm: UIButton!
    
    @IBOutlet weak var TrainCombineButton: UIButton!
    @IBOutlet weak var TrainStoreButton: UIButton!
    
    @IBOutlet weak var textBox: UILabel!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var CatBoxStack: UIStackView!
    @IBOutlet weak var ItemStack: UIStackView!
    
    @IBOutlet weak var getSeedsView: UIView!
    @IBOutlet weak var getMoreSeeds: UIView!
    
    @IBOutlet weak var testUP: UIButton!
    @IBOutlet weak var testScrollView: UIScrollView!
    
    @IBOutlet weak var testTime: UIButton!
    
    @IBOutlet weak var TrainSpeedUp: UIButton!
    @IBOutlet weak var GetNewSeeds: UIImageView!
    
    @IBOutlet weak var Item1Btn: UIButton!
    @IBOutlet weak var ItemPaw1: UIButton!
    @IBOutlet weak var TrainItem1: UIButton!
    
    @IBOutlet weak var Item2Btn: UIButton!
    @IBOutlet weak var ItemPaw2: UIButton!
    @IBOutlet weak var TrainItem2: UIButton!
    
    @IBOutlet weak var TrainSiteCat1: UIButton!
    
    @IBOutlet weak var TrainCatSite1_2: UIButton!
    @IBOutlet weak var TrainTime1_2: UIButton!
    @IBOutlet weak var TrainHand: UIButton!
    
    @IBOutlet weak var getCombineSeed: UIImageView!
    @IBOutlet weak var getNewCombineSeed: UIImageView!
    
    @IBOutlet weak var kuroSmallImage: UIImageView!
    
    var player: AVAudioPlayer!
    var BGMplayer: AVPlayerLooper!
    var queuePlayer: AVQueuePlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playMusic()
        
        buttonInit()
        
        rotate()
        
        playTraining()
        
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
    func rotate(){
        let rotateArray = [testTime,testCout,testCount2,testCount3,TrainTime1_2]//,TrainSpeedUp]
        for e in rotateArray{
            e!.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/15))
        }
    }
    func buttonInit(){
        
        pendingRequestWorkItem?.cancel()
        let setAlpha0Array = [CatBoxStack,TrainView,textView,fullScreenButton,Seed1Btn,Seed2Btn,seed0Paw,seed1Paw,seed2Paw,ItemStack,ItemPaw1,ItemPaw2]
        for e in setAlpha0Array{
            e!.alpha = 0
        }
        
        let setIsHiddenArray = [testTime,TrainSiteButton,TrainSeedButton,TrainSeed1Button,TrainSeed2Button,TrainBoxButton,TrainCombineButton,TrainStoreButton,TrainCatSite1_2,TrainTime1_2,TrainHand,getSeedsView,getMoreSeeds,TrainConfirm,TrainSpeedUp,TrainItem1,TrainItem2,getNewCombineSeed]
        for e in setIsHiddenArray{
            e!.isHidden = true
        }
        textView.transform = CGAffineTransform(translationX: 0, y: 0)
        box1Btn.setImage(UIImage(named: "blank.png"), for: .normal)
        testTime.titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
    @IBAction func TESTUPPressed(_ sender: Any) {
        
        let contentHeight = testScrollView.contentLayoutGuide.layoutFrame.height
        let frameHeight = testScrollView.frameLayoutGuide.layoutFrame.height
        let nowContentY = testScrollView.contentOffset.y
        
        if nowContentY < contentHeight - frameHeight - 15 {
            testScrollView.setContentOffset(CGPoint(x: 0, y: nowContentY + 20), animated: true)
        }
        else {
            
            testScrollView.setContentOffset(CGPoint(x: 0, y: nowContentY + 20), animated: true)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                self.testScrollView.setContentOffset(CGPoint(x: 0, y: nowContentY ), animated: true)
            }
            
        }
        
    }
    
    func dispatchTime(){
        let dispatchTimetask = DispatchWorkItem { self.next()
        }
        
        pendingRequestWorkItem = dispatchTimetask
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5, execute: dispatchTimetask)
        
    }
    
    //MARK: - training logic
    func playTraining(){
        
        
        let train = trains.getWords()
        
        let setAlpha1Array = [textView,TrainView,fullScreenButton]
        
        for e in setAlpha1Array{
            e!.alpha = 1
        }
        if train.Words == ""{
            textView.alpha = 0
        }
        
        textBox.text = train.Words
        print(train.Words)
        
        switch train.Tag{
            
        case "CatSite":
            TrainSiteButton.isHidden = false
            fullScreenButton.alpha = 0
            
        case "Seed00":
            CatBoxStack.alpha = 1
            TrainSeedButton.isHidden = false
            fullScreenButton.alpha = 0
            testCout.titleLabel?.text = "1"
        case "Box00":
            textView.transform = CGAffineTransform(translationX: 0, y: -50)
            CatBoxStack.alpha = 1
            TrainBoxButton.isHidden = false
            fullScreenButton.alpha = 0
            seed0Paw.alpha = 1
            
        case "Confirm00":
            CatBoxStack.alpha = 1
            fullScreenButton.alpha = 0
            seed0Paw.alpha = 1
            box1Btn.setImage(UIImage(named: "Select.png"), for: .normal)
            TrainConfirm.isHidden = false
        //加個按確認的case，選取匡要放BOX
        case "PlantSeed1":
            testTime.alpha = 1
            testTime.isHidden = false
            testTime.setTitle("1:59", for: .normal)
            TrainSiteCat1.setBackgroundImage(UIImage(named: "dirt.png"), for: .normal)
            TrainSiteCat1.setImage(UIImage(named: "box01.png"), for: .normal)
            let endTime = Date() + 120
            timeSche(repeats: true, runtime: 1, doomsTime: endTime)
            print("NOW is : \(Date()) End at: \(endTime)")
            dispatchTime()
            
        case "WaitSeed1time":
            testTime.isHidden = false
            TrainView.alpha = 0
            dispatchTime()
            print("\(train.Tag) TASK START")
            
            
        case "PlantingSeed1":
            testTime.isHidden = false
            dispatchTime()
            
        case "WaitSeed1time0":
            testTime.isHidden = false
            testTime.setTitle("0:0", for: .normal)
            TrainSiteCat1.setBackgroundImage(UIImage(named: "cat01-3.png"), for: .normal)
            self.timerSche!.invalidate()
            TrainView.alpha = 0
            dispatchTime()
            print("\(train.Tag) TASK START")
            
        case "Seed1Complete":
            let setAlpha1Array = [TrainCatSite1_2,TrainTime1_2,testTime,TrainHand]
            TrainCatSite1_2.setBackgroundImage(UIImage(named: "cat01-3.png"), for: .normal)
            TrainCatSite1_2.setImage(UIImage(named: "box01.png"), for: .normal)
            for e in setAlpha1Array{
                e!.isHidden = false
                e!.alpha = 1
            }
            fullScreenButton.alpha = 0
        case "GetSeeds":
            getSeedsView.alpha = 1
            getSeedsView.isHidden = false
            testCount2.titleLabel?.text = "5"
            textView.transform = CGAffineTransform(translationX: 0, y: -200)
            TrainSiteCat1.setBackgroundImage(UIImage(named: "cat0.png"), for: .normal)
            TrainSiteCat1.setImage(UIImage(named: "box00.png"), for: .normal)
            GetNewSeeds.image = UIImage(named: "cat01.png")
        case "MoreSeeds":
            getMoreSeeds.alpha = 1
            getMoreSeeds.isHidden = false
            Money.text = "50"
            textView.transform = CGAffineTransform(translationX: 0, y: -200)
            
        case "CatSite_2Seed_1":
            TrainSiteButton.isHidden = false
            fullScreenButton.alpha = 0
        case "Seed00_2Seed":
            fullScreenButton.alpha = 0
            CatBoxStack.alpha = 1
            Seed1Btn.alpha = 1
            TrainSeedButton.isHidden = false
            testCout.titleLabel?.text = "5"
        case "Box00_2Seed":
            seed0Paw.alpha = 1
            fullScreenButton.alpha = 0
            CatBoxStack.alpha = 1
            Seed1Btn.alpha = 1
            TrainBoxButton.isHidden = false
            testCout.titleLabel?.text = "5"
        //選取匡！！
        case "Confirm02":
            CatBoxStack.alpha = 1
            Seed1Btn.alpha = 1
            seed0Paw.alpha = 1
            fullScreenButton.alpha = 0
            box1Btn.setImage(UIImage(named: "Select.png"), for: .normal)
            TrainConfirm.isHidden = false
            //加個按確認的case，選取匡要放BOX
            
        case "Wait2Seed":
            testTime.alpha = 1
            testTime.isHidden = false
            testTime.setTitle("1:59", for: .normal)
            TrainSiteCat1.setBackgroundImage(UIImage(named: "dirt.png"), for: .normal)
            TrainSiteCat1.setImage(UIImage(named: "box01.png"), for: .normal)
            let endTime = Date() + 120
            timeSche(repeats: true, runtime: 1, doomsTime: endTime)
            print("NOW is : \(Date()) End at: \(endTime)")
            TrainView.alpha = 0
            dispatchTime()
            
        case "SpeedUP":
            testTime.isHidden = false
            dispatchTime()
            TrainSpeedUp.isHidden = false
            
        case "CatSite_2Seed_2":
            testTime.isHidden = false
            testTime.setTitle("0:0", for: .normal)
            TrainSiteCat1.setBackgroundImage(UIImage(named: "cat02-3.png"), for: .normal)
            //self.timerSche!.invalidate()
            TrainView.alpha = 0
            dispatchTime()
            
        case "Seed2Complete":
            let setAlpha1Array = [TrainCatSite1_2,TrainTime1_2,testTime,TrainHand]
            TrainCatSite1_2.setBackgroundImage(UIImage(named: "cat02-3.png"), for: .normal)
            TrainCatSite1_2.setImage(UIImage(named: "box01.png"), for: .normal)
            for e in setAlpha1Array{
                e!.isHidden = false
                e!.alpha = 1
            }
            fullScreenButton.alpha = 0
            //
            self.timerSche!.invalidate()
            
        case "GetSeed02":
            getSeedsView.alpha = 1
            getSeedsView.isHidden = false
            testCount3.titleLabel?.text = "5"
            textView.transform = CGAffineTransform(translationX: 0, y: -200)
            TrainSiteCat1.setBackgroundImage(UIImage(named: "cat0.png"), for: .normal)
            TrainSiteCat1.setImage(UIImage(named: "box00.png"), for: .normal)
            GetNewSeeds.image = UIImage(named: "cat02.png")
            
        case "combine":
            Money.text = "100"
            TrainCombineButton.isHidden = false
            fullScreenButton.alpha = 0
            
        case "Combining1":
            fullScreenButton.alpha = 0
            ItemStack.alpha = 1
            TrainItem1.isHidden = false
            textView.transform = CGAffineTransform(translationX: 0, y: 100)
            
        case "Combining2":
            fullScreenButton.alpha = 0
            ItemStack.alpha = 1
            TrainItem2.isHidden = false
            ItemPaw1.alpha = 1
            textView.transform = CGAffineTransform(translationX: 0, y: 100)
        case "CombineConfirm":
            fullScreenButton.alpha = 0
            ItemStack.alpha = 1
            ItemPaw1.alpha = 1
            ItemPaw2.alpha = 1
            TrainConfirm.isHidden = false
            TrainConfirm.transform = CGAffineTransform(translationX: 0, y: -35)
        case"GetCombineResult":
            
            getMoreSeeds.alpha = 1
            getMoreSeeds.isHidden = false
            getNewCombineSeed.isHidden = false
            getCombineSeed.image = UIImage(named: "cat03.png")
            textView.transform = CGAffineTransform(translationX: 0, y: -200)
            
        case"Store":
            TrainStoreButton.isHidden = false
        default:
            textView.alpha = 1
            
        }
        
        trains.nextProgress()
    }
    
    
    func next(){
        buttonInit()
        playTraining()
    }
    //MARK: - countDown
    var timerSche: Timer?
    
    func timeSche(repeats: Bool, runtime: TimeInterval, doomsTime: Date){
        print("timeSche")
        
        timerSche = Timer.scheduledTimer(withTimeInterval: runtime, repeats: repeats, block: { (_) in
            let nowTime = Date()
            //let doomsTime = self.endTime
            let interval = doomsTime.timeIntervalSince(nowTime)
            let secInt = Int(interval)%60
            let minsInt = Int(interval/60)%60
            print(interval)
            print(Int(interval))
            self.testTime.setTitle("\(minsInt):\(secInt)", for: .normal)
            
            
            print("\(minsInt):\(secInt)")
            
            if nowTime >= doomsTime{
                self.timerSche!.invalidate()
            }
            
            //text = "\(minsInt):\(secInt)"
            
        })
    }
    func playMusic(){
        
        if realm.objects(SoundData.self)[0].musicOpen == true{
            print(realm.objects(SoundData.self)[0].musicOpen)
            if queuePlayer?.items() == nil {
                let url = Bundle.main.url(forResource: "BGM1", withExtension: "wav")
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
    //MARK: - move on
    @IBAction func PressedAnywhere(_ sender: UIButton) {
        playSoundEffect(fileName: "1")
        let train = trains.getWords()
        var seed = SeedLib()
        var box = BoxLib()
        if train.Tag == "END"
        {
            
            performSegue(withIdentifier: K.trainOver, sender: self)
            let seedData0 = SeedsData(value:[0,0,"cat0","黑影",4])
            
            let array = box.getBoxesData(NO: 1)
            let boxData1  = BoxesData(value:[array.Seq,array.NO,array.Name,array.Image])//[1,"box01"])
            
            try! realm.write {
                realm.objects(MainData.self)[0].train = true
                realm.objects(MainData.self)[0].mainMoney = 100
                realm.add(seedData0)
                realm.add(boxData1)
            }
            var seq = 1
            let amountArray = [0,0,5]
            for _ in 1...3{
                let array = seed.getNameImage(NO: seq)
                let seedData = SeedsData(value:[array.Seq,array.NO,array.Image,array.Name,amountArray[seq - 1],array.Spec])
                try! realm.write {
                    realm.add(seedData)
                }
                seq += 1
            }
            loadSiteDatas()
        }
        else{
            buttonInit()
            playTraining()
        }
    }
    func loadSiteDatas(){
        let siteDataArray = realm.objects(SiteData.self)
        if siteDataArray.count > 0 {
            return
        }
        let siteNameArray = ["catSite1","catSite2","catSite3","catSite4","catSite5","catSite6","catSite7","catSite8"]
        var seq = 0
        for _ in 0...7{
            let defaultData = SiteData(value:[siteNameArray[seq]])
            try! realm.write {
                realm.add(defaultData)
            }
            seq += 1
        }
    }
    
}


