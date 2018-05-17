//
//  GlobalFunction.swift
//  network-swift
//
//  Created by zhouyu on 2018/5/17.
//  Copyright © 2018年 zhouyu. All rights reserved.
//

import Foundation

func DLog<T>(_ message:T, file:String = #file, function:String = #function,
             line:Int = #line) {
    #if DEBUG
    //获取文件名
    let fileName = (file as NSString).lastPathComponent
    //打印日志内容
    print("\(fileName):\(line) \(function) | \(message)")
    #endif
}
