//
//  BoxData.swift
//  GrassCat
//
//  Created by Xyndi on 2020/7/28.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import Foundation
import RealmSwift

class BoxesData: Object{
    @objc dynamic var Seq: Int = 0 //進入DB的順序
    @objc dynamic var NO: Int = 0 //原NO
    @objc dynamic var Name: String = ""
    @objc dynamic var Image : String = "box0" // 預設顯示黑底圖->圖片名稱
//    @objc dynamic var Rate: Float = 0.0
//    @objc dynamic var AddAmount: Int = 0
   
   
}
