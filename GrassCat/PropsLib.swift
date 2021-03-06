//
//  PropsLib.swift
//  GrassCat
//
//  Created by Xyndi on 2020/8/12.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import Foundation

struct PropSet{
    let NO: Int
    let Name: String
    let Image: String
    let Rate: Float //可縮時間比例（cat time * rate)
    let AddAmount: Int //增加可獲得種子數量
    let Effect: String //未來可能用上的其他種類效果
    let Info: String
}
struct PropLib{
    let props = [
        PropSet(NO:1,Name:"焦臉貓",Image:"potion01",Rate: 0.95 ,AddAmount: 0, Effect:"", Info:"焦臉貓藥水。\n\n像是麵包烤焦的臉，脖子上的閃電符號似乎在暗示著什麼？"),
        PropSet(NO:2,Name:"黑白貓",Image:"potion02",Rate: 1,AddAmount: 1, Effect:"", Info:"黑白貓藥水。\n\n渾身漆黑的紳士貓配上潔白的淑女貓，究竟代表了什麼意思呢？"),
        PropSet(NO:3,Name:"螢光貓",Image:"potion03",Rate: 0.9 ,AddAmount: 0, Effect:"", Info:"螢光色焦臉藥水。\n\n綠色的液體在黑暗中發著光，跟焦臉比起來好像更厲害了一些。")
        //PropSet(NO:3,Name:"紫色藥水",Image:"potion03",Rate: 0.9 ,AddAmount: 1, Effect:"", Info:"可以在些許減少種植時間的同時，些許增加收成時獲得的種子數量")
    ]
    
   
    mutating func getPropData(NO: Int) -> (Seq: Int, NO: Int, Name: String, Image : String){
    let SeqNow = realm.objects(PropsData.self).count + 1
        return (SeqNow,NO,props[NO - 1].Name, props[NO - 1].Image)
    }
    func getPropforSell(NO: Int) -> (Image : String, Cost: Int){
    
         return (props[NO - 1].Image, NO * 500)
     }
    func getInfo(NO: Int) -> String{
        return(props[NO - 1].Info)
    }
    func getName(NO: Int) -> String{
        return(props[NO - 1].Name)
    }
    func getEffects(NO: Int) -> (Rate: Float,AddAmount: Int,Effect: String){
        return(props[NO - 1].Rate,props[NO - 1].AddAmount,props[NO - 1].Effect)
    }
   
    
//    func propCost(NO:Int) -> Int{
//
//           return (NO * 500)
//       }
}
