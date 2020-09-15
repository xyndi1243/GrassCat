//
//  MainData.swift
//  GrassCat
//
//  Created by Xyndi on 2020/4/7.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import Foundation
import RealmSwift

class MainData: Object{
    @objc dynamic var mainMoney: Int = 0
    @objc dynamic var storyStatus: Bool = true //是否進入故事狀態
    @objc dynamic var mainStory: Int = 1 //儲存故事進度（以章為單位）
    @objc dynamic var train: Bool = false //是否進入教學模式
    @objc dynamic var mainCatName: String = "Miu"
    @objc dynamic var reviewStatus: Bool = false
    @objc dynamic var reviewStory: Int = 0
}
