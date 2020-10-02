//
//  MainViewController.swift
//  GrassCat
//
//  Created by Xyndi on 2020/3/27.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import UIKit
import RealmSwift
import GoogleMobileAds
import AVFoundation
import Network


class MainViewController: UIViewController , GADRewardedAdDelegate{
    
    let monitor = NWPathMonitor()
    
    let realm = try! Realm()
    var mainData = MainData()
    var siteData = SiteData()
    var seedsData = SeedsData()
    
    var rewardedAd: GADRewardedAd?
    
    var sitePressed = ""
    var seedSelected = ""
    var boxSelected = ""
    var setFuncPressed = ""
    var combine1 = ""
    var combine2 = ""
    var tabSelected = ""
    var itemSelected = ""
    var musicVolume = 0.0//realm.objects(SoundData.self)[0].musicVolume
    var soundVolume = 0.0//realm.objects(SoundData.self)[0].soundVolume
    
    var rewardADSelect = ""
    
    var player: AVAudioPlayer!
    //    var BGMplayer: AVAudioPlayer!
    var BGMplayer: AVPlayerLooper!
    var queuePlayer: AVQueuePlayer!
    //@IBOutlet var fullView: UIView!
    
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var storeButton: UIButton!
    @IBOutlet weak var storyButton: UIButton!
    @IBOutlet weak var libraryItem: UIButton!
    @IBOutlet weak var itemButton: UIButton!
    @IBOutlet weak var combineButton: UIButton!
    @IBOutlet weak var backMainButton: UIButton!
    @IBOutlet weak var backMainButton2: UIButton!
    
    @IBOutlet weak var plusMoney: UIButton!
    
    //MARK: - cat site button
    @IBOutlet weak var catSite1Button: UIButton!
    @IBOutlet weak var catTime1Button: UIButton!
    
    @IBOutlet weak var catSite2Button: UIButton!
    @IBOutlet weak var catTime2Button: UIButton!
    
    @IBOutlet weak var catSite3Button: UIButton!
    @IBOutlet weak var catTime3Button: UIButton!
    
    @IBOutlet weak var catSite4Button: UIButton!
    @IBOutlet weak var catTime4Button: UIButton!
    
    @IBOutlet weak var catSite5Button: UIButton!
    @IBOutlet weak var catTime5Button: UIButton!
    
    @IBOutlet weak var catSite6Button: UIButton!
    @IBOutlet weak var catTime6Button: UIButton!
    
    @IBOutlet weak var catSite7Button: UIButton!
    @IBOutlet weak var catTime7Button: UIButton!
    
    @IBOutlet weak var catSite8Button: UIButton!
    @IBOutlet weak var catTime8Button: UIButton!
    
    @IBOutlet weak var catBoxView: UIStackView!
    @IBOutlet weak var catUPButton: UIButton!
    @IBOutlet weak var catDOWNButton: UIButton!
    @IBOutlet weak var boxUPButton: UIButton!
    @IBOutlet weak var boxDOWNButton: UIButton!
    @IBOutlet weak var catBoxConfirm: UIButton!
    @IBOutlet weak var catScrollView: UIScrollView!
    @IBOutlet weak var boxScrollView: UIScrollView!
    
    //MARK: - cat box Scroll view button
    @IBOutlet weak var catScrollView1: UIView!
    @IBOutlet weak var catButton1_1: UIButton!
    @IBOutlet weak var catAmountButton1_1: UIButton!
    @IBOutlet weak var catButton1_2: UIButton!
    @IBOutlet weak var catAmountButton1_2: UIButton!
    @IBOutlet weak var catButton1_3: UIButton!
    @IBOutlet weak var catAmountButton1_3: UIButton!
    
    @IBOutlet weak var catScrollView2: UIView!
    @IBOutlet weak var catButton2_1: UIButton!
    @IBOutlet weak var catAmountButton2_1: UIButton!
    @IBOutlet weak var catButton2_2: UIButton!
    @IBOutlet weak var catAmountButton2_2: UIButton!
    @IBOutlet weak var catButton2_3: UIButton!
    @IBOutlet weak var catAmountButton2_3: UIButton!
    
    @IBOutlet weak var catScrollView3: UIView!
    @IBOutlet weak var catButton3_1: UIButton!
    @IBOutlet weak var catAmountButton3_1: UIButton!
    @IBOutlet weak var catButton3_2: UIButton!
    @IBOutlet weak var catAmountButton3_2: UIButton!
    @IBOutlet weak var catButton3_3: UIButton!
    @IBOutlet weak var catAmountButton3_3: UIButton!
    
    @IBOutlet weak var catScrollView4: UIView!
    @IBOutlet weak var catButton4_1: UIButton!
    @IBOutlet weak var catAmountButton4_1: UIButton!
    @IBOutlet weak var catButton4_2: UIButton!
    @IBOutlet weak var catAmountButton4_2: UIButton!
    @IBOutlet weak var catButton4_3: UIButton!
    @IBOutlet weak var catAmountButton4_3: UIButton!
    
    @IBOutlet weak var catScrollView5: UIView!
    @IBOutlet weak var catButton5_1: UIButton!
    @IBOutlet weak var catAmountButton5_1: UIButton!
    @IBOutlet weak var catButton5_2: UIButton!
    @IBOutlet weak var catAmountButton5_2: UIButton!
    @IBOutlet weak var catButton5_3: UIButton!
    @IBOutlet weak var catAmountButton5_3: UIButton!
    
    @IBOutlet weak var boxScrollView1: UIView!
    @IBOutlet weak var boxButton1_1: UIButton!
    @IBOutlet weak var boxButton1_2: UIButton!
    @IBOutlet weak var boxButton1_3: UIButton!
    
    @IBOutlet weak var boxScrollView2: UIView!
    @IBOutlet weak var boxButton2_1: UIButton!
    @IBOutlet weak var boxButton2_2: UIButton!
    @IBOutlet weak var boxButton2_3: UIButton!
    
    @IBOutlet weak var boxScrollView3: UIView!
    @IBOutlet weak var boxButton3_1: UIButton!
    @IBOutlet weak var boxButton3_2: UIButton!
    @IBOutlet weak var boxButton3_3: UIButton!
    
    //MARK: - item view button
    @IBOutlet weak var itemsView: UIStackView!
    @IBOutlet weak var itemsTab: UIStackView!
    @IBOutlet weak var tabLeftButton: UIButton!
    @IBOutlet weak var tabMidButton: UIButton!
    @IBOutlet weak var tabRightButton: UIButton!
    @IBOutlet weak var itemUPButton: UIButton!
    @IBOutlet weak var itemDOWNButton: UIButton!
    @IBOutlet weak var itemConfirm: UIButton!
    @IBOutlet weak var itemScrollView: UIScrollView!
    
    @IBOutlet weak var itemScrollView1: UIView!
    @IBOutlet weak var itemButton1_1: UIButton!
    @IBOutlet weak var itemAmountButton1_1: UIButton!
    @IBOutlet weak var itemButton1_2: UIButton!
    @IBOutlet weak var itemAmountButton1_2: UIButton!
    @IBOutlet weak var itemButton1_3: UIButton!
    @IBOutlet weak var itemAmountButton1_3: UIButton!
    
    @IBOutlet weak var itemScrollView2: UIView!
    @IBOutlet weak var itemButton2_1: UIButton!
    @IBOutlet weak var itemAmountButton2_1: UIButton!
    @IBOutlet weak var itemButton2_2: UIButton!
    @IBOutlet weak var itemAmountButton2_2: UIButton!
    @IBOutlet weak var itemButton2_3: UIButton!
    @IBOutlet weak var itemAmountButton2_3: UIButton!
    
    @IBOutlet weak var itemScrollView3: UIView!
    @IBOutlet weak var itemButton3_1: UIButton!
    @IBOutlet weak var itemAmountButton3_1: UIButton!
    @IBOutlet weak var itemButton3_2: UIButton!
    @IBOutlet weak var itemAmountButton3_2: UIButton!
    @IBOutlet weak var itemButton3_3: UIButton!
    @IBOutlet weak var itemAmountButton3_3: UIButton!
    
    @IBOutlet weak var itemScrollView4: UIView!
    @IBOutlet weak var itemButton4_1: UIButton!
    @IBOutlet weak var itemAmountButton4_1: UIButton!
    @IBOutlet weak var itemButton4_2: UIButton!
    @IBOutlet weak var itemAmountButton4_2: UIButton!
    @IBOutlet weak var itemButton4_3: UIButton!
    @IBOutlet weak var itemAmountButton4_3: UIButton!
    
    @IBOutlet weak var itemScrollView5: UIView!
    @IBOutlet weak var itemButton5_1: UIButton!
    @IBOutlet weak var itemAmountButton5_1: UIButton!
    @IBOutlet weak var itemButton5_2: UIButton!
    @IBOutlet weak var itemAmountButton5_2: UIButton!
    @IBOutlet weak var itemButton5_3: UIButton!
    @IBOutlet weak var itemAmountButton5_3: UIButton!
    
    @IBOutlet weak var itemScrollView6: UIView!
    @IBOutlet weak var itemButton6_1: UIButton!
    @IBOutlet weak var itemAmountButton6_1: UIButton!
    @IBOutlet weak var itemButton6_2: UIButton!
    @IBOutlet weak var itemAmountButton6_2: UIButton!
    @IBOutlet weak var itemButton6_3: UIButton!
    @IBOutlet weak var itemAmountButton6_3: UIButton!
    
    @IBOutlet weak var getSeedsMoneyView: UIView!
    @IBOutlet weak var seedMoneySeedStack: UIStackView!
    @IBOutlet weak var SeedMoneySeedImage: UIImageView!
    @IBOutlet weak var seedMoneySeedAmount: UILabel!
    
    @IBOutlet weak var seedMoneyStack: UIStackView!
    @IBOutlet weak var seedMoneyMoney: UILabel!
    @IBOutlet weak var seedLabel: UILabel!
    
    @IBOutlet weak var libraryView: UIView!
    @IBOutlet weak var libraryStack: UIStackView!
    @IBOutlet weak var settingStack: UIStackView!
    
    @IBOutlet weak var musicOpen: UIButton!
    @IBOutlet weak var musicClosed: UIButton!
    @IBOutlet weak var musicSlider: UISlider!
    
    @IBOutlet weak var soundOpen: UIButton!
    @IBOutlet weak var soundClosed: UIButton!
    @IBOutlet weak var soundSlider: UISlider!
    
    @IBOutlet weak var libraryScrollView: UIScrollView!
    
    @IBOutlet weak var libraryScrollView1: UIView!
    @IBOutlet weak var libraryButton1_1: UIButton!
    @IBOutlet weak var libraryButton1_2: UIButton!
    @IBOutlet weak var libraryButton1_3: UIButton!
    
    @IBOutlet weak var libraryScrollView2: UIView!
    @IBOutlet weak var libraryButton2_1: UIButton!
    @IBOutlet weak var libraryButton2_2: UIButton!
    @IBOutlet weak var libraryButton2_3: UIButton!
    
