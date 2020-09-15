//
//  CatSeedLib.swift
//  GrassCat
//
//  Created by Xyndi on 2020/4/15.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import Foundation
import RealmSwift

struct SeedSetting{
    let NO: Int
    let Name: String
    let Image: String
    let Spec: Bool
    let Info: String
    //    let Time: Int
    //    let Min: Int//可能獲得數量min
    //    let Max: Int//可能獲得數量max
    //    let MinMoney: Int
    //    let MaxMoney: Int
    
}
struct SeedLib{
    let seeds = [
        SeedSetting(NO:1,Name:"鈴鐺喵",Image:"cat01",Spec:false,Info:"因為只要一動就會噹噹噹的響所以常被貓討厭，但偶爾還是會有喜歡跟他玩的貓。\n\n非常享受被貓肉球攻擊的快感。\n\n除了吵之外沒有任何攻擊力。\n\n被叫成貓鈴鐺會生氣。"),
        SeedSetting(NO:2,Name:"拖鞋喵",Image:"cat02",Spec:false,Info:"室內拖鞋的右腳，左腳失蹤以後就這樣被留了下來。\n\n自稱右腳大爺，還強迫其他貓也要這樣叫他，認為自己是支撐人類的偉大存在。\n\n退休以後想當貓的拖鞋。\n\n（但其實是不分邊的拖鞋。）"),
        SeedSetting(NO:3,Name:"滑鼠喵",Image:"cat03",Spec:false,Info:"非常不受控，要移動還是點擊都全靠他心情。加上耳朵又長在非常妨礙使用的位置，幾乎都只被當成擺設。\n\n因為很閒所以常常用尾巴的電線逗貓。\n\n關燈之後眼睛會根據呼吸的頻率發亮。"),
        SeedSetting(NO:4,Name:"鈴鐺喵",Image:"cat04",Spec:false,Info:"？？？"),
        SeedSetting(NO:5,Name:"罐頭喵",Image:"cat05",Spec:true ,Info:"會偷偷躲在收藏罐頭的櫃子裡，每天都會跟其他罐頭講話，得不到回答好像也沒關係。\n\n被主人拿到的時候會發出無聲的尖叫，還全身發抖。（不過人類好像不能察覺）\n\n頭上類似耳朵的部份其實是罐頭的包裝紙，破掉的話就去拿其他罐頭的包裝來用。")
    ]
    
    
    mutating func getNameImage(NO: Int) -> (Seq: Int,NO: Int,Image: String, Name: String, Spec: Bool){
        let SeqNow = realm.objects(SeedsData.self).count
        return (SeqNow,NO, seeds [NO - 1].Image,seeds[NO - 1].Name,seeds[NO - 1].Spec)
    }
    func getInfo(NO: Int) -> String{
        return(seeds[NO - 1].Info)
    }
    
    func getTime(NO: Int) -> Int{
        var Time = 30
        switch NO{
        case 1...3:
            Time = NO * 30
        case 4...6:
            Time = NO * 40
        default:
            Time = 30
        }
        
        return(Time)
    }
    
    func seedsMoney(NO: Int) -> (Min: Int,Max: Int, MinMoney: Int, MaxMoney: Int){
        var min = 4
        var max = 7
        switch NO{
        case 1...3:
            min = 4
            max = 5
        case 4...6:
            min = 3
            max = 5
        default:
            min = 2
            max = 5
        }
        
        return (min,max,min * 10, max * 10)
    }
    //購買種子的錢
    func seedCost(NO:Int) -> Int{
        if NO == 0{
            return (250)
        }
        else{
        return (NO * 300)
        }
    }
    
}



struct MixSetting{
    let MixNO: Int //結合成的成品編號
    let SeedOne: Int //結合素材種子一號
    let SeedTwo: Int //結合素材種子二號
}
struct MixSeeds{
    let mix = [
        MixSetting(MixNO: 3, SeedOne: 1, SeedTwo: 2),
        MixSetting(MixNO: 4, SeedOne: 1, SeedTwo: 3),
        MixSetting(MixNO: 4, SeedOne: 2, SeedTwo: 3),
        MixSetting(MixNO: 5, SeedOne: 3, SeedTwo: 4),
        MixSetting(MixNO: 5, SeedOne: 2, SeedTwo: 4),
        MixSetting(MixNO: 5, SeedOne: 1, SeedTwo: 4)//待補
    ]
    
    func getNewCombineSeed(NO1: Int, NO2: Int) -> Int{
        var seq = 1
        var returnNO = 0
        for _ in 1...mix.count{
            if (NO1 == mix[seq - 1].SeedOne && NO2 == mix[seq - 1].SeedTwo) || (NO2 == mix[seq - 1].SeedOne && NO1 == mix[seq - 1].SeedTwo){
                returnNO = mix[seq - 1].MixNO
            }
            seq += 1
        }
        return returnNO
    }
}



