//
//  StoryLib.swift
//  GrassCat
//
//  Created by Xyndi on 2020/4/24.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import Foundation
import RealmSwift


struct StorySet{
    //let NO: Int
    let Chara: String //說話角色名稱，若角色等於主角則圖片放在左邊，若是""則圖片放空，其他角色則把圖片放右邊//預設""=旁白
    //let CharaImage: String //角色圖片，如果是旁白則放空//預設""=旁白
    let Tag: String //故事圖片or輸入文字框or黑幕換頁
    let EndPoint: Bool  //是不是最後一句，如果true則是，要改 MainData.storyStatus = false 離開故事模式 //預設false
    let Lines: String //台詞
}

struct Stories{
    
    let Story1 = [
        StorySet(Chara:"", Tag: "story0_1",EndPoint:false, Lines: "好小好小的我，遇見了好小好小的你。"),
        StorySet(Chara:"", Tag: "story0_2",EndPoint:false, Lines: "我喜歡和淘氣的你一起玩遊戲，"),
        StorySet(Chara:"", Tag: "story0_3",EndPoint:false, Lines: "但討厭被調皮的你咬得慘兮兮。"),
        StorySet(Chara:"", Tag: "story0_4",EndPoint:false, Lines: "我知道你不是故意讓我哭泣，因為你每一次都會來安慰我。"),
        StorySet(Chara:"", Tag: "story0_5",EndPoint:false, Lines: "不管是開心的時候，"),
        StorySet(Chara:"", Tag: "story0_6",EndPoint:false, Lines: "還是難過的時候，"),
        StorySet(Chara:"", Tag: "",EndPoint:false, Lines: "你總是和我在一起。"),
        StorySet(Chara:"", Tag: "story0_7",EndPoint:false, Lines: "但我忘記了，我們的時間不一樣。"),
        StorySet(Chara:"", Tag: "story0_8",EndPoint:false, Lines: "我還在慢慢長大，你卻已經等不及變老。"),
        StorySet(Chara:"", Tag: "story0_9",EndPoint:false, Lines: "終於，你的時間永遠停住了。"),
        StorySet(Chara:"", Tag: "story0_10",EndPoint:false, Lines: "我知道我不能停止向前，"),
        StorySet(Chara:"", Tag: "story0_11",EndPoint:false, Lines: "但我總忍不住想——"),
        StorySet(Chara:"", Tag: "story0_12",EndPoint:false, Lines: "在天上的你，過的還好嗎？"),
        
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "姊姊⋯⋯姊姊你、怎麼又露出那麼悲傷的表情啊⋯⋯"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "就算沒有我你也要、不，你也能繼續過下去的。\n\n快開心起來吧⋯⋯！\n\n如果不在你身邊，你就如此悲傷的話⋯⋯"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "那我該怎麼辦才好啊⋯⋯？"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "哈囉——哈囉、哈囉！哈囉哈囉——！"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "⋯⋯看我！嘿、看我這邊，你這隻——呃⋯⋯哈！衰臉貓！\n\n嘿！衰臉貓！看我——你在聽嗎？雲底下有什麼好看的嗎？有罐罐嗎？嗯⋯⋯沒有啊？"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "嘿！聽我說話啦！衰臉貓！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "你有什麼事嗎。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "哈！終於看我了！\n\n聽我說啦，你身上有個味道。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "剛死的貓⋯⋯不是！貓天國菜鳥的味道！\n\n哈！你是剛來的對不對！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "⋯⋯？為什麼你會知道？"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "噢——！因為我看過這邊所有的貓！\n\n但是我沒看過你！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "⋯⋯我要走了。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "等等等等——！別走！不要走！我要說的是⋯⋯\n\n你身上還有煩惱的味道啦！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "這你又是怎麼知道的？"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "因為、你臉很臭啊！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "再見。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "啊啊啊啊啊不要生氣！不要走掉！\n\n我的意思是、我每次看到的臭臉貓通通都有煩惱。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "所以你！也！一定有！\n\n就比如說住在山坡那邊的大黑貓——"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "抱歉，請你安靜，我沒興趣。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "對了對了，不然還有住在池塘那邊的小灰貓——"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我說了請安靜。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "我不要！我才不要！我不會安靜的！"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "你不把你的煩惱告訴我，我就不安靜！說不定我可以幫你實現願望！\n\n不然你臉那麼臭！超臭的！大叔才會整天臭臉！你這衰臉貓！大叔貓！衰臉大叔貓！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "告訴你也沒有用⋯⋯\n\n實現不了的事情，不煩惱的話還能怎麼辦⋯⋯"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "你告訴我嘛告訴我嘛！說說看嘛！\n\n我可以幫你想辦法啊！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "也是，既然已經沒辦法了，那跟你說也無所謂吧。\n\n我啊，以前有個照顧我的人。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "哦哦，主人！有哦有哦！啊——！想回去主人身邊嗎？\n\n⋯⋯哇，大叔，這個真的不行耶。"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "不是想回去。\n\n是主人⋯⋯姊姊他，在我離開之後常常想念我，總是很難過的樣子。"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我很希望能讓他再一次笑起來、開心起來⋯⋯"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "衰臉貓你貓太好了！\n\n好、好感動！⋯⋯可是！這個我做不到耶！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "⋯⋯你說會想辦法的。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "我又沒說我會想到！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "⋯⋯"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "好啦、好啦！不要生氣嘛衰臉貓！不要難過嘛衰臉貓！"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "我跟你說，我認識一個能幫大家實現願望的傢伙喔！\n\n雖然他很奇怪啦但是啊——"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "那不用了。"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "（你已經夠奇怪了⋯⋯）"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "但是是真的啦！實現願望的事情是真的啦！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "⋯⋯那好吧。"),
        StorySet(Chara:"", Tag: "",EndPoint:false, Lines: "（⋯⋯）"),//換頁
        StorySet(Chara:"", Tag: "",EndPoint:false, Lines: "（⋯⋯⋯⋯）"),//換頁
        StorySet(Chara:"", Tag: "",EndPoint:false, Lines: "（⋯⋯好遠⋯⋯）\n\n（終於到了⋯⋯）"),//換頁
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "噹噹！噠噠！無助的小貓咪啊！\n\n你要許什麼願望哪！什麼願望都可以噠！"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "看！這就是我說的！可以跟他許願！"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "哈哈！我已經聽到你的心聲啦！無助的小貓咪！"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "你有什麼要拜託我的嗎？有吧？可以趕快拜託我噠！\n\n有什麼想求我的嗎？有吧？可以趕快求我噠！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "（⋯⋯好矮。）"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "求他！衰臉貓！求他！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "⋯⋯我不是衰臉貓⋯⋯小白。\n\n這位楊桃先生是怎麼回事？"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "哈！我就知道！我叫小黑！ \n\n在貓天國裡面已經有九百九十九隻貓叫我小白了！"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "楊桃先生——？哦！嘖嘖嘖、才不是哪！"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "我可是——萬能的偉大流星！無敵星星噠！\n\n在貓天國裡面已經有九百九十九隻貓叫我楊桃先生了！"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "哈！那這樣你就是第——"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "一千隻。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "你很無趣欸！"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "噢！對！我忘記介紹你們認識！\n\n你好啊衰臉貓我是小黑這位是無敵星星你好啊無敵星星你已經知道我是小黑了這位是衰——"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "等等，你不叫衰臉貓，那你叫什麼？"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "對對！不知道名字，我就不能用流星之力祝福你！\n\n告訴我你的煩惱吧！小貓咪！"),
        StorySet(Chara:"星星", Tag: "BeforeNamed",EndPoint:false, Lines: "當然，還有你的名字噠啦！"),
        StorySet(Chara:"", Tag: "NAMED",EndPoint:false, Lines: "請輸入你的名字："),//（輸入姓名）
        StorySet(Chara:"", Tag: "Confirm Name",EndPoint:false, Lines: "你的名字是 Miu 嗎？"),//（輸入姓名）
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "哦哦——嗯、嗯！Miu！你的煩惱我都知道了。\n\n不過，就算是我這麼萬能的無敵星星，還是有不能做的事情。"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "用流星之力輕鬆改變別人——這是犯規的！\n\n小貓咪呀小貓咪，你這樣不行噠！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "這樣嗎。那沒事了，對不起打擾了。"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "咦？欸！等等！我可是實現了九百九十八隻貓願望的萬能無敵星星欸！\n\n我一定會有替代方案的嘛！"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "這麼無助的小貓咪，我一定會給你特別待遇的嘛！\n\n幫助悲傷的可憐小貓咪們是我無敵星星的使命！怎麼樣？偉大吧？"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "你看，Miu，星星每次的替代方案都很可靠喔！"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "每次？不不不，是小貓咪們總是太依賴無敵星星了，我只好給他們一點點挑戰⋯⋯\n\n對！對啊！所以啊，看在你剛好是我的第九百九十九號許願小貓咪的份上⋯⋯"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "雖然不能直接幫你把姊姊小姐變開心，不過無敵星星可以給你特別服務噠！\n\n就是這個！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "種子⋯⋯？"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "是！噠！\n\n這是魔法種子！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "好像很厲害⋯⋯"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "是！噠！\n\n收成之後可以幫你實現願望！怎樣，很厲害吧！"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "收成之後會得到新的魔法種子喔！怎樣，很厲害吧！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我的願望是種子嗎。"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "錯！噠！噗噗——\n\n就算是萬能無敵星星，也種不出開心的姊姊小姐噠！"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "但是哪、如果是無助的可愛小貓咪的話——！嗯嗯！"),
        StorySet(Chara:"星星", Tag: "",EndPoint:false, Lines: "魔法種子雖然可以幫你實現願望，但是，一開始不一定能成功種出最想要的東西喔！\n\n不過，不停修正，搞清楚自己的心意的話，一定可以辦到的！"),
        StorySet(Chara:"星星", Tag: "",EndPoint:true, Lines: "畢竟！沿途的風景才是最美麗的嘛！哇哈哈哈哈哈！")
    ]
    let Story2 = [
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "……！\n\n是……罐頭啊，這款式挺讓貓懷念的。\n\n差不多要習慣這些怪貓了，但這個竟然也會出現，嚇我一跳……\n\n真捉弄貓……"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "哈囉！哈囉——！哈——囉！\n\n欸！Miu！你拿著甚麼，該不會是罐罐吧？啊——真的是罐罐欸！\n\n我要吃！我要吃我要吃我要吃！"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "不是吧……？\n\n這是用種子種出來的喔，不管怎麼想……不對。\n\n不用想都知道不是正常罐頭吧。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "有什麼關係！那是魔法種子耶！\n\n一定可以吃的啦！我要吃！\n\n我好久沒吃罐罐了！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "你可不可以有點危機意識……別亂吃東西，很危險。\n\n……不過，雖然也不一定是壞事。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "喔！喔喔！意思就是我可以吃吧！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "不要吃。\n\n你是光一個罐頭就能隨便把你拐去賣的類型吧。\n\n雖然……幸運的話，也有不是那樣的時候。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "有例外？哈！那就沒問題啦！\n\n我是幸運幸運的幸運小黑欸，我跟你說，我一到貓天國，就遇到無敵星星……\n\n咦？所以說果然可以吃嘛？那我要吃囉——！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "……！不准碰！\n\n這是我的罐頭……誰都、誰都不准拿走！！！"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "嗚哇啊啊啊為甚麼生氣！小氣欸！我不吃就是了嘛！幹嘛兇巴巴！\n\n小氣貓！兇巴貓！小氣兇巴貓！"),
        
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "嗚哇……真是的，只是一個罐頭而已耶……？\n\n嗚哇……你是不是以前常常肚子餓啊……嗚哇——"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "……你為什麼會想到那裡。\n\n我以前過得很好，不可能餓肚子。\n\n之前不是說過了嗎，姊姊一直很照顧我。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "咦——！咦！那你為什麼那麼兇！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "是嗎？我、很兇嗎。我想……也沒為什麼。\n\n我、今天說不定、比較急躁。\n\n大概是因為我……我特別、特別喜歡吃罐頭的原因吧。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "是喔？那也沒辦法啦——！對了，我是乾乾派的喔！\n\n啊！因為你吃太多罐罐了！才變胖！胖胖脾氣會變糟！你看你！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我沒常吃罐頭，小黑。\n\n應該說，只有特別的時候才吃。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "啊——！原來如此！\n\n所以是平常吃不起的期間限定？高級？超好吃貓罐罐的原因嗎！\n\n嗚哇……你是不是以前很窮啊……嗚哇——"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "……你又為什麼會想到那裡。\n\n好吃，但是沒有厲害成那樣。因為平常的食物就很棒，罐頭好像也沒有特別好吃了……\n\n啊、所以、大概跟好吃沒關係嗎。"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "不過，有罐頭吃的時候，心情會特別好。\n\n大概、特別的時候都會有，所以才覺得罐頭也是特別……"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "嗯，罐頭是、特別的吧。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "沒有什麼神奇效果嗎？太無聊了吧！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "……吃了病會好，算嗎？"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "騙——誰——啊——！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "對了，就是在每次身體不舒服，全身虛弱的時候。\n\n吃了罐頭之後，忽然就好像有好幾倍的力氣一樣，沒多久身體就好起來了。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "衰臉……你是光一個可疑的賣藥爺爺就能隨便把你拐去賣的類型吧。"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "還有剛結紮完那天，麻藥都還沒退，我就一直偷吃東西。\n\n不過一吃就吐，又餓又難受。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "嘿！沒蛋蛋！\n\n沒蛋蛋衰臉貓！你已經無視我兩次了！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "好不容易麻藥退了，姊姊拿罐頭給我的時候，\n\n感覺真的是得救了。"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "但是最誇張的還是一年一次的罐頭大餐吧。\n\n一口氣會有好幾個不同口味的罐頭。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "聽起來好厲害……"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "嗯……疊的高高的，做成蛋糕的樣子。\n\n真的還滿厲害的。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "這次竟然沒有無視我！\n\n這就是生日大餐的力量嗎！！！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "生日嗎……嗯、好像、可以那麼說吧。"),
        
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我以前很小的時候……其實，我記不太清楚了。\n\n因為我已經不用粘著媽媽喝奶了也說不定，某天開始，我忽然就找不到媽媽了。\n\n我只記得那時候我……成為姊姊家一分子之前，住在街底的小巷子裡。"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "說是住，其實也只是待著。因為那邊夏天曬不到太陽，冬天吹不到風。\n\n而且，有個人都會定期放食物在附近。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "哇！那你一定吃的很飽吧——等等，你現在這麼肥，該不會就是那時候吃來的吧！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "啊？不是。\n\n……我沒有真的吃到過那些東西。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "嗚哇……所以你果然是常常餓肚子才對罐……"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我說了不是。\n\n應該說你大錯特錯，事情剛剛好相反。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "相反？噢——所以你是很挑罐罐，才會餓肚子？\n\n沒事啦！挑食的心情我懂哦！我超懂的！\n\n像我只喜歡吃……"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "每次那個人帶食物來這裡的時候，貓就會從各個地方聚集過來。\n\n他們滿足的樣子，我看了很羨慕。\n\n至於我呢，跟媽媽走散之後，別說吃飽了，根本半點食物都沒找到。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "欸！你又無視我！雖然我很想聽故事啦！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "所以，我好幾次想加入他們。\n\n他們總是很和樂的一起吃罐頭，沒看過他們搶東西或吵架，我想應該很容易加入也說不定。\n\n現在回憶起來，真的是很可笑的猜想。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "喂喂——聽我——說話！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我好幾次想加入那群貓，或者試著從旁邊拿到一點食物。\n\n不過，體型比我大上好多倍的貓，對著發出很兇的「哈——！」的聲音，把我遠遠的趕到巷子口去。而且……"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "他們跟我說……\n\n「這裡沒有屬於你的位置。」"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "太惡劣了吧！不要難過哦，衰……Miu！\n\n我身邊的位置現在開始是你的喔！\n\n你專屬的哦！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "後來我才知道，那附近雖然貓不算非常多，但食物也只是剛好夠他們吃而已。\n\n住在巷子裡的流浪貓們，不會冒著餓肚子的風險把食物分給其他貓的。\n\n就算用搶的，小貓也搶不過其他貓。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "嘿！你又不聽我說話！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "有下午出來玩的小孩子，有小鳥跟蝴蝶……白天的巷子很好玩又很熱鬧。\n\n不過，晚上的巷子……還挺冷的。\n\n如果，那天沒有找食物的話，感覺就更冷了。\n\n我現在才想起來，那時候什麼都覺得好好玩的心情……"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "哇……原來Miu你、你也有覺得世界有趣的時候！\n\n你！你也有不是衰臉貓的時候！\n\n我的天啊……你幹嘛不一直在那邊玩就好了，要變成現在這樣……"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "還有……感覺沒有力氣睜開眼睛的感覺。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "……\n\n那、那個……\n\nMiu……？我、我是說——"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "接著我就吃了別人給的罐頭。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "噢，原來如此，太好——啊？咦！咦？\n\n那、那你還有資格說我！\n\n你憑什麼說我亂吃東西！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "挺好笑的……確實沒資格。"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "別的貓跟我說過，還不知道安不安全，就不要吃人類餵的東西，也不要隨便靠近人類。\n\n這大概是他們對我唯一的照顧。"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "……有個人類很奇怪。\n\n我認得那個人。他就是身上充滿食物香味，每次都被大貓們包圍的人。\n\n可是不知道為甚麼，明明旁邊有其他更大、更厲害的貓，那一天他卻直直向我走過來。"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "他應該不是危險的人。那他過來做什麼？為什麼對我伸出手？\n\n我想，說不定是因為在這裡沒有我的位置，他也要把我趕走了……"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "正這麼想的時候，他就把罐頭推過來了。\n\n他沒有靠近我，只是把罐頭放下，然後走的遠遠的。\n\n打開的罐頭很香，我第一次這麼近聞到那種味道。"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我知道他在很遠的牆邊偷偷看著我。\n\n我想了想大貓們吃東西的樣子，還是把頭埋進罐頭裡，大口大口吃起來。"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我一下子都沒停，罐頭馬上就被我吃完了。\n\n罐頭真的很好吃，我覺得，就算我明天不能跟小鳥和蝴蝶一起玩了，至少我吃過大貓們常常說的罐頭了。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "不——要——吃——！\n\n蠢蛋貓！衰蠢貓！你要被抓走了！\n\n會被喀嚓！會被掰掰！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "嗯，我聽過太多跟流浪貓有關的恐怖故事了。\n\n吃完罐頭以後，我豎著耳朵，整個晚上沒睡覺。\n\n我想，那個奇怪的人類過來的時候，我一定要馬上逃跑。"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "但他走掉了。\n\n什麼都沒發生。"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "到了隔天早上、再隔天早上、又隔天早上……\n\n一直到我再次看見他，也什麼都沒發生。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "咦……？騙貓！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我不知道看見他幾次了。\n\n他每一次來找大貓們，都會放一個罐頭在我前面。\n\n只放在我前面的罐頭。\n\n雖然他都只會遠遠的看著我，但我想，應該可以離他再近一點點也沒關係。"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我越來越常吃完一個罐頭之後還是很餓，那一天也一樣。\n\n不過我還在想要怎麼告訴他「再給我一個罐頭」的時候，他就轉身走掉了。\n\n我不想等他下次過來，那樣太慢了。"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "不過我相信在這個人身邊就一定有罐頭吃。\n\n於是，我一路跟在他的後面走。"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我只是想要常常吃到罐頭而已。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "噢！貪吃鬼！\n\n嘿——！我開始覺得你是跟我同一邊的貓了！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "我可不覺得。\n\n對了，那個人走到一隻噴著熱氣，屁股發著光，大聲轟轟亂叫的怪獸旁邊。\n\n我跟著他一起鑽進怪獸肚子裡，在他旁邊充滿罐頭香味的紙箱裡窩了下來。"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "接著，怪獸一路邊轟轟叫邊搖晃，晃得我頭好暈。\n\n好不容易不晃了，我在箱子裡還暈的站也站不穩的時候，我看到一雙大眼睛盯著我。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "你就這樣被拐走了……嗚哇……"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "就像那些巷子裡的小孩子一樣、但我不認識的人類的臉，從箱子邊緣探頭進來。\n\n他輕輕跟我說，之後他就是我的姊姊了。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "是！是小小小小的姊姊小姐！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "嗯，都是因為那個罐頭，我永遠回不去那條巷子了。\n\n……畢竟，我再也不需要回去了。"),
        