    @IBOutlet weak var libraryScrollView3: UIView!
    @IBOutlet weak var libraryButton3_1: UIButton!
    @IBOutlet weak var libraryButton3_2: UIButton!
    @IBOutlet weak var libraryButton3_3: UIButton!
    
    @IBOutlet weak var libraryScrollView4: UIView!
    @IBOutlet weak var libraryButton4_1: UIButton!
    @IBOutlet weak var libraryButton4_2: UIButton!
    @IBOutlet weak var libraryButton4_3: UIButton!
    
    @IBOutlet weak var libraryScrollView5: UIView!
    @IBOutlet weak var libraryButton5_1: UIButton!
    @IBOutlet weak var libraryButton5_2: UIButton!
    @IBOutlet weak var libraryButton5_3: UIButton!
    
    @IBOutlet weak var libraryScrollView6: UIView!
    @IBOutlet weak var libraryButton6_1: UIButton!
    @IBOutlet weak var libraryButton6_2: UIButton!
    @IBOutlet weak var libraryButton6_3: UIButton!
    
    @IBOutlet weak var libTabStack: UIStackView!
    @IBOutlet weak var libTabLeft: UIButton!
    @IBOutlet weak var libTabMid: UIButton!
    @IBOutlet weak var libTabRight: UIButton!
    
    @IBOutlet weak var libraryContentView: UIView!
    @IBOutlet weak var libraryCatName: UILabel!
    @IBOutlet weak var libraryCatImage: UIImageView!
    @IBOutlet weak var libraryCatInfo: UILabel!
    
    @IBOutlet weak var storyView1: UIView!
    @IBOutlet weak var storyImage1: UIButton!
    @IBOutlet weak var storyTitle1: UIButton!
    
    @IBOutlet weak var storyView2: UIView!
    @IBOutlet weak var storyImage2: UIButton!
    @IBOutlet weak var storyTitle2: UIButton!
    
    @IBOutlet weak var storyView3: UIView!
    @IBOutlet weak var storyImage3: UIButton!
    @IBOutlet weak var storyTitle3: UIButton!
    
    @IBOutlet weak var storyView4: UIView!
    @IBOutlet weak var storyImage4: UIButton!
    @IBOutlet weak var storyTitle4: UIButton!
    
    @IBOutlet weak var storyView5: UIView!
    @IBOutlet weak var storyImage5: UIButton!
    @IBOutlet weak var storyTitle5: UIButton!
    
    @IBOutlet weak var storyView6: UIView!
    @IBOutlet weak var storyImage6: UIButton!
    @IBOutlet weak var storyTitle6: UIButton!
    //
    //    @IBOutlet weak var getSeedsView: UIView!
    //    @IBOutlet weak var SeedSeedImage: UIImageView!
    //    @IBOutlet weak var SeedSeedAmount: UILabel!
    @IBOutlet weak var SeedSeedNew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initial()
        playMusic()
        
