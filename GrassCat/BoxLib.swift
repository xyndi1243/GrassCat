//
//  BoxLib.swift
//  GrassCat
//
//  Created by Xyndi on 2020/4/15.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import Foundation

struct BoxSet{
    let NO: Int
    let Name: String
    let Image: String
    let Rate: Float //可縮時間比例（cat time * rate)
    let AddAmount: Int //增加可獲得種子數量
       let Info: String
}
struct BoxLib{
    let boxes = [
        BoxSet(NO:1,Name:"厚紙箱",Image:"box01",Rate: 1,AddAmount: 0   ,Info:"普通的厚紙箱"),
        BoxSet(NO:2,Name:"牛奶箱",Image:"box02",Rate: 0.95,AddAmount: 1,Info:""),
        BoxSet(NO:3,Name:"舊花瓶",Image:"box03",Rate: 0.9,AddAmount: 1 ,Info:"")
    ]
    
   
    
//    mutating func getBoxesData(NO: Int) -> (Seq: Int, Name: String, Image : String, Rate: Float, AddAmount: Int){
//    self.SeqNow += 1
//        return (SeqNow,boxes[NO - 1].Name, boxes[NO - 1].Image, boxes[NO - 1].Rate,boxes[NO - 1].AddAmount)
//    }
    mutating func getBoxesData(NO: Int) -> (Seq: Int,NO: Int, Name: String, Image : String){
    let SeqNow = realm.objects(BoxesData.self).count + 1
        return (SeqNow,NO, boxes[NO - 1].Name, boxes[NO - 1].Image)
    }
    
    func getInfo(NO: Int) -> String{
        return(boxes[NO - 1].Info)
    }
    
    func getBoxforSell(NO:Int) -> (Image : String, Cost :Int){
           
        return (boxes[NO - 1].Image, NO * 500)
       }
}