        StorySet(Chara:"", Tag: "",EndPoint:false, Lines: "鏘啦——！是你專屬的蛋糕喔！"),
        StorySet(Chara:"", Tag: "",EndPoint:false, Lines: "我想啊，乾脆每年在相遇的那一天，吃貓罐頭蛋糕慶祝吧！"),
        StorySet(Chara:"", Tag: "",EndPoint:false, Lines: "你這個喜歡吃罐頭的小貪吃鬼。"),
        StorySet(Chara:"", Tag: "",EndPoint:false, Lines: "生日快樂！"),
        
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "原來啊、是因為這樣嗎。\n\n喂……你在做什麼……"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "嗚、嗚噫、太好了喔……你變成幸福快樂的衰臉貓真是太好了……\n\n這個、好感人喔……罐罐真是太棒了……\n\n嗚噫、嗚噫噫……對不起哦Miu，我不應該隨便想吃你的罐罐的……"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "不要這樣，你要把他捏爛了，他看起來好痛。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "我要捏！罐頭又不會痛！可是、可是我的心好痛喔……\n\n嗚哇啊啊……嗚嗚……"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "……可是，這不是罐頭。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "哪有，他就是罐——\n\n嗚哇啊啊啊啊啊原來是貓貓！嗚哇……\n\n對不起喔貓貓，嚇到你了嗎貓貓……\n\n我真的不是故意要吃掉你的，我是不小心的喔！"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "咦？貓貓？你要去哪裡？\n\n貓貓！回來！你是重要的罐罐！不可以走！\n\n貓貓！你是因為我捏你所以生氣了嗎！我不是故意要捏你的啦！\n\n你回來啦！不然Miu要變成衰衰衰臉貓了！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "果然……就算是這個也一樣嗎。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "追他啊！衰臉貓！\n\n罐罐、貓貓？罐罐？總之貓貓要消失了啦！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "嗯。到現在為止，本來就一隻也沒有留下來啊。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "可是！可是！可是他不一樣！他是罐罐！\n\n你剛剛對我那麼兇！我以為這罐罐對你很重要欸！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "嗯。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "那！你！就！去——追———啊！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:false, Lines: "不用了。"),
        StorySet(Chara:"小黑", Tag: "",EndPoint:false, Lines: "為甚麼！為甚麼為甚麼為甚麼！\n\n衰臉貓你記性那麼差！沒有罐罐，你就不記得自己是幸福快樂貓貓！\n\n那可是幸福快樂罐罐欸！"),
        StorySet(Chara:"主角", Tag: "",EndPoint:true, Lines: "……沒關係。\n\n我覺得，我不會再忘記了。")
        
    ]
    var storyProgress = 0
    func getProgress() -> Int {
        return storyProgress //目前故事進度
    }
    
    mutating func getStory(_ chap: String) -> (Chara: String, Image:String, Tag: String, EndPoint: Bool, Lines: String) {
        var Image = "blank"

        switch chap {
            
        case "Story1":
            if realm.objects(MainData.self)[0].reviewStatus == true{
                if Story1[storyProgress].Tag == "NAMED"{
                    storyProgress += 2
                }
                
            }
             let str = Story1[storyProgress].Lines.replace(target: "Miu" ,withString: realm.objects(MainData.self)[0].mainCatName)
            
//            if Story1[storyProgress].Tag == "story0"{
//                Image = Story1[storyProgress].Chara
//            }
//            else{
                switch Story1[storyProgress].Chara{
            case "主角":
                Image = "lead1"
            case "星星":
                Image = "star1"
            case "小黑":
                Image = "kuro1"
            default:
                Image = "blank"
            }
//            }
            
            return (Story1[storyProgress].Chara, Image, Story1[storyProgress].Tag, Story1[storyProgress].EndPoint, str)
        case "Story2":
            let str = Story2[storyProgress].Lines.replace(target: "Miu" ,withString: realm.objects(MainData.self)[0].mainCatName)
            switch Story2[storyProgress].Chara{
            case "主角":
                Image = "lead1"
            case "星星":
                Image = "star1"
            case "小黑":
                Image = "kuro1"
            default:
                Image = "blank"
            }
            return (Story2[storyProgress].Chara, Image, Story2[storyProgress].Tag, Story2[storyProgress].EndPoint, str)
        default:
            let str = Story1[storyProgress].Lines.replace(target: "Miu" ,withString: realm.objects(MainData.self)[0].mainCatName)
            return (Story1[storyProgress].Chara, Image, Story1[storyProgress].Tag, Story1[storyProgress].EndPoint, str)
        }
    }
    mutating func reNamed() {
        storyProgress -= 2
    }
    mutating func nextProgress(_ end: Bool){
        if end == false {
           
            storyProgress += 1
        }
        else if realm.objects(MainData.self)[0].storyStatus == true {
            storyProgress = 0
            try! realm.write {
                realm.objects(MainData.self)[0].storyStatus = false
                realm.objects(MainData.self)[0].mainStory += 1
            }
        }
        else{
            storyProgress = 0
            try! realm.write{
                realm.objects(MainData.self)[0].reviewStatus = false
            }
        }
    }
    mutating func nextProgress_Story(_ end: Bool){
        if end == false {
            storyProgress += 1
        }
        else {
            storyProgress = 0
        }
    }
    
}


struct StoryReview {
    let storyNO: Int
    let Image: String
    let Name: String
}
struct StoryReviewContent{
    let StoryReviews = [
        StoryReview(storyNO: 1,Image:"cat0", Name: "來到貓天國"),
        StoryReview(storyNO: 2,Image:"cat05", Name: "珍貴的罐頭")
    ]
    
    func getStoryTitle(NO:Int) -> (Image: String, Name: String){
        return(StoryReviews[NO].Image, StoryReviews[NO].Name)
    }
}
extension String{
    func replace(target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}