        rewardedAd = createAndLoadRewardedAd()
        
        
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { (notification) in
            self.queuePlayer?.pause()
            self.createNotification()
        }
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: nil) { (notification) in
            
            self.queuePlayer?.play()
            
        }
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) { (notification) in
            
            self.queuePlayer?.play()
            
        }
        
        monitor.pathUpdateHandler = { path in
             if path.status == .satisfied {
                print("connected")
             } else {
                print("no connection")
             }
          }
          monitor.start(queue: DispatchQueue.global())
      
        
    }
   
    override func viewDidDisappear(_ animated: Bool) {
        self.timerSche!.invalidate()
        //        BGMplayer!.stop()
        queuePlayer?.removeAllItems()
        //        BGMplayer.disableLooping()
        
    }
    //MARK: - Initail Func
    func initial(){
        money.text = String(realm.objects(MainData.self)[0].mainMoney)
        
        musicVolume = Double(realm.objects(SoundData.self)[0].musicVolume)
        soundVolume = Double(realm.objects(SoundData.self)[0].soundVolume)
        
        self.timerSche?.invalidate()
        timeSche(repeats: true, runtime: 1)
        combine1 = ""
        combine2 = ""
        tabSelected = ""
        itemSelected = ""
        
        var setAlpha0Array = [catBoxView,itemsView,backMainButton,SeedSeedNew,libraryView,libraryContentView,settingStack]
        let catButtonArray = [catButton1_1,catButton1_2,catButton1_3,catButton2_1,catButton2_2,catButton2_3,catButton3_1,catButton3_2,catButton3_3,catButton4_1,catButton4_2,catButton4_3,catButton5_1,catButton5_2,catButton5_3]
        let catAmountArray = [catAmountButton1_1,catAmountButton1_2,catAmountButton1_3,catAmountButton2_1,catAmountButton2_2,catAmountButton2_3,catAmountButton3_1,catAmountButton3_2,catAmountButton3_3,catAmountButton4_1,catAmountButton4_2,catAmountButton4_3,catAmountButton5_1,catAmountButton5_2,catAmountButton5_3]
        let boxButtonArray = [boxButton1_1,boxButton1_2,boxButton1_3,boxButton2_1,boxButton2_2,boxButton2_3,boxButton3_1,boxButton3_2,boxButton3_3]
        
        let itemButtonArray = [itemButton1_1,itemButton1_2,itemButton1_3,itemButton2_1,itemButton2_2,itemButton2_3,itemButton3_1,itemButton3_2,itemButton3_3,itemButton4_1,itemButton4_2,itemButton4_3,itemButton5_1,itemButton5_2,itemButton5_3,itemButton6_1,itemButton6_2,itemButton6_3]
        
        let itemAmountArray = [itemAmountButton1_1,itemAmountButton1_2,itemAmountButton1_3,itemAmountButton2_1,itemAmountButton2_2,itemAmountButton2_3,itemAmountButton3_1,itemAmountButton3_2,itemAmountButton3_3,itemAmountButton4_1,itemAmountButton4_2,itemAmountButton4_3,itemAmountButton5_1,itemAmountButton5_2,itemAmountButton5_3,itemAmountButton6_1,itemAmountButton6_2,itemAmountButton6_3]
        
        let libButtonArray = [libraryButton1_1,libraryButton1_2,libraryButton1_3,libraryButton2_1,libraryButton2_2,libraryButton2_3,libraryButton3_1,libraryButton3_2,libraryButton3_3,libraryButton4_1,libraryButton4_2,libraryButton4_3,libraryButton5_1,libraryButton5_2,libraryButton5_3,libraryButton6_1,libraryButton6_2,libraryButton6_3]
        
        setAlpha0Array += catButtonArray + catAmountArray + boxButtonArray + itemButtonArray + itemAmountArray
        for e in setAlpha0Array{
            e!.alpha = 0
        }
        for e in libButtonArray{
            e!.setBackgroundImage(UIImage(named: "library_unknown.png"), for: .normal)
        }
        backMainButton2.alpha = 1
        
        var setIsHiddenArray = [getSeedsMoneyView,seedMoneySeedStack,seedMoneyStack,seedLabel]//getSeedsView
        let catScrollArray = [catScrollView1,catScrollView2,catScrollView3,catScrollView4,catScrollView5]
        let boxScrollArray = [boxScrollView1,boxScrollView2,boxScrollView3]
        let itemScrollArray = [itemScrollView1,itemScrollView2,itemScrollView3,itemScrollView4,itemScrollView5,itemScrollView6]
        let libScrollArray = [libraryScrollView1,libraryScrollView2,libraryScrollView3,libraryScrollView4,libraryScrollView5,libraryScrollView6]
        let storyViewArray = [storyView1,storyView2,storyView3,storyView4,storyView5,storyView6]
        setIsHiddenArray += catScrollArray + boxScrollArray + itemScrollArray + libScrollArray + storyViewArray
        for a in setIsHiddenArray{
            a!.isHidden = true
        }
        let scrollInitArray = [catScrollView, boxScrollView,itemScrollView,libraryScrollView]
        for a in scrollInitArray{
            a!.setContentOffset(CGPoint(x: 0, y: 0 ), animated: false)
        }
        
        libraryView.transform = CGAffineTransform(rotationAngle: (CGFloat.pi/70))
        libraryContentView.transform = CGAffineTransform(rotationAngle: (CGFloat.pi/70))
        
        let plantTimeArray = [catTime1Button,catTime2Button,catTime3Button,catTime4Button,catTime5Button,catTime6Button,catTime7Button,catTime8Button]
        let rotateArray = catAmountArray + plantTimeArray + itemAmountArray
        for e in rotateArray{
            e!.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi/15))
            
        }
        for e in plantTimeArray{
            e!.titleLabel?.adjustsFontForContentSizeCategory = true
        }
        
        let isEnableArray = itemButtonArray + itemAmountArray + catButtonArray + catAmountArray //+ plantTimeArray
        for e in isEnableArray{
            e!.isEnabled = true
        }
        
        
        
        
        seedMoneySeedStack.transform =  CGAffineTransform(translationX: 0, y: 0)
        SeedMoneySeedImage.transform = CGAffineTransform(translationX: 0, y: 0)
        sitePressed = ""
        
    }
    
    @IBAction func catSitesButtonPressed(_ sender: UIButton) {
        backMainButton.alpha = 1
        seedSelected = ""
        boxSelected = ""
        sitePressed = sender.currentTitle!
        let siteNO = (Int(sitePressed.suffix(1)) ?? 1) - 1
        if realm.objects(SiteData.self)[siteNO].flag == true{
            
            
            //if 可收成>>收成框
            if realm.objects(SiteData.self)[siteNO].timer <= Date(){
                
                let seedSeq = realm.objects(SiteData.self)[siteNO].catSeq
                let seedImage = realm.objects(SiteData.self)[siteNO].seedImage
                let seed = realm.objects(SeedsData.self).filter( "Seq == \(seedSeq)")
                var seedNO = 0
                for result in seed{
                    seedNO = result.NO
                }
                let seedInfo = SeedLib()
                
                
                let array = seedInfo.seedsMoney(NO: seedNO)
                var seedAmount = Int.random(in: array.Min...array.Max)
                seedAmount += realm.objects(SiteData.self)[siteNO].plusSeed
                let moneyAmount = Int.random(in: array.MinMoney...array.MaxMoney)
                getSeedsMoneyView.isHidden = false
                seedMoneySeedStack.isHidden = false
                seedMoneyStack.isHidden = false
                seedMoneySeedAmount.isHidden = false
                SeedMoneySeedImage.image = UIImage(named: "\(seedImage).png")
                seedMoneySeedAmount.text = String("x \(seedAmount)")
                seedMoneyMoney.text = String("x \(moneyAmount)")
                
                try! realm.write {
                    
                    realm.objects(SiteData.self)[siteNO].flag = false
                    realm.objects(SiteData.self)[siteNO].propUsed = false
                    realm.objects(SiteData.self)[siteNO].plusSeed = 0
                    realm.objects(SeedsData.self)[seedSeq].Amount += seedAmount
                    realm.objects(MainData.self)[0].mainMoney += moneyAmount
                }
                
                if realm.objects(SeedsData.self)[seedSeq].Spec == true{
                    playSoundEffect(fileName: "6")
                }
                else{
                    playSoundEffect(fileName: "6_2")
                }
                
                //                backMainButton.alpha = 1
                
            }
                //else 跳使用道具
            else if realm.objects(SiteData.self)[siteNO].propUsed == false{
                playSoundEffect(fileName: "1")
                
                //                backMainButton.alpha = 1
                itemsView.alpha = 1
                itemConfirm.alpha = 1
                itemsTab.isHidden = true
                
                let itemButtonArray = [itemButton1_1,itemButton1_2,itemButton1_3,itemButton2_1,itemButton2_2,itemButton2_3,itemButton3_1,itemButton3_2,itemButton3_3,itemButton4_1,itemButton4_2,itemButton4_3,itemButton5_1,itemButton5_2,itemButton5_3,itemButton6_1,itemButton6_2,itemButton6_3]
                
                let itemAmountArray = [itemAmountButton1_1,itemAmountButton1_2,itemAmountButton1_3,itemAmountButton2_1,itemAmountButton2_2,itemAmountButton2_3,itemAmountButton3_1,itemAmountButton3_2,itemAmountButton3_3,itemAmountButton4_1,itemAmountButton4_2,itemAmountButton4_3,itemAmountButton5_1,itemAmountButton5_2,itemAmountButton5_3,itemAmountButton6_1,itemAmountButton6_2,itemAmountButton6_3]
                
                let itemScrollArray = [itemScrollView1,itemScrollView2,itemScrollView3,itemScrollView4,itemScrollView5,itemScrollView6]
                
                setFuncPressed = "propUsed"
                print(setFuncPressed)
                for i in itemButtonArray{
                    i!.isEnabled = true
                }
                
                let propAmountInDB = realm.objects(PropsData.self).count
                
                showRows(ScrollArray: itemScrollArray,Result: propAmountInDB,line: 5)
                print("propCount = 1, propShowCount = 0")
                var propCount = 1
                var propShowCount = 0
                if propAmountInDB >= 1{
                    for a in 0...propAmountInDB - 1{
                        
                        let propDB = realm.objects(PropsData.self).filter( "Seq == \(propCount)")
                        for result in propDB{
                            if result.Amount > 0{
                                itemButtonArray[propShowCount]!.alpha = 1
                                itemAmountArray[propShowCount]!.alpha = 1
                                itemButtonArray[propShowCount]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                                itemButtonArray[propShowCount]!.setImage(UIImage(named: "blank.png"), for: .normal)
                                itemButtonArray[propShowCount]!.setTitle("\(propCount)", for: .normal)
                                
                                itemButtonArray[propShowCount]!.setTitleColor(UIColor.clear, for: .normal)
                                itemAmountArray[propShowCount]!.setTitle("\(result.Amount)", for: .normal)
                                propShowCount += 1
                            }
                            
                            propCount += 1
                        }
                        
                    }
                    if propShowCount == 0{
                        //show no props can use, please goto shop
                        itemsView.alpha = 0
                        print("道具空空、櫃子空空、只有口袋不空空！\n\n商店的大門為你開啟！")
                        getSeedsMoneyView.isHidden = false
                        seedLabel.isHidden = false
                        seedLabel.text = "道具空空、櫃子空空、只有口袋不空空！\n\n商店的大門為你開啟！"
                    }
                    
                }
                    
                else{
                    //show no props can use, please goto shop
                    itemsView.alpha = 0
                    print("沒有道具可使用\n\n請到商店購買")
                    getSeedsMoneyView.isHidden = false
                    seedLabel.isHidden = false
                    seedLabel.text = "道具空空、櫃子空空、只有口袋不空空！\n\n商店的大門為你開啟！"
                }
                
            }
            else if realm.objects(SiteData.self)[siteNO].propUsed == true{
                getSeedsMoneyView.isHidden = false
                seedLabel.isHidden = false
                //                backMainButton.alpha = 1
                seedLabel.text = "用過了用過了！\n\n貓貓也會膩，給別貓用用看嘛！"
            }
        }
            
        else{
            playSoundEffect(fileName: "2")
            let catButtonArray = [catButton1_1,catButton1_2,catButton1_3,catButton2_1,catButton2_2,catButton2_3,catButton3_1,catButton3_2,catButton3_3,catButton4_1,catButton4_2,catButton4_3,catButton5_1,catButton5_2,catButton5_3]
            let catAmountArray = [catAmountButton1_1,catAmountButton1_2,catAmountButton1_3,catAmountButton2_1,catAmountButton2_2,catAmountButton2_3,catAmountButton3_1,catAmountButton3_2,catAmountButton3_3,catAmountButton4_1,catAmountButton4_2,catAmountButton4_3,catAmountButton5_1,catAmountButton5_2,catAmountButton5_3]
            
            let seedsInDB = realm.objects(SeedsData.self).count
            
            let boxButtonArray = [boxButton1_1,boxButton1_2,boxButton1_3,boxButton2_1,boxButton2_2,boxButton2_3,boxButton3_1,boxButton3_2,boxButton3_3]
            let boxesInDB = realm.objects(BoxesData.self).count
            print("THIS IS CAT BOX")
            print(seedsInDB)
            //
            let catScrollArray = [catScrollView1,catScrollView2,catScrollView3,catScrollView4,catScrollView5]
            let boxScrollArray = [boxScrollView1,boxScrollView2,boxScrollView3]
            
            showRows(ScrollArray: catScrollArray,Result: seedsInDB,line: 3)
            showRows(ScrollArray: boxScrollArray,Result: boxesInDB,line: 2)
            
            
            var catCount = 0
            for c in 0...seedsInDB - 1{
                catButtonArray[c]!.alpha = 1
                catAmountArray[c]!.alpha = 1
                let seed = realm.objects(SeedsData.self).filter( "Seq == \(catCount)")
                for result in seed{
                    catButtonArray[c]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                    catButtonArray[c]!.setImage(UIImage(named: "blank.png"), for: .normal)
                    catButtonArray[c]!.setTitle("\(catCount)", for: .normal)
                    catButtonArray[c]!.setTitleColor(UIColor.clear, for: .normal)
                    catAmountArray[c]!.setTitle("\(result.Amount)", for: .normal)
                    if result.Amount <= 0 {
                        catButtonArray[c]!.isEnabled = false
                        catAmountArray[c]!.isEnabled = false
                    }
                }
                catCount += 1
            }
            
            var boxCount = 1
            for b in 0...boxesInDB - 1{
                boxButtonArray[b]!.alpha = 1
                let boxes = realm.objects(BoxesData.self).filter( "Seq == \(boxCount)")
                for result in boxes{
                    boxButtonArray[b]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                    boxButtonArray[b]!.setImage(UIImage(named: "blank.png"), for: .normal)
                    boxButtonArray[b]!.setTitle("\(boxCount)", for: .normal)
                    boxButtonArray[b]!.setTitleColor(UIColor.clear, for: .normal)
                    boxButtonArray[b]!.imageEdgeInsets = UIEdgeInsets(top: 25, left: 0, bottom: -25, right: 0)
//                    boxButtonArray[b]!.transform = CGAffineTransform(translationX: 0, y: -20)
                }
                boxCount += 1
            }
            
            catBoxConfirm.setImage(UIImage(named: "confirm_Dark.png"), for: .normal)
            //catBoxConfirm.isEnabled = false
            
            catBoxView.alpha = 1
            
        }
    }
    
    @IBAction func catSeedSelect(_ sender: UIButton) {
        playSoundEffect(fileName: "4")
        seedSelected = sender.currentTitle!
        let catButtonArray = [catButton1_1,catButton1_2,catButton1_3,catButton2_1,catButton2_2,catButton2_3,catButton3_1,catButton3_2,catButton3_3,catButton4_1,catButton4_2,catButton4_3,catButton5_1,catButton5_2,catButton5_3]
        for c in catButtonArray{
            c!.setImage(UIImage(named: "blank.png"), for: .normal)
        }
        sender.self.setImage(UIImage(named: "Select.png"), for: .normal)
        if seedSelected != "" && boxSelected != "" {
            catBoxConfirm.setImage(UIImage(named: "confirm_Light.png"), for: .normal)
            catBoxConfirm.isEnabled = true
        }
    }
    
    
    @IBAction func boxSelect(_ sender: UIButton) {
        playSoundEffect(fileName: "4")
        boxSelected = sender.currentTitle!
        let boxButtonArray = [boxButton1_1,boxButton1_2,boxButton1_3,boxButton2_1,boxButton2_2,boxButton2_3,boxButton3_1,boxButton3_2,boxButton3_3]
        for b in boxButtonArray{
            b!.setImage(UIImage(named: "blank.png"), for: .normal)
        }
        sender.self.setImage(UIImage(named: "Select.png"), for: .normal)
        
        if seedSelected != "" && boxSelected != "" {
            catBoxConfirm.setImage(UIImage(named: "confirm_Light.png"), for: .normal)
            catBoxConfirm.isEnabled = true
        }
    }
    
    @IBAction func catboxConfirmPressed(_ sender: UIButton) {
        playSoundEffect(fileName: "5")
        let seedLib = SeedLib()
        let boxLib = BoxLib()
        var seedTime = Date()
        var seedImage = ""
        var plantTime = 0
        var boxImage = ""
        var seedToPlant = seedSelected
        var boxNO = 0
        var boxRate = 0.0
        var seedPlus = 0
        //        let siteArray = [catSite1Button,catSite2Button,catSite3Button,catSite4Button,catSite5Button,catSite6Button,catSite7Button,catSite8Button]
        //        let timeArray = [catTime1Button,catTime2Button,catTime3Button,catTime4Button,catTime5Button,catTime6Button,catTime7Button,catTime8Button]
        if seedSelected != "" && boxSelected != "" {
            if seedSelected == "0"{
                //神秘種子要先另外算一套分配到種子1~3的邏輯
                var totalSeedsKind = realm.objects(SeedsData.self).count - 1
                var randomArray = [1]
                for a in 1...totalSeedsKind{
                    for _ in (1...totalSeedsKind*totalSeedsKind).reversed(){
                        randomArray += [a]
                    }
                    totalSeedsKind -= 1
                }
                seedToPlant = String(randomArray.randomElement()!)
            }
            let seedInfo = realm.objects(SeedsData.self).filter( "Seq == \(seedToPlant)")
            
            for result in seedInfo{
                plantTime = seedLib.getTime(NO: result.NO)
                seedTime = Date() + TimeInterval(plantTime)
                seedImage = result.Image
            }
            let boxInfo = realm.objects(BoxesData.self).filter("Seq == \(boxSelected)")
            for result in boxInfo{
                boxImage = result.Image
                boxNO = result.NO
                plantTime = Int(Double(boxLib.getBoxforSell(NO: boxNO).Rate) * Double(plantTime))
                seedTime = Date() + TimeInterval(plantTime)
                seedPlus = boxLib.getBoxforSell(NO: boxNO).AddAmount
            }
            
            
            let siteNO = (Int(sitePressed.suffix(1)) ?? 1) - 1
            
            try! realm.write {
                
                realm.objects(SiteData.self)[siteNO].timer = seedTime
                realm.objects(SiteData.self)[siteNO].catSeq = Int(seedToPlant)!
                realm.objects(SiteData.self)[siteNO].seedImage = seedImage
                realm.objects(SiteData.self)[siteNO].siteImage = boxImage
                realm.objects(SiteData.self)[siteNO].plantTime = plantTime
                realm.objects(SiteData.self)[siteNO].flag = true
                realm.objects(SiteData.self)[siteNO].plusSeed += seedPlus
                realm.objects(SeedsData.self)[Int(seedSelected)!].Amount -= 1
            }
            
            getImage()
            initial()
        }
    }
    //MARK: - getImage
    func getImage(){
        let Datas = realm.objects(SiteData.self)
        let siteArray = [catSite1Button,catSite2Button,catSite3Button,catSite4Button,catSite5Button,catSite6Button,catSite7Button,catSite8Button]
        let timeArray = [catTime1Button,catTime2Button,catTime3Button,catTime4Button,catTime5Button,catTime6Button,catTime7Button,catTime8Button]
        var TimerStillOn = false
        var NO = 0
        for a in [0...7]{
            let DatasPerSite = Datas.self[a]
            
            for result in DatasPerSite{
                if result.flag == true{
                    timeArray[NO]!.isHidden = false
                    siteArray[NO]?.setImage(UIImage(named: "\(result.siteImage).png"), for: .normal)
                    let StatusInterval = Double((result.plantTime)/3)
                    let endTime = result.timer
                    let nowTime = Date()
                    
                    let interval = endTime.timeIntervalSince(nowTime)
                    let secInt = Int(interval)%60
                    let minsInt = Int(interval/60)%60
                    
                    if interval <= 1{
                        siteArray[NO]?.setBackgroundImage(UIImage(named: "\(result.seedImage)-3.png"), for: .normal)
                        timeArray[NO]?.setTitle("0:0", for: .normal)
                        //                        timeArray[NO]?.isEnabled = false
                    }
                    else if interval > 1 && interval <= StatusInterval + 1{
                        siteArray[NO]?.setBackgroundImage(UIImage(named: "\(result.seedImage)-2.png"), for: .normal)
                        timeArray[NO]!.setTitle("\(minsInt):\(secInt)", for: .normal)
                        TimerStillOn = true
                    }
                    else if interval > StatusInterval + 1 && interval <= StatusInterval * 2 + 1{
                        siteArray[NO]?.setBackgroundImage(UIImage(named: "\(result.seedImage)-1.png"), for: .normal)
                        timeArray[NO]!.setTitle("\(minsInt):\(secInt)", for: .normal)
                        TimerStillOn = true
                    }
                    else {
                        siteArray[NO]?.setBackgroundImage(UIImage(named: "dirt.png"), for: .normal)
                        timeArray[NO]!.setTitle("\(minsInt):\(secInt)", for: .normal)
                        TimerStillOn = true
                    }
                    
                }
                else {
                    timeArray[NO]?.isHidden = true
                    siteArray[NO]?.setImage(UIImage(named: "cat0.png"), for: .normal)
                    siteArray[NO]?.setBackgroundImage(UIImage(named: "box00.png"), for: .normal)
                }
                NO += 1
            }
        }
        if TimerStillOn == false{
            self.timerSche?.invalidate()
        }
    }
    var timerSche: Timer?
    
    func timeSche(repeats: Bool, runtime: TimeInterval){
        timerSche = Timer.scheduledTimer(withTimeInterval: runtime, repeats: repeats, block: { (_) in
            self.getImage()
            
        })
    }
    
    
    
    @IBAction func SettingsButton(_ sender: UIButton) {
        playSoundEffect(fileName: "1")
        let buttonPressed = sender.currentTitle!
        backMainButton.alpha = 1
        itemsView.alpha = 1
        itemConfirm.alpha = 1
        itemConfirm.setImage(UIImage(named: "confirm_Dark.png"), for: .normal)
        let itemButtonArray = [itemButton1_1,itemButton1_2,itemButton1_3,itemButton2_1,itemButton2_2,itemButton2_3,itemButton3_1,itemButton3_2,itemButton3_3,itemButton4_1,itemButton4_2,itemButton4_3,itemButton5_1,itemButton5_2,itemButton5_3,itemButton6_1,itemButton6_2,itemButton6_3]
        
        let itemAmountArray = [itemAmountButton1_1,itemAmountButton1_2,itemAmountButton1_3,itemAmountButton2_1,itemAmountButton2_2,itemAmountButton2_3,itemAmountButton3_1,itemAmountButton3_2,itemAmountButton3_3,itemAmountButton4_1,itemAmountButton4_2,itemAmountButton4_3,itemAmountButton5_1,itemAmountButton5_2,itemAmountButton5_3,itemAmountButton6_1,itemAmountButton6_2,itemAmountButton6_3]
        
        let libButtonArray = [libraryButton1_1,libraryButton1_2,libraryButton1_3,libraryButton2_1,libraryButton2_2,libraryButton2_3,libraryButton3_1,libraryButton3_2,libraryButton3_3,libraryButton4_1,libraryButton4_2,libraryButton4_3,libraryButton5_1,libraryButton5_2,libraryButton5_3,libraryButton6_1,libraryButton6_2,libraryButton6_3]
        
        
        let itemScrollArray = [itemScrollView1,itemScrollView2,itemScrollView3,itemScrollView4,itemScrollView5,itemScrollView6]
        
        let libScrollArray = [libraryScrollView1,libraryScrollView2,libraryScrollView3,libraryScrollView4,libraryScrollView5,libraryScrollView6]
        let storyViewArray = [storyView1,storyView2,storyView3,storyView4,storyView5,storyView6]
        let storyImageArray = [storyImage1,storyImage2,storyImage3,storyImage4,storyImage5,storyImage6]
        let storyTitleArray = [storyTitle1,storyTitle2,storyTitle3,storyTitle4,storyTitle5,storyTitle6]
        setFuncPressed = buttonPressed
        for i in itemButtonArray{
            i!.isEnabled = true
        }
        
        itemScrollView.setContentOffset(CGPoint(x: 0, y: 0 ), animated: false)
        for a in itemButtonArray{
            a!.transform = CGAffineTransform(translationX: 0, y: 0)
            a!.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        switch buttonPressed{
        case "setting" :
            itemsView.alpha = 0
            libraryView.alpha = 1
            libraryStack.alpha = 0
            settingStack.alpha = 1
            libTabStack.isHidden = true
            
            let music = realm.objects(SoundData.self)[0].musicOpen
            let sound = realm.objects(SoundData.self)[0].soundOpen
            if music == true{
                musicSlider.isHidden = false
                musicSlider.value = Float(musicVolume)
                musicOpen.setBackgroundImage(UIImage(named: "librarytab_Light.png"), for: .normal)
                musicClosed.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            }
            else{
                musicSlider.isHidden = true
                musicOpen.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
                musicClosed.setBackgroundImage(UIImage(named: "librarytab_Light.png"), for: .normal)
            }
            if sound == true{
                soundSlider.isHidden = false
                soundSlider.value = Float(soundVolume)
                soundOpen.setBackgroundImage(UIImage(named: "librarytab_Light.png"), for: .normal)
                soundClosed.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            }
            else{
                soundSlider.isHidden = true
                soundOpen.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
                soundClosed.setBackgroundImage(UIImage(named: "librarytab_Light.png"), for: .normal)
            }
            
            
        case "story" :
            itemsView.alpha = 0
            libraryView.alpha = 1
            libraryStack.alpha = 1
            libTabStack.isHidden = true
            let storyReview = StoryReviewContent()
            var lineShouldShow = 0
            let storyCanRead = realm.objects(MainData.self)[0].mainStory - 1
            if storyCanRead <= 4{
                lineShouldShow = 4 - 1
            }
            else{
                lineShouldShow = storyCanRead - 1
            }
            for i in 0...lineShouldShow{
                storyViewArray[i]!.isHidden = false
                storyImageArray[i]!.setImage(UIImage(named: "library_unknown.png"), for: .normal)
                storyTitleArray[i]!.setTitle("???", for: .normal)
            }
            for a in 0...storyCanRead - 1{
                let storyInfo = storyReview.getStoryTitle(NO: a)
                
                storyImageArray[a]!.setImage(UIImage(named: "\(storyInfo.Image).png"), for: .normal)
                storyTitleArray[a]!.setTitle(storyInfo.Name , for: .normal)
                
            }
            
        //MARK: - Combine Pressed
        case "combine" :
            
            itemsTab.isHidden = true
            let seedsInDB = realm.objects(SeedsData.self).count - 1
            
            showRows(ScrollArray: itemScrollArray,Result: seedsInDB,line: 5)
            
            var seedCount = 1
            for a in 0...seedsInDB - 1{
                itemButtonArray[a]!.alpha = 1
                itemAmountArray[a]!.alpha = 1
                let seed = realm.objects(SeedsData.self).filter( "Seq == \(seedCount)")
                for result in seed{
                    itemButtonArray[a]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                    itemButtonArray[a]!.setImage(UIImage(named: "blank.png"), for: .normal)
                    itemButtonArray[a]!.setTitle("\(seedCount)", for: .normal)//seq
                    itemButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                    itemAmountArray[a]!.setTitle("\(result.Amount)", for: .normal)
                    
                    if result.Amount < 5 {//沒有五顆的不能合成
                        itemButtonArray[a]!.isEnabled = false
                        itemAmountArray[a]!.isEnabled = false
                    }
                }
                seedCount += 1
            }
            
            
            
        case "store" :
            itemsTab.isHidden = false
            tabSelected = "種子"
            tabLeftButton.setTitle("種子", for: .normal)
            tabMidButton.setTitle("容器", for: .normal)
            tabRightButton.setTitle("道具", for: .normal)
            tabLeftButton.setBackgroundImage(UIImage(named: "tab_Light.png"), for: .normal)
            tabMidButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
            tabRightButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
            
            let seedAmountInDB = realm.objects(SeedsData.self).count
            showRows(ScrollArray: itemScrollArray,Result: seedAmountInDB,line: 5)
            var seedCount = 0
            let seed = SeedLib()
            
            for a in 0...seedAmountInDB - 1{
                itemButtonArray[a]!.alpha = 1
                itemAmountArray[a]!.alpha = 1
                let seedCost = seed.seedCost(NO: seedCount)
                itemAmountArray[a]!.setTitle("\(seedCost)", for: .normal)
                if seedCost > realm.objects(MainData.self)[0].mainMoney{
                    itemButtonArray[a]!.isEnabled = false
                    itemAmountArray[a]!.isEnabled = false
                }
                let seedDB = realm.objects(SeedsData.self).filter( "Seq == \(seedCount)")
                for result in seedDB{
                    itemButtonArray[a]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                    itemButtonArray[a]!.setImage(UIImage(named: "blank.png"), for: .normal)
                    itemButtonArray[a]!.setTitle("\(seedCount)", for: .normal)//seq
                    itemButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                }
                seedCount += 1
            }
            
            
        case "library" :
            itemsView.alpha = 0
            libraryView.alpha = 1
            libraryStack.alpha = 1
            libTabStack.isHidden = false
            tabSelected = "種子"
            libTabLeft.setBackgroundImage(UIImage(named: "librarytab_Light.png"), for: .normal)
            libTabMid.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            libTabRight.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            
            
            let seedAmountInDB = realm.objects(SeedsData.self).count - 1
            showRows(ScrollArray: libScrollArray,Result: seedAmountInDB,line: 4)
            var seedCount = 1
            
            for a in 0...seedAmountInDB - 1{
                libButtonArray[a]!.alpha = 1
                libButtonArray[a]!.alpha = 1
                let seedDB = realm.objects(SeedsData.self).filter( "Seq == \(seedCount)")
                
                for result in seedDB{
                    libButtonArray[a]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                    libButtonArray[a]!.setTitle("\(seedCount)", for: .normal)//seq
                    libButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                }
                seedCount += 1
            }
            
            
        case "item" :
            itemsTab.isHidden = false
            itemConfirm.alpha = 0
            tabSelected = "種子"
            tabLeftButton.setTitle("種子", for: .normal)
            tabMidButton.setTitle("容器", for: .normal)
            tabRightButton.setTitle("道具", for: .normal)
            tabLeftButton.setBackgroundImage(UIImage(named: "tab_Light.png"), for: .normal)
            tabMidButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
            tabRightButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
            
            let seedAmountInDB = realm.objects(SeedsData.self).count
            showRows(ScrollArray: itemScrollArray,Result: seedAmountInDB,line: 5)
            var seedCount = 0
            let seed = SeedLib()
            
            for a in 0...seedAmountInDB - 1{
                itemButtonArray[a]!.alpha = 1
                itemAmountArray[a]!.alpha = 1
                
                let seedDB = realm.objects(SeedsData.self).filter( "Seq == \(seedCount)")
                for result in seedDB{
                    itemButtonArray[a]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                    itemButtonArray[a]!.setImage(UIImage(named: "blank.png"), for: .normal)
                    itemButtonArray[a]!.setTitle("\(seedCount)", for: .normal)//seq
                    itemButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                    itemAmountArray[a]!.setTitle("\(result.Amount)", for: .normal)
                }
                seedCount += 1
            }
            
            
            
        default:
            itemsView.isHidden = false
        }
    }
    
    func showRows(ScrollArray: [UIView?], Result: Int, line: Int){
        var quotResult = Result.quotientAndRemainder(dividingBy: 3)
        if quotResult.remainder != 0{
            quotResult.quotient += 1
        }
        var lineShouldShow = 0
        if quotResult.quotient <= line{
            lineShouldShow = line - 1
        }
        else{
            lineShouldShow = quotResult.quotient - 1
        }
        for i in ScrollArray[0...lineShouldShow]{
            i?.isHidden = false
        }
    }
    
    @IBAction func backToMain(_ sender: Any) {
        playSoundEffect(fileName: "1")
        if realm.objects(MainData.self)[0].storyStatus == true{
            performSegue(withIdentifier: K.backStory, sender: self)
        }
        else if setFuncPressed == "Library" {
            setFuncPressed = ""
            libraryView.alpha = 1
            libraryStack.alpha = 1
        }
        else{
            if setFuncPressed == "volume"{
                setFuncPressed = ""
                
                try! realm.write {
                    realm.objects(SoundData.self)[0].musicVolume = Float(musicVolume)
                    realm.objects(SoundData.self)[0].soundVolume = Float(soundVolume)
                }
                playMusic()
            }
            else{
                getImage()
                initial()
                
            }
        }
        
    }
    
    @IBAction func soundOpenClosePressed(_ sender: UIButton) {
        
        print(sender.currentTitle)
        let buttonName = [musicOpen,musicClosed,soundOpen,soundClosed]
        let buttonNameStr = ["musicOpen","musicClosed","soundOpen","soundClosed"]
        var buttonPressed = ""
        for a in 0...3 {
            if buttonName[a] == sender{
                buttonPressed = buttonNameStr[a]
            }
        }
        switch buttonPressed{
        case "musicOpen":
            
            musicSlider.isHidden = false
            musicOpen.setBackgroundImage(UIImage(named: "librarytab_Light.png"), for: .normal)
            musicClosed.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            try! realm.write {
                realm.objects(SoundData.self)[0].musicOpen = true
            }
        case "musicClosed":
            musicSlider.isHidden = true
            musicOpen.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            musicClosed.setBackgroundImage(UIImage(named: "librarytab_Light.png"), for: .normal)
            try! realm.write {
                realm.objects(SoundData.self)[0].musicOpen = false
            }
        case "soundOpen":
            soundSlider.isHidden = false
            soundOpen.setBackgroundImage(UIImage(named: "librarytab_Light.png"), for: .normal)
            soundClosed.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            try! realm.write {
                realm.objects(SoundData.self)[0].soundOpen = true
            }
        case "soundClosed":
            soundSlider.isHidden = true
            soundOpen.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            soundClosed.setBackgroundImage(UIImage(named: "librarytab_Light.png"), for: .normal)
            try! realm.write {
                realm.objects(SoundData.self)[0].soundOpen = false
            }
        default:
            break
        }
        playMusic(slider: true)
        playSoundEffect(fileName: "2",slider: true)
    }
    
    @IBAction func volumeSlider(_ sender: UISlider) {
        setFuncPressed = "volume"
        
        
        if sender == musicSlider{
            musicVolume = Double(sender.value)
        }
        else{
            soundVolume = Double(sender.value)
            playSoundEffect(fileName: "3", slider: true)
        }
        playMusic(slider: true)
        
    }
    
    
    
    @IBAction func itemsTabPressed(_ sender: UIButton) {
        playSoundEffect(fileName: "2")
        tabSelected = sender.currentTitle!
        
        let itemButtonArray = [itemButton1_1,itemButton1_2,itemButton1_3,itemButton2_1,itemButton2_2,itemButton2_3,itemButton3_1,itemButton3_2,itemButton3_3,itemButton4_1,itemButton4_2,itemButton4_3,itemButton5_1,itemButton5_2,itemButton5_3,itemButton6_1,itemButton6_2,itemButton6_3]
        
        let itemAmountArray = [itemAmountButton1_1,itemAmountButton1_2,itemAmountButton1_3,itemAmountButton2_1,itemAmountButton2_2,itemAmountButton2_3,itemAmountButton3_1,itemAmountButton3_2,itemAmountButton3_3,itemAmountButton4_1,itemAmountButton4_2,itemAmountButton4_3,itemAmountButton5_1,itemAmountButton5_2,itemAmountButton5_3,itemAmountButton6_1,itemAmountButton6_2,itemAmountButton6_3]
        
        let itemScrollArray = [itemScrollView1,itemScrollView2,itemScrollView3,itemScrollView4,itemScrollView5,itemScrollView6]
        
        for e in itemButtonArray + itemAmountArray{
            e!.alpha = 0
        }
        backMainButton2.alpha = 1
        itemConfirm.setImage(UIImage(named: "confirm_Dark.png"), for: .normal)
        showRows(ScrollArray: itemScrollArray,Result: 1 ,line: 5)
        
        getSeedsMoneyView.isHidden = true
        seedLabel.isHidden = true
        
        itemScrollView.setContentOffset(CGPoint(x: 0, y: 0 ), animated: false)
        for a in itemButtonArray{
            a!.transform = CGAffineTransform(translationX: 0, y: 0)
            a!.transform = CGAffineTransform(scaleX: 1, y: 1)
            a!.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        
        
        if setFuncPressed == "store"{
            let isEnableArray = itemButtonArray + itemAmountArray
            for e in isEnableArray{
                e!.isEnabled = true
            }
            
            
            if sender.currentTitle == "種子"{
                
                tabLeftButton.setBackgroundImage(UIImage(named: "tab_Light.png"), for: .normal)
                tabMidButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
                tabRightButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
                
                let seedAmountInDB = realm.objects(SeedsData.self).count
                showRows(ScrollArray: itemScrollArray,Result: seedAmountInDB,line: 5)
                var seedCount = 0
                let seed = SeedLib()
                
                for a in 0...seedAmountInDB - 1{
                    itemButtonArray[a]!.alpha = 1
                    itemAmountArray[a]!.alpha = 1
                    let seedCost = seed.seedCost(NO: seedCount)
                    itemAmountArray[a]!.setTitle("\(seedCost)", for: .normal)
                    if seedCost > realm.objects(MainData.self)[0].mainMoney{
                        itemButtonArray[a]!.isEnabled = false
                        itemAmountArray[a]!.isEnabled = false
                    }
                    let seedDB = realm.objects(SeedsData.self).filter( "Seq == \(seedCount)")
                    for result in seedDB{
                        itemButtonArray[a]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                        itemButtonArray[a]!.setImage(UIImage(named: "blank.png"), for: .normal)
                        itemButtonArray[a]!.setTitle("\(seedCount)", for: .normal)//seq
                        itemButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                    }
                    seedCount += 1
                }
            }
            else if sender.currentTitle == "容器" {
                tabLeftButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
                tabMidButton.setBackgroundImage(UIImage(named: "tab_Light.png"), for: .normal)
                tabRightButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
                
                let boxes = BoxLib()//要先找出到底哪些NO是可以買的，再把數量算出來&show進圖片
                var NO = [1]
                for TmpNO in 1...boxes.boxes.count{
                    if realm.objects(BoxesData.self).filter( "#NO == \(TmpNO)").count == 0{
                        NO += [TmpNO]
                    }
                }
                NO.remove(at: 0)
                print(NO)
                var boxCount = 0
                let boxCanBuy = NO.count // 已在DB的不能買
                //                var boxCount = 1
                //                let boxCanBuy = boxes.boxes.count
                
                showRows(ScrollArray: itemScrollArray,Result: boxCanBuy,line: 5)
                
                if NO.count > 0{
                    
                    for a in 0...(boxCanBuy - 1){
                        let boxCost = boxes.getBoxforSell(NO: NO[a]).Cost//boxCount).Cost
                        
                        itemButtonArray[a]!.alpha = 1
                        itemAmountArray[a]!.alpha = 1
                        itemButtonArray[a]!.setBackgroundImage(UIImage(named: "\(boxes.getBoxforSell(NO: NO[a]).Image).png"), for: .normal)//boxCount).Image).png"), for: .normal)
                        itemButtonArray[a]!.setImage(UIImage(named: "blank.png"), for: .normal)
                        itemButtonArray[a]!.setTitle("\(NO[a])", for: .normal)
                        itemButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                        itemAmountArray[a]!.setTitle("\(boxCost)", for: .normal)//no
                        itemButtonArray[a]!.transform = CGAffineTransform(translationX: 0, y: -20)
                        
                        itemButtonArray[a]!.imageEdgeInsets = UIEdgeInsets(top: 25, left: 0, bottom: -25, right: 0)
                        
                        if (boxCost > realm.objects(MainData.self)[0].mainMoney) || (realm.objects(BoxesData.self).filter( "#NO == \(NO[a])").count != 0){//\(a + 1)").count != 0){
                            itemButtonArray[a]!.isEnabled = false
                            itemAmountArray[a]!.isEnabled = false
                        }
                        boxCount += 1
                    }
                }
                else{
                    getSeedsMoneyView.isHidden = false
                    seedLabel.isHidden = false
                    seedLabel.text = "容器賣光光了！\n\n等以後進貨再來買！"
                    backMainButton2.alpha = 0
                }
            }
            else if sender.currentTitle == "道具" {
                tabLeftButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
                tabMidButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
                tabRightButton.setBackgroundImage(UIImage(named: "tab_Light.png"), for: .normal)
                
                let props = PropLib()
                let propsCanBuy = props.props.count
                
                showRows(ScrollArray: itemScrollArray,Result: propsCanBuy,line: 5)
                var propCount = 1
                
                
                for a in 0...(propsCanBuy - 1){
                    let propCost = props.getPropforSell(NO: propCount).Cost
                    itemButtonArray[a]!.alpha = 1
                    itemAmountArray[a]!.alpha = 1
                    itemButtonArray[a]!.setBackgroundImage(UIImage(named: "\(props.getPropforSell(NO: propCount).Image).png"), for: .normal)
                    itemButtonArray[a]!.setImage(UIImage(named: "blank.png"), for: .normal)
                    itemButtonArray[a]!.setTitle("\(propCount)", for: .normal)//no
                    itemButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                    itemAmountArray[a]!.setTitle("\(propCost)", for: .normal)
                    
                    itemButtonArray[a]!.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                    
                    if propCost > realm.objects(MainData.self)[0].mainMoney{
                        itemButtonArray[a]!.isEnabled = false
                        itemAmountArray[a]!.isEnabled = false
                    }
                    
                    propCount += 1
                }
            }
        }
        
        if setFuncPressed == "item"{
            let isEnableArray = itemButtonArray + itemAmountArray
            for e in isEnableArray{
                e!.isEnabled = true
            }
            
            
            if sender.currentTitle == "種子"{
                
                tabLeftButton.setBackgroundImage(UIImage(named: "tab_Light.png"), for: .normal)
                tabMidButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
                tabRightButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
                
                let seedAmountInDB = realm.objects(SeedsData.self).count
                showRows(ScrollArray: itemScrollArray,Result: seedAmountInDB,line: 5)
                var seedCount = 0
                let seed = SeedLib()
                
                for a in 0...seedAmountInDB - 1{
                    itemButtonArray[a]!.alpha = 1
                    itemAmountArray[a]!.alpha = 1
                    
                    
                    let seedDB = realm.objects(SeedsData.self).filter( "Seq == \(seedCount)")
                    for result in seedDB{
                        itemButtonArray[a]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                        itemButtonArray[a]!.setImage(UIImage(named: "blank.png"), for: .normal)
                        itemButtonArray[a]!.setTitle("\(seedCount)", for: .normal)//seq
                        itemButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                        itemAmountArray[a]!.setTitle("\(result.Amount)", for: .normal)
                    }
                    seedCount += 1
                }
            }
            else if sender.currentTitle == "容器" {
                tabLeftButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
                tabMidButton.setBackgroundImage(UIImage(named: "tab_Light.png"), for: .normal)
                tabRightButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
                
                let boxes = BoxLib()
                var boxCount = 1
                //let boxCanBuy = boxes.boxes.count
                let boxAmountInDB = realm.objects(BoxesData.self).count
                //
                //
                //可能會有問題，測試一下多個箱子（應該百分之百有問題，要去讀DB裡的箱子NO才對
                //
                //
                //
                showRows(ScrollArray: itemScrollArray,Result: boxAmountInDB,line: 5)
                
                //                for a in 0...(boxCanBuy - 1){
                //
                //                    itemButtonArray[a]!.alpha = 1
                //                    itemAmountArray[a]!.alpha = 0
                //                    itemButtonArray[a]!.setBackgroundImage(UIImage(named: "\(boxes.getBoxforSell(NO: boxCount).Image).png"), for: .normal)
                //                    itemButtonArray[a]!.setImage(UIImage(named: "blank.png"), for: .normal)
                //                    itemButtonArray[a]!.setTitle("\(boxCount)", for: .normal)//no
                //                    itemButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                //
                //
                //
                
                if boxAmountInDB >= 1{
                    for a in 0...boxAmountInDB - 1{
                        itemButtonArray[a]!.alpha = 1
                        itemAmountArray[a]!.alpha = 1
                        let boxDB = realm.objects(BoxesData.self).filter( "Seq == \(boxCount)")
                        for result in boxDB{
                            itemButtonArray[a]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                            itemButtonArray[a]!.setTitle("\(boxCount)", for: .normal)
                            itemButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                            itemAmountArray[a]!.alpha = 0
                            boxCount += 1
                        }
                        itemButtonArray[a]!.transform = CGAffineTransform(translationX: 0, y: -20)
                        itemButtonArray[a]!.imageEdgeInsets = UIEdgeInsets(top: 25, left: 0, bottom: -25, right: 0)
                    }
                    
                    
                }
            }
            else if sender.currentTitle == "道具" {
                tabLeftButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
                tabMidButton.setBackgroundImage(UIImage(named: "tab_Dark.png"), for: .normal)
                tabRightButton.setBackgroundImage(UIImage(named: "tab_Light.png"), for: .normal)
                
                let propAmountInDB = realm.objects(PropsData.self).count
                
                showRows(ScrollArray: itemScrollArray,Result: propAmountInDB,line: 5)
                
                var propCount = 1
                if propAmountInDB >= 1{
                    for a in 0...propAmountInDB - 1{
                        itemButtonArray[a]!.alpha = 1
                        itemAmountArray[a]!.alpha = 1
                        let propDB = realm.objects(PropsData.self).filter( "Seq == \(propCount)")
                        for result in propDB{
                            itemButtonArray[a]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                            itemButtonArray[a]!.setTitle("\(propCount)", for: .normal)
                            itemButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                            itemAmountArray[a]!.setTitle("\(result.Amount)", for: .normal)
                            
                            propCount += 1
                        }
                    }
                }
                else{
                    getSeedsMoneyView.isHidden = false
                    seedLabel.isHidden = false
                    backMainButton2.alpha = 0
                    seedLabel.text = "道具空空、櫃子空空、只有口袋不空空！\n\n商店的大門為你開啟！"
                }
            }
        }
    }
    
    @IBAction func itemsPressed(_ sender: UIButton) {
        playSoundEffect(fileName: "4")
        let itemButtonArray = [itemButton1_1,itemButton1_2,itemButton1_3,itemButton2_1,itemButton2_2,itemButton2_3,itemButton3_1,itemButton3_2,itemButton3_3,itemButton4_1,itemButton4_2,itemButton4_3,itemButton5_1,itemButton5_2,itemButton5_3,itemButton6_1,itemButton6_2,itemButton6_3]
        itemConfirm.setImage(UIImage(named: "confirm_Dark.png"), for: .normal)
        
        itemSelected = String(sender.currentTitle!)
        
        var NO = 1
        for i in itemButtonArray{
            i!.setImage(UIImage(named: "blank.png"), for: .normal)
            NO += 1
        }
        
        if setFuncPressed == "combine"{
            
            if combine1 == "" && combine2 == ""{
                combine1 = itemSelected//sender.self.currentTitle!
            }
            else if combine1 != "" && combine2 == ""{
                combine2 = itemSelected//sender.self.currentTitle!
                itemConfirm.setImage(UIImage(named: "confirm_Light.png"), for: .normal)
            }
            else{
                if combine2 != itemSelected{//sender.self.currentTitle!{
                    combine1 = combine2
                    combine2 = itemSelected//sender.self.currentTitle!
                }
                itemConfirm.setImage(UIImage(named: "confirm_Light.png"), for: .normal)
            }
            NO = 1
            for i in itemButtonArray{
                if i!.currentTitle == combine1 || i!.currentTitle == combine2{
                    i!.setImage(UIImage(named: "Select.png"), for: .normal)
                }
                NO += 1
            }
            
        }
        else if setFuncPressed == "store" {
            if tabSelected == "種子" {
                sender.setImage(UIImage(named: "Select.png"), for: .normal)
            }
            else if tabSelected == "容器" {
                sender.setImage(UIImage(named: "Select.png"), for: .normal)
            }
            else if tabSelected == "道具"{
                sender.setImage(UIImage(named: "Select.png"), for: .normal)
            }
            itemConfirm.setImage(UIImage(named: "confirm_Light.png"), for: .normal)
        }
            
        else if setFuncPressed == "propUsed"{
            sender.setImage(UIImage(named: "Select.png"), for: .normal)
            itemConfirm.setImage(UIImage(named: "confirm_Light.png"), for: .normal)
        }
        
    }
    
    @IBAction func itemsConfirmPressed(_ sender: UIButton) {
        playSoundEffect(fileName: "5")
        var getImage = ""
        
        if setFuncPressed == "combine"{
            if combine1 != "" && combine2 != ""{
                let getSeed = MixSeeds()
                var seed = SeedLib()
                var newSeedSeq = 0
                print("combine1 = ",combine1," combine2 = ",combine2)
                print("combine1 INT = ",Int(combine1)!," combine2 INT = ",Int(combine2)!)
                var Seed1NO = 0
                var Seed2NO = 0
                let Seed1 = realm.objects(SeedsData.self).filter( "Seq == \(Int(combine1)!)")
                print("seed1 SEQ get")
                for array in Seed1{
                    Seed1NO = array.NO
                    print("seed1 = ",Seed1NO)
                }
                let Seed2 = realm.objects(SeedsData.self).filter( "Seq == \(Int(combine2)!)")
                for array in Seed2{
                    Seed2NO = array.NO
                    print("seed2 = ",Seed2NO)
                }
                print("GET ",Seed1NO,Seed2NO)
                let newSeedNO = getSeed.getNewCombineSeed(NO1: Seed1NO, NO2: Seed2NO)
                print("NEW ",newSeedNO)
                let newSeedInfo = realm.objects(SeedsData.self).filter( "#NO == \(newSeedNO)")
                print("NEW COUNT ",newSeedInfo.count)
                if newSeedInfo.count == 0{
                    let array = seed.getNameImage(NO: newSeedNO)
                    let seedData = SeedsData(value:[array.Seq,array.NO,array.Image,array.Name,5,array.Spec])
                    getImage = array.Image
                    print("NEW SEQ ",array.Seq)
                    try! realm.write {
                        realm.add(seedData)
                    }
                    SeedSeedNew.alpha = 1
                    if array.Spec == true{
                        try! realm.write {
                            realm.objects(MainData.self)[0].storyStatus = true
                        }
                    }
                }
                else{
                    for result in newSeedInfo{
                        print(result.Seq)
                        newSeedSeq = result.Seq
                        getImage = result.Image
                    }
                    try! realm.write {
                        realm.objects(SeedsData.self)[newSeedSeq].Amount += 5
                    }
                }
                try! realm.write {
                    realm.objects(SeedsData.self)[Int(combine1)!].Amount -= 5
                    realm.objects(SeedsData.self)[Int(combine2)!].Amount -= 5
                }
                getSeedsMoneyView.isHidden = false
                backMainButton.alpha = 1
                seedMoneySeedStack.isHidden = false
                SeedMoneySeedImage.image = UIImage(named: "\(getImage).png")
                seedMoneySeedAmount.text = String("x 5")
                itemsView.alpha = 0
                seedMoneySeedStack.transform =  CGAffineTransform(translationX: 0, y: -20)
            }
        }
        else if setFuncPressed == "store" && String(itemSelected) != ""{
            seedMoneySeedAmount.isHidden = false
            //if Tab = seeds, 減掉一組種子的錢，增加一組種子的數量（三顆？一顆？？？？）
            if tabSelected == "種子" {
                var seed = SeedLib()
                let seedDB = realm.objects(SeedsData.self).filter( "#Seq == \(itemSelected)")
                var NO = 0
                var getAmount = 0
                for array in seedDB{
                    NO = array.NO
                    getImage = array.Image
                }
                let Cost = seed.seedCost(NO: NO)
                //                getImage = realm.objects(SeedsData.self)[seq].Image
                try! realm.write {
                    realm.objects(MainData.self)[0].mainMoney -= Cost
                    realm.objects(SeedsData.self)[NO].Amount += 5
                }
                
                seedMoneySeedAmount.text = String("x 5")
            }
                //else if Tab = boxes, 減掉箱子的錢，新增一筆箱子data進Realm
            else if tabSelected == "容器" {
                print("you buy box \(Int(itemSelected))")
                var box = BoxLib()
                let Cost = box.getBoxforSell(NO: Int(itemSelected)!).Cost
                let array = box.getBoxesData(NO: Int(itemSelected)!)
                getImage = array.Image
                let boxData = BoxesData(value:[array.Seq,array.NO,array.Name,array.Image])
                                       
                try! realm.write {
                    realm.objects(MainData.self)[0].mainMoney -= Cost
                    realm.add(boxData)
                }
                SeedSeedNew.alpha = 1
                SeedMoneySeedImage.transform = CGAffineTransform(translationX: 20, y: -25)
                seedMoneySeedAmount.isHidden = true
            }
                //else if Tab = Props, 減掉道具的錢，如果Realm裡面沒有那個道具則新增道具，若有則新增數量
            else if tabSelected == "道具"{
                var prop = PropLib()
                let Cost = prop.getPropforSell(NO: Int(itemSelected)!).Cost
                
                let buyPropInfo = realm.objects(PropsData.self).filter( "#NO == \(Int(itemSelected)!)")
                
                if buyPropInfo.count == 0 {
                    let array = prop.getPropData(NO: Int(itemSelected)!)
                    getImage = array.Image
                    let propData = PropsData(value:[array.Seq, array.NO, array.Name, array.Image, 5])
                    try! realm.write {
                        realm.add(propData)
                    }
                    SeedSeedNew.alpha = 1
                }
                else{
                    var propSeq = 0
                    for result in buyPropInfo{
                        propSeq = result.Seq
                        getImage = result.Image
                    }
                    try! realm.write {
                        realm.objects(PropsData.self)[propSeq - 1].Amount += 5
                    }
                }
                try! realm.write {
                    realm.objects(MainData.self)[0].mainMoney -= Cost
                }
                //                        SeedSeedAmount.text = String("x 5")
                seedMoneySeedAmount.text = String("x 5")
            }
            //                    getSeedsView.isHidden = false
            getSeedsMoneyView.isHidden = false
            seedMoneySeedStack.isHidden = false
            backMainButton.alpha = 1
            SeedMoneySeedImage.image = UIImage(named: "\(getImage).png")
            seedMoneySeedStack.transform =  CGAffineTransform(translationX: 0, y: -20)
            //                    SeedSeedImage.image = UIImage(named: "\(getImage).png")
            
            itemsView.alpha = 0
        }
        else if setFuncPressed == "propUsed" && String(itemSelected) != ""{
            getSeedsMoneyView.isHidden = false
            seedLabel.isHidden = false
            backMainButton.alpha = 1
            itemsView.alpha = 0
            let prop = PropLib()
            var propSeq = 0
            var propNO = 0
            let siteNO = (Int(sitePressed.suffix(1)) ?? 1) - 1
            print(siteNO)
            let usedPropInfo = realm.objects(PropsData.self).filter( "#Seq == \(Int(itemSelected)!)")
            for a in usedPropInfo{
                propSeq = Int(itemSelected)! - 1
                propNO = a.NO
            }
            
            //get Seq for -1
            let effects = prop.getEffects(NO: propNO)
            if effects.Effect == ""{//普通效果
                let OriPlanTime = realm.objects(SiteData.self)[siteNO].plantTime
                let timeminer = Int(Float(OriPlanTime) * (1 - effects.Rate))
                
                try! realm.write {
                    realm.objects(SiteData.self)[siteNO].plantTime = Int(Float(OriPlanTime) * effects.Rate)//時間減少
                    realm.objects(SiteData.self)[siteNO].plusSeed += effects.AddAmount//種子變多
                    realm.objects(SiteData.self)[siteNO].propUsed = true
                    realm.objects(PropsData.self)[propSeq].Amount -= 1
                    realm.objects(SiteData.self)[siteNO].timer -= TimeInterval(timeminer)
                }
                
            }
            else{
                //特殊道具效果
            }
            seedLabel.text = "使用\n\(prop.getName(NO: propNO))\n成功啦！"
        }
    }
    
    @IBAction func StoryItemSelected(_ sender: UIButton) {
        playSoundEffect(fileName: "5")
        let storyImageArray = [storyImage1,storyImage2,storyImage3,storyImage4,storyImage5,storyImage6]
        let storyTitleArray = [storyTitle1,storyTitle2,storyTitle3,storyTitle4,storyTitle5,storyTitle6]
        for a in 0 ... 5{
            if (sender.self == storyImageArray[a] || sender == storyTitleArray[a]) && (sender.currentTitle != "???" && sender.currentImage != (UIImage(named: "library_unknown.png"))){
                
                try! realm.write {
                    realm.objects(MainData.self)[0].reviewStatus = true
                    realm.objects(MainData.self)[0].reviewStory = a + 1
                }
                performSegue(withIdentifier: K.backStory, sender: self)
                //gotoDelegate
            }
        }
        
    }
    
    
    
    
    @IBAction func ScollUpDown(_ sender: UIButton) {
        let buttonPressed = sender.currentTitle!
        let scroll = buttonPressed.prefix(3)
        let direction = buttonPressed.suffix(2)
        
        var scrollView = catScrollView
        
        
        switch scroll{
        case "cat":
            scrollView = catScrollView
        case "box":
            scrollView = boxScrollView
        case "itm":
            scrollView = itemScrollView
        case "lib":
            scrollView = libraryScrollView
        default:
            scrollView = catScrollView
        }
        
        
        
        let ContentHeight = scrollView!.contentLayoutGuide.layoutFrame.height
        let FrameHeight = scrollView!.frameLayoutGuide.layoutFrame.height
        let NowContentY = scrollView!.contentOffset.y
        
        
        if direction == "DN" {
            playSoundEffect(fileName: "3")
            if NowContentY < ContentHeight - FrameHeight - 15 {
                scrollView!.setContentOffset(CGPoint(x: 0, y: NowContentY + 20), animated: true)
                
            }
            else {
                
                scrollView!.setContentOffset(CGPoint(x: 0, y: NowContentY + 20), animated: true)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                    scrollView!.setContentOffset(CGPoint(x: 0, y: ContentHeight - FrameHeight ), animated: true)
                }
                
                
            }
            
        }
        else{
            playSoundEffect(fileName: "3_2")
            if NowContentY > 15{
                scrollView!.setContentOffset(CGPoint(x: 0, y: NowContentY - 20), animated: true)
                
            }
            else{
                scrollView!.setContentOffset(CGPoint(x: 0, y: NowContentY - 20), animated: true)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                    scrollView!.setContentOffset(CGPoint(x: 0, y: 0 ), animated: true)
                }
                
            }
        }
        
    }
    
    @IBAction func libraryTabPressed(_ sender: UIButton) {
        playSoundEffect(fileName: "5")
        tabSelected = sender.currentTitle!
        let libButtonArray = [libraryButton1_1,libraryButton1_2,libraryButton1_3,libraryButton2_1,libraryButton2_2,libraryButton2_3,libraryButton3_1,libraryButton3_2,libraryButton3_3,libraryButton4_1,libraryButton4_2,libraryButton4_3,libraryButton5_1,libraryButton5_2,libraryButton5_3,libraryButton6_1,libraryButton6_2,libraryButton6_3]
        
        let libScrollArray = [libraryScrollView1,libraryScrollView2,libraryScrollView3,libraryScrollView4,libraryScrollView5,libraryScrollView6]
        
        for e in libButtonArray{
            e!.setTitle("", for: .normal)
            e!.setBackgroundImage(UIImage(named: "library_unknown.png"), for: .normal)
        }
        libraryScrollView.setContentOffset(CGPoint(x: 0, y: 0 ), animated: false)
        for a in libButtonArray{
            a!.transform = CGAffineTransform(translationX: 0, y: 0)
            a!.transform = CGAffineTransform(scaleX: 1, y: 1)
            a!.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        if sender.currentTitle == "種子"{
            libTabLeft.setBackgroundImage(UIImage(named: "librarytab_Light.png"), for: .normal)
            libTabMid.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            libTabRight.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            
            let seedAmountInDB = realm.objects(SeedsData.self).count - 1
            showRows(ScrollArray: libScrollArray,Result: seedAmountInDB,line: 4)
            var seedCount = 1
            
            for a in 0...seedAmountInDB - 1{
                libButtonArray[a]!.alpha = 1
                libButtonArray[a]!.alpha = 1
                let seedDB = realm.objects(SeedsData.self).filter( "Seq == \(seedCount)")
                for result in seedDB{
                    libButtonArray[a]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                    libButtonArray[a]!.setTitle("\(seedCount)", for: .normal)
                    libButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                }
                seedCount += 1
            }
            
        }
        else if sender.currentTitle == "容器" {
            libTabLeft.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            libTabMid.setBackgroundImage(UIImage(named: "librarytab_Light.png"), for: .normal)
            libTabRight.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            
            let boxAmountInDB = realm.objects(BoxesData.self).count
            showRows(ScrollArray: libScrollArray,Result: boxAmountInDB,line: 4)
            var boxCount = 1
            
            for a in 0...boxAmountInDB - 1{
                libButtonArray[a]!.alpha = 1
                libButtonArray[a]!.alpha = 1
                let boxDB = realm.objects(BoxesData.self).filter( "Seq == \(boxCount)")
                for result in boxDB{
                    libButtonArray[a]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                    libButtonArray[a]!.setTitle("\(boxCount)", for: .normal)
                    libButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)
                    libButtonArray[a]!.transform = CGAffineTransform(translationX: 0, y: -20)
                    
                    libButtonArray[a]!.imageEdgeInsets = UIEdgeInsets(top: 25, left: 0, bottom: -25, right: 0)
                }
                boxCount += 1
            }
            
        }
        else if sender.currentTitle == "道具" {
            libTabLeft.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            libTabMid.setBackgroundImage(UIImage(named: "librarytab_Dark.png"), for: .normal)
            libTabRight.setBackgroundImage(UIImage(named: "librarytab_Light.png"), for: .normal)
            
            let propAmountInDB = realm.objects(PropsData.self).count
            
            showRows(ScrollArray: libScrollArray,Result: propAmountInDB,line: 4)
            var propCount = 1
            if propAmountInDB >= 1{
                for a in 0...propAmountInDB - 1{
                    libButtonArray[a]!.alpha = 1
                    libButtonArray[a]!.alpha = 1
                    let propDB = realm.objects(PropsData.self).filter( "Seq == \(propCount)")
                    for result in propDB{
                        libButtonArray[a]!.setBackgroundImage(UIImage(named: "\(result.Image).png"), for: .normal)
                        libButtonArray[a]!.setTitle("\(propCount)", for: .normal)
                        libButtonArray[a]!.setTitleColor(UIColor.clear, for: .normal)

                        libButtonArray[a]!.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                    }
                    propCount += 1
                }
                
            }
            
        }
    }
    
    
    
    
    @IBAction func libraryItemPressed(_ sender: UIButton) {
        playSoundEffect(fileName: "4")
        itemSelected = String(sender.currentTitle ?? "")
        if String(itemSelected) != "" {
            libraryView.alpha = 0
            libraryContentView.alpha = 1
            setFuncPressed = "Library"
            if tabSelected == "種子"{
                let seeds = SeedLib()
                let seedDB = realm.objects(SeedsData.self).filter( "#Seq == \(itemSelected)")
                var NO = 0
                for array in seedDB{
                    NO = array.NO
                    libraryCatImage.image = UIImage(named: "\(array.Image).png")
                    libraryCatName.text = array.Name
                    print(NO)
                    libraryCatInfo.text = seeds.getInfo(NO: NO)
                }
                
            }
            else if tabSelected == "容器" {
                let box = BoxLib()
                let boxDB = realm.objects(BoxesData.self).filter( "#Seq == \(itemSelected)")
                var NO = 0
                for array in boxDB{
                    NO = array.NO
                    libraryCatImage.image = UIImage(named: "\(array.Image).png")
                    libraryCatName.text = array.Name
                }
                libraryCatInfo.text = box.getInfo(NO: NO)
            }
            else if tabSelected == "道具"{
                let prop = PropLib()
                let propDB = realm.objects(PropsData.self).filter( "#Seq == \(itemSelected)")
                var NO = 0
                for array in propDB{
                    NO = array.NO
                    libraryCatImage.image = UIImage(named: "\(array.Image).png")
                    libraryCatName.text = array.Name
                }
                libraryCatInfo.text = prop.getInfo(NO: NO)
            }
        }
    }
    
    func playMusic(slider: Bool = false){
        
        if realm.objects(SoundData.self)[0].musicOpen == true{
            print(realm.objects(SoundData.self)[0].musicOpen)
            if queuePlayer?.items() == nil {
                let url = Bundle.main.url(forResource: "BGM1", withExtension: "wav")
                let asset = AVAsset(url: url!)
                let item = AVPlayerItem(asset: asset)
                self.queuePlayer = AVQueuePlayer(playerItem: item)
                BGMplayer = AVPlayerLooper(player: queuePlayer, templateItem: item)
            }
            if slider == true{
                queuePlayer.volume = Float(musicVolume)
            }
            else{
                queuePlayer.volume = realm.objects(SoundData.self)[0].musicVolume
            }
            //                    queuePlayer.play()
            self.queuePlayer?.play()
        }
        else{
            print(realm.objects(SoundData.self)[0].musicOpen)
            if queuePlayer?.items() != nil {
                queuePlayer.pause()
            }
        }
        
    }
    func playSoundEffect(fileName: String, slider: Bool = false){
        if realm.objects(SoundData.self)[0].soundOpen == true{
            let url = Bundle.main.url(forResource: fileName, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            if slider == true{
                player.volume = Float(soundVolume)
            }
            else{
                player.volume = realm.objects(SoundData.self)[0].soundVolume
            }
            player.play()
        }
    }
    
    @IBAction func SpeedUP(_ sender: UIButton) {
        
        let TimeArray = [catTime1Button,catTime2Button,catTime3Button,catTime4Button,catTime5Button,catTime6Button,catTime7Button,catTime8Button]
        
        //紀錄sender
        for a in 0...7{
            if TimeArray[a] == sender{
                rewardADSelect = String(a)
            }
        }
        if sender.currentTitle != "0:0"{
            if rewardedAd?.isReady == true {
                rewardedAd?.present(fromRootViewController: self, delegate:self)
            }
            else{
                backMainButton.alpha = 1
                itemsView.alpha = 0
                getSeedsMoneyView.isHidden = false
                seedLabel.isHidden = false
                if monitor.currentPath.status != .satisfied{
                    seedLabel.text = "現在撥接接不上哇，\n\n看不到廣告——"
                }
                else{
                seedLabel.text = "跟貓貓電台的通訊不穩，\n\n找不到廣告耶⋯⋯"
                }
            }
        }
        else {
            sender.setTitle("0:0", for: .normal)
        }
    }
    @IBAction func moneyPlusPressed(_ sender: UIButton) {
        rewardADSelect = "Money"
        if rewardedAd?.isReady == true {
            rewardedAd?.present(fromRootViewController: self, delegate:self)
        }
        else{
            backMainButton.alpha = 1
            itemsView.alpha = 0
            getSeedsMoneyView.isHidden = false
            seedLabel.isHidden = false
            if monitor.currentPath.status != .satisfied{
                seedLabel.text = "現在撥接接不上哇，\n\n看不到廣告——"
            }
            else{
            seedLabel.text = "跟貓貓電台的通訊不穩，\n\n找不到廣告耶⋯⋯"
            }
        }
    }
    
    
    //MARK: - Notification
    func createNotification() {
           
        let Datas = realm.objects(SiteData.self)
        var interval = Double()
        for a in [0...7]{
        let DatasPerSite = Datas.self[a]
             for result in DatasPerSite{
                if result.flag == true{
                    let endTime = result.timer
                    let nowTime = Date()
                    let intervalA = endTime.timeIntervalSince(nowTime)
                    if interval == 0 && intervalA > 0{
                        interval = intervalA
                    }
                    else if intervalA > 0 && intervalA < interval{
                        interval = intervalA
                    }
                }
        }
        }
        print(interval)
        if interval > 0 {
           let content = UNMutableNotificationContent()
           
           content.title = "咚咚♪鏘鏘♪貓貓長大啦——"
//           content.subtitle = "不來看看嗎？看一下啦——！看一下啦！"
           content.body = "不來看看嗎？看一下啦——！看一下啦！"
           content.badge = 1
           content.sound = UNNotificationSound.default
           content.categoryIdentifier = "alarmMessage"

           let imageURL = Bundle.main.url(forResource: "1024", withExtension: "png")
           let attachment = try! UNNotificationAttachment(identifier: "", url: imageURL!, options: nil)
           
           content.attachments = [attachment]
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
               let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
               
               UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
           }
    }
    //MARK: - Reward AD
    func createAndLoadRewardedAd() -> GADRewardedAd{
        rewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-5920700831518359/9303424233")
        rewardedAd?.load(GADRequest()) { error in
            if let error = error {
                print("Loading failed: \(error)")
                
            } else {
                print("Loading Succeeded")
            }
        }
        return rewardedAd!
    }
    
    
    /// Tells the delegate that the user earned a reward.
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        //是哪個按鈕的廣告，去siteDB改Date成Now
        if rewardADSelect == "Money"{
            try! realm.write {
                realm.objects(MainData.self)[0].mainMoney += 500
            }
            getSeedsMoneyView.isHidden = false
            backMainButton.alpha = 1
            seedMoneyMoney.text = String("x 500")
            seedMoneyStack.isHidden = false
            
        }
        else{
            try! realm.write {
                realm.objects(SiteData.self)[Int(rewardADSelect)!].timer = Date()
            }
            //                    let url = Bundle.main.url(forResource: "BGM1", withExtension: "wav")
            //                    let asset = AVAsset(url: url!)
            //                    let item = AVPlayerItem(asset: asset)
            //                    self.queuePlayer = AVQueuePlayer(playerItem: item)
            //                    BGMplayer = AVPlayerLooper(player: queuePlayer, templateItem: item)
            //                    queuePlayer.play()
            playMusic()
            print(queuePlayer?.items())
            getImage()
            initial()
            
        }
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
    /// Tells the delegate that the rewarded ad was presented.
    func rewardedAdDidPresent(_ rewardedAd: GADRewardedAd) {
        playMusic()
        print("Rewarded ad presented.")
    }
    /// Tells the delegate that the rewarded ad was dismissed.
    func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
        var rewardedAd = createAndLoadRewardedAd()
        if realm.objects(SoundData.self)[0].musicOpen == true{
            let url = Bundle.main.url(forResource: "BGM1", withExtension: "wav")
            let asset = AVAsset(url: url!)
            let item = AVPlayerItem(asset: asset)
            self.queuePlayer = AVQueuePlayer(playerItem: item)
            BGMplayer = AVPlayerLooper(player: queuePlayer, templateItem: item)
            queuePlayer.volume = realm.objects(SoundData.self)[0].musicVolume
            queuePlayer.play()
        }
        getImage()
        initial()
        print("Rewarded ad dismissed.")
    }
    /// Tells the delegate that the rewarded ad failed to present.
    func rewardedAd(_ rewardedAd: GADRewardedAd, didFailToPresentWithError error: Error) {
        print("Rewarded ad failed to present.")
    }
}
