//
//  TrainLib.swift
//  GrassCat
//
//  Created by Xyndi on 2020/6/4.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import Foundation
import RealmSwift

struct TrainSet{
    let Tag: String
    let Words: String
}
struct Trains{
    
    
    let steps = [
        TrainSet(Tag:"CatSite", Words:"我跟你說衰……Miu！看到了嗎？這些黑漆漆貓貓！\n\n不要怕，大力戳！他又不會痛！"),
        
        TrainSet(Tag:"Seed00", Words:"鏘鏘！從這邊把要種的種子用力抓出來！"),
        TrainSet(Tag:"Box00", Words:"你看到紙箱了嗎？把種子塞塞塞塞進去！"),
        
        //
        TrainSet(Tag:"Confirm00", Words:"塞塞進去之後就——不對！還沒完啦！還要好好想想自己的心意啊！\n\n確定了的話，就用力想著願望！堅——定的！確認吧！"),
        //
        
        TrainSet(Tag:"PlantSeed1", Words:"對！\n\n然後就是耐心等它長——大——"),
        
        TrainSet(Tag:"WaitSeed1time", Words:""),//看五秒剛種下去的喵
        
        TrainSet(Tag:"PlantingSeed1", Words:"……太慢了！慢死了！我等不下去了啦！無敵楊桃星星先生——"),
        
        TrainSet(Tag:"PlantingSeed1", Words:"讚啦！欸，這次算是特別服務喔！星星說要幫你無敵流星加速！砰！"),
        
        TrainSet(Tag:"WaitSeed1time0", Words:""),//看一眼秒數歸0
        
        TrainSet(Tag:"Seed1Complete", Words:"你看！是貓貓！可以收成貓貓了，拔起來吧！\n\n咿呀——嘿！"),
        
        TrainSet(Tag:"GetSeeds", Words:"鏘鏘！新的魔法種子！"), //（獲得新種子）
        
        TrainSet(Tag:"MoreSeeds", Words:"就是這樣啦Miu！星星說了「我可是很大方的噠！」\n\n所以！這邊有很多未知種子，都拿去拿去拿去吧！"),
        //（物品庫中出現五個未知種子）
        
        //
        TrainSet(Tag:"", Words:"嗯——！接下來！就算衰臉也要學會獨立嘛！哭著求我也不幫你了！\n\n這次你就挑戰自己種一個魔法種子吧！"),
        //
        
        TrainSet(Tag:"CatSite_2Seed_1", Words:""),//種新的
        TrainSet(Tag:"Seed00_2Seed", Words:""),
        TrainSet(Tag:"Box00_2Seed", Words:""),
        TrainSet(Tag:"Confirm02", Words:""),
        TrainSet(Tag:"Wait2Seed", Words:""),//種下去等五秒
        
        //
        TrainSet(Tag:"SpeedUP", Words:"好——慢——喔！對啦！如果之後也慢死了！等不下去啦——的話！可以戳戳這邊催貓貓快一點喔！\n\n不過，這次還是先用星星的無敵流星加速吧！"),
        //
        TrainSet(Tag:"Seed2Complete", Words:"砰！鏘鏘！是貓貓！加速成功！\n\n好啦，繼續拔貓貓吧！咿呀——"),
        
        //（主角種出第二顆種子的時候）
        TrainSet(Tag:"GetSeed02", Words:"咦！咦欸欸！你有兩種不一樣的種子了耶！\n\n你知道會怎麼樣嗎？哈！不知道吧！"),
        
        TrainSet(Tag:"combine", Words:"那告訴你一個大秘密！你看看這個神奇的合成！戳戳！"),//（戳這個合成功能！）
        //
        TrainSet(Tag:"Combining1", Words:"選兩種不同的種子！戳戳！"),//
        TrainSet(Tag:"Combining2", Words:"選兩種不同的種子！兩種啦！戳！戳——！"),
        TrainSet(Tag:"", Words:"啊！對了！兩種種子都要五顆才可以充分混合哦！不到五顆——可沒辦法合成喔！"),
        TrainSet(Tag:"CombineConfirm", Words:"注意！這邊也要好好確認哦！別忘了喔？\n\n不要浪費了魔法種子，或合成大怪獸出來喔！"),
        //
        
        TrainSet(Tag:"GetCombineResult", Words:"然後——霹靂啪啦碰！"),//（得到新種子）
        
        TrainSet(Tag:"", Words:"我跟你說喔！\n\n你一定要多試幾種種子的組合喔！多試試看，多創新喔！"),//
        
        
        TrainSet(Tag:"Store", Words:"啊！對了！如果種子用完了，可以去那邊的商店買唷！\n\n要記住唷？"),//(指示商店?)
        
        
        TrainSet(Tag:"", Words:"♪ 種子用完了怎麼辦——？去商店！去商店！ ♪\n\n嘿，跟我唱一次。這會讓心情變好欸。"),
        
        TrainSet(Tag:"", Words:"♪ 種子用完了怎麼辦——去商店！去商店！ ♪\n\n♪ 去！商！店——！ ♪"),
        
        TrainSet(Tag:"", Words:"對啦，商店裡也有賣其他道具喔！"),
        TrainSet(Tag:"", Words:"道具只有在種子還沒長大的時候可以用，戳戳種貓咪用的土就可以把道具塞進去啦！"),
        TrainSet(Tag:"", Words:"♪ 想要道具怎麼辦——去商店！去商店！ ♪\n\n♪ 去！商！店——！ ♪"),
        
        TrainSet(Tag:"END", Words:"")
    ]
    
    var trainProgress = 0
    
    func getProgress() -> Int {
        return trainProgress //目前故事進度
    }
    
    mutating func getWords() -> (Tag: String, Words: String) {
         let str = steps[trainProgress].Words.replace(target: "Miu" ,withString: realm.objects(MainData.self)[0].mainCatName)
        return (steps[trainProgress].Tag, str)
    }
    
    mutating func nextProgress() { 
        
        trainProgress += 1

    }
    
    
}
