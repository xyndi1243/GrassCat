//
//  SeedsData.swift
//  GrassCat
//
//  Created by Xyndi on 2020/7/26.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import Foundation
import RealmSwift

class SeedsData: Object{
    @objc dynamic var Seq: Int = 0 //進入DB的順序
    @objc dynamic var NO: Int = 0 //原NO
    @objc dynamic var Image : String = "cat0" // 預設顯示黑底圖->圖片名稱
    @objc dynamic var Name: String = ""
//    @objc dynamic var Time: Int = 0
//    @objc dynamic var Min: Int = 0 //可能獲得數量min
//    @objc dynamic var Max: Int = 0 //可能獲得數量max
//    @objc dynamic var MinMoney: Int = 0
//    @objc dynamic var MaxMoney: Int = 0
    @objc dynamic var Amount: Int = 0
    @objc dynamic var Spec: Bool = false
    
//    override class func primaryKey() -> String? {
//           return "Seq"
//       }
}
