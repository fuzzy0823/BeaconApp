//
//  Logger.swift
//  BeaconApp
//
//  Created by r.nakamori on 2014/11/11.
//  Copyright (c) 2014年 Takahashimoto. All rights reserved.
//

import Foundation

/*
ログ出力時に、ファイル名、メソッド名、行を出力
Sample : Logger.log("hogehoge")
*/
class Logger {
     func log(message:String,
        function:String = __FUNCTION__,
        file:String = __FILE__,
        line:Int = __LINE__){
            var filename = file
            if let match = filename.rangeOfString("[^/]*$", options: .RegularExpressionSearch){
                filename = filename.substringWithRange(match)
            }
            println("Log:\(filename):L\(line):\(function) \"\(message)\"")
    }
}
