//
//  NSDate+Extension.swift
//  iOS_WB
//
//  Created by Alpha on 18/08/2017.
//  Copyright © 2017 STT. All rights reserved.
//

import UIKit


extension Date{
    
    
    static  func createDate(_ timeStr :String , _ formatterStr : String) -> Date{
        
        let formmat = DateFormatter()
        formmat.dateFormat = formatterStr
        formmat.locale = Locale.init(identifier: "en")
        let createDate = formmat.date(from: timeStr)
        return createDate!
        
    }
    // 生成当前时间对应的字符串
     func descriptionStr() -> String{
       let formatter = DateFormatter()
       formatter.locale = Locale.init(identifier: "en")
        var  textStr = ""
        var formtterStr = "HH:mm"
        let calendar = NSCalendar.current
        if calendar.isDateInToday(self){
            let interVal = Int(Date().timeIntervalSince(self))
            if interVal < 60 {
             return    "刚刚"
            }else if interVal < 60 * 60 {
              return  "\(interVal/60)一分钟以前"
            }else if  interVal < 60 * 60 * 24 {
              return "\(interVal/60/60/24)小时前"
            }
        }else if calendar.isDateInYesterday(self){
            formtterStr = "昨天 :" + formtterStr
        }else{
            // 获取两个时间 相差的
            let comps  =  calendar.dateComponents([Calendar.Component.year,Calendar.Component.month,Calendar.Component.day], from: self, to: Date())
            if comps.year! >= 1 {
                formtterStr = "yyyy-MM-dd " + formtterStr
            }else{
                // 1
                formtterStr = "MM-dd" + formtterStr
            }
        }
        
        formatter.dateFormat = formtterStr
        textStr = formatter.string(from: self)
        return textStr
    }
    
    
}
