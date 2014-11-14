//
//  LSManager.swift
//  BeaconApp
//
//  Created by design on 2014/11/14.
//  Copyright (c) 2014年 Takahashimoto. All rights reserved.
//

import Foundation

class LSManager{
    class var lsmanager :LSManager{
        struct Static {
            static let instance = LSManager()
        }
        return Static.instance
    }
    
//    private let UserNumber = "UserNumber"
//    private let PassWord = "PassWord"
    
    // ローカルストレージ保存処理
    // LSManager.lsmanager.setLS("KEY", value: "VALUE")
    func setLS(key : String, value : String){
            NSUserDefaults().setValue(value, forKey: key)
            NSUserDefaults().synchronize()
            println("[setLS]key:" + key + ", value:" + value)
    }

    // ローカルストレージ取得処理(型不問)
    func getLSAnyObject(key : String) -> AnyObject{
        var value :AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey(key) //もしくはvalueForKey？
        return value
    }
    
    // ローカルストレージ取得処理(String)
    func getLSString(key : String) -> String{
        var value :String? = NSUserDefaults.standardUserDefaults().stringForKey(key)
        // ローカルストレージの取得に失敗した場合
        if value == nil{
            value = "";
            setLS(key, value: "")
        }
        return value!
    }

}
