//
//  SiteData.swift
//  GrassCat
//
//  Created by Xyndi on 2020/4/14.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import Foundation
import RealmSwift

class SiteData: Object{
    @objc dynamic var Site: String = "" //第幾個位置->直接放名字
    @objc dynamic var timer = Date() // 預設創建資料的時間->紀錄什麼時間可收成
    @objc dynamic var catSeq: Int = 0 // 改成catSeq&Image都要（
    @objc dynamic var seedImage: String = "cat0"
    @objc dynamic var siteImage: String = "box0" //
    @objc dynamic var flag: Bool = false //正在種/還沒收成flag = true

    @objc dynamic var plantTime: Int = 0 //總共要種幾秒
    @objc dynamic var plusSeed: Int = 0 //使用道具後可增加收成幾個種子
    @objc dynamic var propUsed: Bool = false//是否已使用過道具（只能用一次）
    @objc dynamic var propEffect: String = ""//其他種類道具效果
}

