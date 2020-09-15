//
//  PropsData.swift
//  GrassCat
//
//  Created by Xyndi on 2020/8/12.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import Foundation
import RealmSwift

class PropsData: Object{
    @objc dynamic var Seq: Int = 0
    @objc dynamic var NO: Int = 0 //原NO
    @objc dynamic var Name: String = ""
    @objc dynamic var Image : String = "box0" // 預設顯示黑底圖->圖片名稱
    @objc dynamic var Amount : Int = 0 //目前持有數量
   
   
}
