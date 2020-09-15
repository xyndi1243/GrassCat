//
//  SoundData.swift
//  GrassCat
//
//  Created by Xyndi on 2020/9/5.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import Foundation
import RealmSwift

class SoundData: Object{
    @objc dynamic var musicOpen: Bool = true
    @objc dynamic var soundOpen: Bool = true
    @objc dynamic var musicVolume: Float = 1 //預設音量1為中間，0~2
    @objc dynamic var soundVolume: Float = 1
   
}
